package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.*;
import com.example.cleanflowback.dto.out.MetricResponseDTO;
import com.example.cleanflowback.dto.out.DriverLocationResponseDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.*;
import com.example.cleanflowback.service.MetricService;
import com.example.cleanflowback.service.PointService;
import com.example.cleanflowback.service.PushNotificationService;
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
import java.time.temporal.ChronoUnit;
import java.util.List;

@RestController
@RequestMapping("websocket")
@AllArgsConstructor
public class WebsocketController {
    private final ViewportService viewportService;
    private final ViewportRepository viewportRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final MetricService metricService;
    private final PointService pointService;
    private final DriverRepository driverRepository;
    private final ResidentRepository residentRepository;
    private final DeviceTokenRepository deviceTokenRepository;
    private final PushNotificationService pushNotificationService;

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
        UserEntity user = (UserEntity) auth.getPrincipal();

        if (user == null) {
            System.out.println("No driver found");
            return;
        }

        DriverEntity driver = driverRepository.findById(user.getId())
            .orElseThrow(() -> new ResourceNotFoundException("Driver not found"));

        PointResponseDTO pointSaved = pointService.createPoint(requestDTO, driver);

        /*
        * TODO: get residents around 100 meters to point (latitude, longitude)
        * get all device-tokens, check lastSend time and send push notification if time is less than 30 minutes
        * update lastSend on device-tokens
        */
        List<Long> residentsAround = residentRepository.findAllAroundPointInRadius(pointSaved.latitude(), pointSaved.longitude(), 200);
        Instant ago = Instant.now().minus(30, ChronoUnit.MINUTES);
        List<DeviceTokenEntity> devices = deviceTokenRepository.findAllByUserIdsWithTimestampSafe(residentsAround, ago);

        pushNotificationService.sendBatch(
            devices.stream().map(DeviceTokenEntity::getToken).toList(),
            "\uD83D\uDDD1\uFE0F ¡No olvides tu basura!",
            "El camión recolector está muy cerca de tu ubicación."
        );

        deviceTokenRepository.updateDeviceTokensLastSend(
            devices.stream().map(DeviceTokenEntity::getId).toList(), Instant.now()
        );
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
