package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.dto.GeneratedRouteCursorDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedContainerResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.DriverMapper;
import com.example.cleanflowback.mapper.PolylineMapper;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.model.GeneratedRouteEntity;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.repository.GeneratedRouteRepository;
import com.example.cleanflowback.service.GeneratedRouteService;
import com.example.cleanflowback.utils.CursorUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class GeneratedRouteServiceImpl implements GeneratedRouteService {
    private final GeneratedRouteRepository generatedRouteRepository;
    private final PolylineMapper polylineMapper;
    private final DriverMapper driverMapper;
    private final CursorUtil cursorUtil;
    private final DriverRepository driverRepository;

    @Override
    public CursorPageWithEncodedResponseDTO<GeneratedRouteResponseDTO> getGeneratedRoutes(
        Long driverId, LocalDate date, String cursor, Integer size
    ) {
        GeneratedCursorInternalDTO cursorInternal = cursor == null ? null : cursorUtil.decode(cursor);

        if (size == null) {
            size = 10;
        }

        List<GeneratedRouteEntity> routes = generatedRouteRepository.getAllWithSpecs(
            driverId, date, size + 1, cursorInternal
        );

        boolean hasNext = routes.size() > size;

        if (hasNext) {
            routes.removeLast();
        }

        Long nextCursor = routes.isEmpty()
            ? null
            : routes.getLast().getId();

        GeneratedCursorInternalDTO nextCursorDto = routes.isEmpty()
            ? null
            : new GeneratedCursorInternalDTO(routes.getLast().getCreatedAt(), routes.getLast().getId());

        return new CursorPageWithEncodedResponseDTO<>(
            routes.stream()
                .map(r ->
                    new GeneratedRouteResponseDTO(
                        r.getId(),
                        driverMapper.toInfoDTO(r.getDriver()),
                        r.getPolylines().stream().map(polylineMapper::fromEntityToDTO).toList(),
                        mapContainers(r),
                        r.getCreatedAt()
                    )
                ).toList(),
            hasNext,
            cursorUtil.encode(nextCursorDto)
        );
    }

    @Override
    public Optional<GeneratedRouteResponseDTO> getGeneratedRouteByDriver(Long driverId) {
        DriverEntity driver = driverRepository.findById(driverId).orElseThrow(
            () -> new ResourceNotFoundException("driver not found")
        );

        ZoneId zoneId = ZoneId.of("America/Lima");
        LocalDate today = LocalDate.now(zoneId);
        Instant from = today.atStartOfDay(zoneId).toInstant();
        Instant to = today.atStartOfDay(zoneId).plusDays(1).toInstant();

        return generatedRouteRepository.getByDriverIdAndDate(driverId, from, to)
            .map(gr -> new GeneratedRouteResponseDTO(
                gr.getId(),
                driverMapper.toInfoDTO(gr.getDriver()),
                gr.getPolylines().stream().map(polylineMapper::fromEntityToDTO).toList(),
                mapContainers(gr),
                gr.getCreatedAt()
            ));
    }

    private List<GeneratedContainerResponseDTO> mapContainers(GeneratedRouteEntity route) {
        if (route.getGeneratedContainers() == null) return List.of();
        return route.getGeneratedContainers().stream()
            .map(gc -> {
                var c = gc.getContainer();
                return new GeneratedContainerResponseDTO(
                    c.getId(),
                    c.getName(),
                    c.getAddressName(),
                    c.getLatitude(),
                    c.getLongitude(),
                    gc.getVisitOrder()
                );
            })
            .toList();
    }
}
