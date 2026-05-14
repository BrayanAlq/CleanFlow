package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.ContainerInfoRequestDTO;
import com.example.cleanflowback.dto.in.DriverLocationRequestDTO;
import com.example.cleanflowback.dto.in.ViewportRequestDTO;
import com.example.cleanflowback.dto.out.ContainerInfoResponseDTO;
import com.example.cleanflowback.dto.out.DriverLocationResponseDTO;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.model.ViewportEntity;
import com.example.cleanflowback.repository.ViewportRepository;
import com.example.cleanflowback.service.ViewportService;
import lombok.AllArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.user.SimpUserRegistry;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("websocket")
@AllArgsConstructor
public class WebsocketController {
    private final ViewportService viewportService;
    private final ViewportRepository viewportRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final SimpUserRegistry simpUserRegistry;

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
    @PreAuthorize("hasRole('DRIVER')")
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

        List<ViewportEntity> visibleUsers = viewportRepository.findVisibleUsers(
            containerEntity.getLatitude(), containerEntity.getLongitude()
        );

        ContainerInfoResponseDTO responseDTO = new ContainerInfoResponseDTO(
            containerEntity.getId(), requestDTO.isAlive(), requestDTO.airQualityLevel(), requestDTO.ppm(), requestDTO.fillingLevel()
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
