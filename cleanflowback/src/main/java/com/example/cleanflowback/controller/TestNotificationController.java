package com.example.cleanflowback.controller;

import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.DeviceTokenEntity;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.repository.DeviceTokenRepository;
import com.example.cleanflowback.repository.UserRepository;
import com.example.cleanflowback.service.PushNotificationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/test-notify")
@AllArgsConstructor
public class TestNotificationController {
    private final DeviceTokenRepository deviceTokenRepository;
    private final UserRepository userRepository;
    private final PushNotificationService pushNotificationService;

    @PostMapping("/{residentUsername}")
    public void sendToUser(@PathVariable String residentUsername) {
        UserEntity user = userRepository.findByUsername(residentUsername)
            .orElseThrow(() -> new ResourceNotFoundException("user id not found"));
        List<DeviceTokenEntity> deviceTokenEntities = deviceTokenRepository.findByUser(user);

        List<String> deviceTokens = deviceTokenEntities.stream().map(DeviceTokenEntity::getToken).toList();

        pushNotificationService.sendBatch(
            deviceTokens,
            "\uD83D\uDE9B Recolección iniciada",
            "El camión recolector ha iniciado su recorrido. Te avisaremos cuando esté cerca de tu ubicación."
        );

        deviceTokenRepository.updateDeviceTokensLastSend(
            deviceTokenEntities.stream().map(DeviceTokenEntity::getId).toList(), Instant.now()
        );
    }
}
