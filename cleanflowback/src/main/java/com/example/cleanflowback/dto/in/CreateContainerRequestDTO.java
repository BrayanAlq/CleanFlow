package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CreateContainerRequestDTO(
    @NotBlank(message = "name is required")
    String name,
    @NotBlank(message = "address_name is required")
    String addressName,
    @NotNull(message = "latitude is required")
    double latitude,
    @NotNull(message = "longitude is required")
    double longitude,
    @NotBlank(message = "type is required")
    String type
) {}
