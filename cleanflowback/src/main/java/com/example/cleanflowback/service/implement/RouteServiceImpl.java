package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.exception.RouteConflictException;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.mapper.RouteMapper;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.model.RouteEntity;
import com.example.cleanflowback.model.RouteStatusEnum;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.repository.RouteRepository;
import com.example.cleanflowback.service.RouteService;
import com.example.cleanflowback.specification.RouteSpecifications;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@AllArgsConstructor
public class RouteServiceImpl implements RouteService {
    private final DriverRepository driverRepository;
    private final RouteRepository routeRepository;
    private final RouteMapper routeMapper;

    @Override
    public RouteResponseDTO createRoute(DriverEntity driver) {
        if (!driverRepository.existsById(driver.getId())) {
            throw new ResourceNotFoundException("Driver not found");
        }

        // driver only can have one route with started status
        if (routeRepository.existsByDriverAndStatus(driver, RouteStatusEnum.STARTED)) {
            throw new RouteConflictException("Driver only can have one started route");
        }

        RouteEntity routeEntity = new RouteEntity();
        routeEntity.setDriver(driver);

        return (routeMapper.fromEntityToDTO(routeRepository.save(routeEntity)));
    }

    @Override
    public void finishRoute(DriverEntity driverEntity, Long routeId) {
        if (!driverRepository.existsById(driverEntity.getId())) {
            throw new ResourceNotFoundException("Driver not found");
        }

        RouteEntity routeEntity = routeRepository.findById(routeId)
            .orElseThrow(() -> new ResourceNotFoundException("Route not found"));

        if (!routeEntity.getDriver().getId().equals(driverEntity.getId())) {
            throw new UnauthorizedAccessException("You cannot finish this route because you are not owner");
        }

        routeEntity.setStatus(RouteStatusEnum.FINISHED);
        routeEntity.setEndAt(LocalDateTime.now());
        routeRepository.save(routeEntity);
    }

    @Override
    public CursorPageResponseDTO<RouteCompleteResponseDTO> getRoutesWithFilter(
        LocalDate date, Long driverId, Long cursor, Integer size
    ) {
        Specification<RouteEntity> specs = Specification.unrestricted();

        if (date != null) {
            specs = specs.and(RouteSpecifications.hasDate(date));
        }

        if (driverId != null) {
            specs = specs.and(RouteSpecifications.hasDriverId(driverId));
        }

        if (size == null) {
            size = 10;
        }

        List<RouteEntity> routeEntities = routeRepository.findAllRoutes(specs, cursor, size + 1);

        boolean hasNext = routeEntities.size() > size;

        if (hasNext) {
            routeEntities.removeLast();
        }

        Long nextCursor = routeEntities.isEmpty()
            ? null
            : routeEntities.getLast().getId();


        return new CursorPageResponseDTO<>(
            routeEntities.stream().map(routeMapper::fromEntityToCompleteDTO).toList(),
            nextCursor,
            hasNext
        );
    }
}
