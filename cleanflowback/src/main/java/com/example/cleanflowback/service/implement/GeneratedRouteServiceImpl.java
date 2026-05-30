package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.dto.GeneratedRouteCursorDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
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
import java.time.LocalDateTime;
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
        GeneratedRouteCursorDTO cursorPass = cursor != null ? cursorUtil.decode(cursor) : null;

        GeneratedCursorInternalDTO cursorInternal = null;

        if (cursorPass != null) {
            cursorInternal = new GeneratedCursorInternalDTO(
                Instant.parse(cursorPass.createdAt()), cursorPass.id()
            );
        }

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

        GeneratedRouteCursorDTO nextCursorDto = routes.isEmpty()
            ? null
            : new GeneratedRouteCursorDTO(routes.getLast().getId(), routes.getLast().getCreatedAt().toString());

        return new CursorPageWithEncodedResponseDTO<>(
            cursorUtil.encode(nextCursorDto),
            routes.stream()
                .map(r ->
                    new GeneratedRouteResponseDTO(
                        r.getId(),
                        driverMapper.toInfoDTO(r.getDriver()),
                        r.getPolylines().stream().map(polylineMapper::fromEntityToDTO).toList(),
                        r.getCreatedAt()
                    )
                ).toList(),
            hasNext
        );
    }

    @Override
    public Optional<GeneratedRouteResponseDTO> getGeneratedRouteByDriver(Long driverId) {
        DriverEntity driver = driverRepository.findById(driverId).orElseThrow(
            () -> new ResourceNotFoundException("driver not found")
        );

        return generatedRouteRepository.getByDriverIdAndDate(driverId, LocalDate.now())
            .map(gr -> new GeneratedRouteResponseDTO(
                gr.getId(),
                driverMapper.toInfoDTO(gr.getDriver()),
                gr.getPolylines().stream().map(polylineMapper::fromEntityToDTO).toList(),
                gr.getCreatedAt()
            ));
    }
}
