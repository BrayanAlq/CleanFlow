package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;

public record CreateOrUpdateDeviceTokenRequestDTO(
    @NotBlank(message = "token is required")
    String token
) {}
