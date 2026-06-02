package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateOrUpdateDeviceTokenRequestDTO;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.service.DeviceTokenService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/notification-token")
@AllArgsConstructor
public class DeviceTokenController {
    private final DeviceTokenService deviceTokenService;

    @PostMapping("/register-token")
    public ResponseEntity<Void> createOrUpdateDeviceToken(
        @Valid @RequestBody CreateOrUpdateDeviceTokenRequestDTO requestDTO,
        @AuthenticationPrincipal UserEntity user
    ) {
        deviceTokenService.saveOrUpdate(user, requestDTO.token());
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/unregister-token")
    public ResponseEntity<Void> deleteDeviceToken(
        @AuthenticationPrincipal UserEntity user,
        @Valid @RequestBody CreateOrUpdateDeviceTokenRequestDTO requestDTO
    ) {
        deviceTokenService.deleteToken(user, requestDTO.token());
        return ResponseEntity.noContent().build();
    }
}
