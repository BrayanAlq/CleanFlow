package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.ContainerNearByPointRawDTO;
import com.example.cleanflowback.dto.FromToInstant;
import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.dto.GeneratedRouteCursorDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.DriverHomeResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedContainerResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ContainerImageMapper;
import com.example.cleanflowback.mapper.DriverMapper;
import com.example.cleanflowback.mapper.MetricMapper;
import com.example.cleanflowback.mapper.PolylineMapper;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.model.GeneratedRouteEntity;
import com.example.cleanflowback.model.MetricEntity;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.repository.GeneratedRouteRepository;
import com.example.cleanflowback.repository.MetricRepository;
import com.example.cleanflowback.service.GeneratedRouteService;
import com.example.cleanflowback.utils.CursorUtil;
import com.example.cleanflowback.utils.InstantUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@AllArgsConstructor
public class GeneratedRouteServiceImpl implements GeneratedRouteService {
    private final GeneratedRouteRepository generatedRouteRepository;
    private final PolylineMapper polylineMapper;
    private final DriverMapper driverMapper;
    private final CursorUtil cursorUtil;
    private final DriverRepository driverRepository;
    private final ContainerImageMapper containerImageMapper;
    private final MetricRepository metricRepository;
    private final MetricMapper metricMapper;
    private final ContainerRepository containerRepository;

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
    public GeneratedRouteResponseDTO getGeneratedRouteByDriver(Long driverId) {
        DriverEntity driver = driverRepository.findById(driverId).orElseThrow(
            () -> new ResourceNotFoundException("driver not found")
        );

        ZoneId zoneId = ZoneId.of("America/Lima");
        LocalDate today = LocalDate.now(zoneId);
        Instant from = today.atStartOfDay(zoneId).toInstant();
        Instant to = today.atStartOfDay(zoneId).plusDays(1).toInstant();

        GeneratedRouteEntity generatedRoute = generatedRouteRepository.getByDriverIdAndDate(driverId, from, to)
            .orElseThrow(() -> new ResourceNotFoundException("generated route not found"));

        List<Long> containerIds = generatedRoute.getGeneratedContainers()
            .stream()
            .map(gc -> gc.getContainer().getId())
            .toList();

        Map<Long, MetricEntity> latestMetrics = metricRepository
            .findLatestByContainerIds(containerIds)
            .stream()
            .collect(Collectors.toMap(m -> m.getContainer().getId(), m -> m));

        return new GeneratedRouteResponseDTO(
            generatedRoute.getId(),
            driverMapper.toInfoDTO(generatedRoute.getDriver()),
            generatedRoute.getPolylines().stream().map(polylineMapper::fromEntityToDTO).toList(),
            mapContainersWithLastMetric(generatedRoute, latestMetrics)
                .stream()
                .sorted(Comparator.comparingInt(GeneratedContainerResponseDTO::visitOrder))
                .toList(),
            generatedRoute.getCreatedAt()
        );
    }

    @Override
    public DriverHomeResponseDTO getDriverHome(Long driverId, double latitude, double longitude) {
        FromToInstant fromToInstant = InstantUtil.getFromToInstant("America/Lima");

        GeneratedRouteEntity generatedRoute = generatedRouteRepository.getByDriverIdAndDate(driverId, fromToInstant.from(), fromToInstant.to())
            .orElseThrow(() -> new ResourceNotFoundException("generated route not found"));

        int totalCount = generatedRoute.getGeneratedContainers().size();

        List<Long> containerIds = generatedRoute.getGeneratedContainers()
            .stream()
            .map(gc -> gc.getContainer().getId())
            .toList();

        Map<Long, MetricEntity> latestMetrics = metricRepository
            .findLatestByContainerIds(containerIds)
            .stream()
            .collect(Collectors.toMap(m -> m.getContainer().getId(), m -> m));

        List<GeneratedContainerResponseDTO> containers = mapContainersWithLastMetric(generatedRoute, latestMetrics)
            .stream()
            .sorted(Comparator.comparingInt(GeneratedContainerResponseDTO::visitOrder))
            .toList();

        int aliveCount = (int) containers.stream()
            .filter(c -> c.lastMetric() != null && c.lastMetric().isAlive())
            .count();

        int highPriorityCount = (int) containers.stream()
            .filter(c -> c.lastMetric() != null && c.lastMetric().fillingLevel() >= 0.8)
            .count();

        Map<String, Integer> airQualityCounts = containers.stream()
            .filter(c -> c.lastMetric() != null && c.lastMetric().airQualityLevel() != null)
            .collect(Collectors.groupingBy(
                c -> c.lastMetric().airQualityLevel(),
                Collectors.summingInt(c -> 1)
            ));

        System.out.println(containerIds);
        ContainerNearByPointRawDTO currentContainer = containerRepository.getNearContainerInPath(containerIds, latitude, longitude);
        System.out.println(currentContainer);

        var currentContainerResponse = containers.stream()
            .filter(c -> c.containerId().equals(currentContainer.id()))
            .toList()
            .getFirst();

        return new DriverHomeResponseDTO(
            generatedRoute.getId(),
            generatedRoute.getCreatedAt(),
            currentContainerResponse,
            totalCount,
            aliveCount,
            highPriorityCount,
            airQualityCounts
        );
    }

    private List<GeneratedContainerResponseDTO> mapContainersWithLastMetric(GeneratedRouteEntity route, Map<Long, MetricEntity> lastMetrics) {
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
                    containerImageMapper.fromEntityToDTO(c.getContainerImage()),
                    metricMapper.fromEntityToDTO(lastMetrics.get(c.getId())),
                    gc.getVisitOrder()
                );
            })
            .toList();
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
                    containerImageMapper.fromEntityToDTO(c.getContainerImage()),
                    null,
                    gc.getVisitOrder()
                );
            })
            .toList();
    }
}
