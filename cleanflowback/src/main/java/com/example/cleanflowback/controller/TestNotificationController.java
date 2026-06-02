package com.example.cleanflowback.controller;

import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.DeviceTokenEntity;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.repository.DeviceTokenRepository;
import com.example.cleanflowback.repository.UserRepository;
import com.example.cleanflowback.service.PushNotificationService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/test-notify")
@AllArgsConstructor
public class TestNotificationController {
    private final DeviceTokenRepository deviceTokenRepository;
    private final UserRepository userRepository;
    private final PushNotificationService pushNotificationService;

    @PostMapping("/{idUser}")
    public void sendToUser(@PathVariable Long idUser) {
        UserEntity user = userRepository.findById(idUser)
            .orElseThrow(() -> new ResourceNotFoundException("user id not found"));
        List<DeviceTokenEntity> deviceTokenEntity = deviceTokenRepository.findByUser(user);

        List<String> deviceTokens = deviceTokenEntity.stream().map(DeviceTokenEntity::getToken).toList();

        pushNotificationService.sendBatch(deviceTokens, "Test Title", "Test Body");
    }
}
