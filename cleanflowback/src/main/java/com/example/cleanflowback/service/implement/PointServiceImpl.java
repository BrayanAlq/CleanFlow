package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.DriverLocationRequestDTO;
import com.example.cleanflowback.dto.out.DriverLocationResponseDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.mapper.PointMapper;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.model.PointEntity;
import com.example.cleanflowback.model.RouteEntity;
import com.example.cleanflowback.model.ViewportEntity;
import com.example.cleanflowback.repository.PointRepository;
import com.example.cleanflowback.repository.RouteRepository;
import com.example.cleanflowback.repository.ViewportRepository;
import com.example.cleanflowback.service.PointService;
import lombok.AllArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;

@Service
@AllArgsConstructor
public class PointServiceImpl implements PointService {
    private final RouteRepository routeRepository;
    private final PointRepository pointRepository;
    private final PointMapper pointMapper;
    private final ViewportRepository viewportRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;

    @Override
    public PointResponseDTO createPoint(DriverLocationRequestDTO requestDTO, DriverEntity driver) {
        RouteEntity route = routeRepository.findById(requestDTO.routeId())
            .orElseThrow(() -> new ResourceNotFoundException("Route not found"));

        if (!route.getDriver().getId().equals(driver.getId())) {
            throw new UnauthorizedAccessException("Not your route");
        }

        PointEntity point = new PointEntity();
        point.setRoute(route);
        point.setLatitude(requestDTO.latitude());
        point.setLongitude(requestDTO.longitude());
        point.setTimestamp(Instant.now());
        PointResponseDTO saved = pointMapper.fromEntityToDTO(pointRepository.save(point));

        sendPointViaWS(driver, saved);
        return saved;
    }

    public void sendPointViaWS(DriverEntity driver, PointResponseDTO response) {
        List<ViewportEntity> visibleUsers = viewportRepository.findVisibleUsers(response.latitude(), response.longitude());

        DriverLocationResponseDTO responseDTO = new DriverLocationResponseDTO(
            driver.getId(), response.latitude(), response.longitude()
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
}
