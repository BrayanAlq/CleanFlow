package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.FromToInstant;
import com.example.cleanflowback.dto.in.FinishRouteBodyRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.exception.RouteConflictException;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.mapper.PointMapper;
import com.example.cleanflowback.mapper.RouteMapper;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.*;
import com.example.cleanflowback.service.PushNotificationService;
import com.example.cleanflowback.service.RouteService;
import com.example.cleanflowback.specification.RouteSpecifications;
import com.example.cleanflowback.utils.InstantUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

@Service
@AllArgsConstructor
public class RouteServiceImpl implements RouteService {
    private final DriverRepository driverRepository;
    private final RouteRepository routeRepository;
    private final RouteMapper routeMapper;
    private final ResidentRepository residentRepository;
    private final GeneratedRouteRepository generatedRouteRepository;
    private final DeviceTokenRepository deviceTokenRepository;
    private final PushNotificationService pushNotificationService;
    private final PointMapper pointMapper;

    @Override
    public RouteResponseDTO createRoute(DriverEntity driver) {
        // driver only can have one route with started status
        if (routeRepository.existsByDriverAndStatus(driver, RouteStatusEnum.STARTED)) {
            throw new RouteConflictException("Driver only can have one started route");
        }

        RouteEntity routeEntity = new RouteEntity();
        routeEntity.setDriver(driver);

        FromToInstant fromToInstant = InstantUtil.getFromToInstant("America/Lima");

        GeneratedRouteEntity generatedRoute = generatedRouteRepository.getByDriverIdAndDate(driver.getId(), fromToInstant.from(), fromToInstant.to())
            .orElseThrow(() -> new ResourceNotFoundException("No route generated yet"));

        List<Long> containersInPath = generatedRoute.getGeneratedContainers().stream()
            .map(gc -> gc.getContainer().getId())
            .toList();

        List<Long> usersInRoute = residentRepository.findAllInRoutePoints(containersInPath);

        List<String> devices = deviceTokenRepository.findAllByUserIds(usersInRoute).stream()
            .map(DeviceTokenEntity::getToken)
            .toList();

        pushNotificationService.sendBatch(
            devices,
            "\uD83D\uDE9B Recolección iniciada",
            "El camión recolector ha iniciado su recorrido. Te avisaremos cuando esté cerca de tu ubicación."
        );

        return (routeMapper.fromEntityToDTO(routeRepository.save(routeEntity)));
    }

    @Override
    public void finishRoute(DriverEntity driverEntity, Long routeId, FinishRouteBodyRequestDTO requestDTO) {
        RouteEntity routeEntity = routeRepository.findById(routeId)
            .orElseThrow(() -> new ResourceNotFoundException("Route not found"));

        if (!routeEntity.getDriver().getId().equals(driverEntity.getId())) {
            throw new UnauthorizedAccessException("You cannot finish this route because you are not owner");
        }

        routeEntity.setStatus(RouteStatusEnum.FINISHED);
        routeEntity.setEndAt(Instant.now());
        routeEntity.setPolyline(requestDTO.polyline());
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

    @Override
    public List<PointResponseDTO> getPointsByRouteId(DriverEntity driver, Long routeId) {
        RouteEntity route = routeRepository.findById(routeId)
            .orElseThrow(() -> new ResourceNotFoundException("Route not found"));

        if (!route.getDriver().getId().equals(driver.getId())) {
            throw new UnauthorizedAccessException("You are not allowed to access this route");
        }

        return route.getPoints().stream()
            .map(pointMapper::fromEntityToDTO)
            .toList();
    }
}
