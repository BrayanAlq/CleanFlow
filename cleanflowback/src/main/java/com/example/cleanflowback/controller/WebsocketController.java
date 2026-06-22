package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.ContainerInfoRequestDTO;
import com.example.cleanflowback.dto.in.CreateMetricRequestDTO;
import com.example.cleanflowback.dto.in.DriverLocationRequestDTO;
import com.example.cleanflowback.dto.in.ViewportRequestDTO;
import com.example.cleanflowback.dto.out.MetricResponseDTO;
import com.example.cleanflowback.dto.out.DriverLocationResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.PointRepository;
import com.example.cleanflowback.repository.RouteRepository;
import com.example.cleanflowback.repository.ViewportRepository;
import com.example.cleanflowback.service.MetricService;
import com.example.cleanflowback.service.ViewportService;
import lombok.AllArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("websocket")
@AllArgsConstructor
public class WebsocketController {
    private final ViewportService viewportService;
    private final ViewportRepository viewportRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final MetricService metricService;
    private final RouteRepository routeRepository;
    private final PointRepository pointRepository;

    @MessageMapping("/viewport.update")
    public void createOrUpdateViewPort(
        Principal principal,
        @Payload ViewportRequestDTO requestDTO
    ) {
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) principal;
        UserEntity user = (UserEntity) auth.getPrincipal();

        viewportService.createOrUpdateViewport(requestDTO, user);
    }

    @Transactional
    @MessageMapping("/driver.location")
    public void updateDriverLocation(
        Principal principal,
        @Payload DriverLocationRequestDTO requestDTO
    ) {
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) principal;
        UserEntity driverEntity = (UserEntity) auth.getPrincipal();

        if (driverEntity == null) {
            System.out.println("No driver found");
            return;
        }

        // Save in respective route
        // TODO: verify if route is from driverId
        RouteEntity route = routeRepository.findById(requestDTO.routeId())
            .orElseThrow(() -> new ResourceNotFoundException("route does not exist"));

        if (!route.getDriver().getId().equals(driverEntity.getId())) {
            throw new UnauthorizedAccessException("Access denied (not owner of this route)");
        }

        PointEntity pointToSave = new PointEntity();
        pointToSave.setRoute(route);
        pointToSave.setLatitude(requestDTO.latitude());
        pointToSave.setLongitude(requestDTO.longitude());
        pointToSave.setTimestamp(Instant.now());

        pointRepository.save(pointToSave);

        // Search users with driver in their viewport
        List<ViewportEntity> visibleUsers = viewportRepository.findVisibleUsers(
            requestDTO.latitude(), requestDTO.longitude()
        );

        DriverLocationResponseDTO responseDTO = new DriverLocationResponseDTO(
            driverEntity.getId(), requestDTO.latitude(), requestDTO.longitude()
        );

        for (ViewportEntity viewport: visibleUsers) {
            String username = viewport.getUser().getUsername();
            try {
                simpMessagingTemplate.convertAndSendToUser(
                    username,
                    "/queue/drivers",
                    responseDTO
                );
            } catch (Exception e) {
                System.out.println("Error sending to: " + username + ": " + e.getMessage());
            }
        }
    }

    @Transactional
    @MessageMapping("/container.metrics")
    public void createContainerMetrics(
        Principal principal,
        @Payload ContainerInfoRequestDTO requestDTO
    ) {
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) principal;
        ContainerEntity containerEntity = (ContainerEntity) auth.getPrincipal();

        if (containerEntity == null) {
            System.out.println("No container found");
            return;
        }

        CreateMetricRequestDTO metricToSave = new CreateMetricRequestDTO(
            containerEntity.getId(), requestDTO.isAlive(), requestDTO.airQualityLevel(), requestDTO.ppm(), requestDTO.fillingLevel()
        );

        MetricResponseDTO responseDTO = metricService.createMetric(metricToSave);

        List<ViewportEntity> visibleUsers = viewportRepository.findVisibleUsers(
            containerEntity.getLatitude(), containerEntity.getLongitude()
        );

        for (ViewportEntity viewport: visibleUsers) {
            String username = viewport.getUser().getUsername();
            try {
                simpMessagingTemplate.convertAndSendToUser(
                    username,
                    "/queue/metrics",
                    responseDTO
                );
            } catch (Exception e) {
                System.out.println("Error sending to: " + username + ": " + e.getMessage());
            }
        }
    }
}
