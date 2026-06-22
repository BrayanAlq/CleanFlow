package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotNull;

public record DriverLocationRequestDTO(
    @NotNull(message = "route_id is required")
    Long routeId,
    @NotNull(message = "latitude is required")
    double latitude,
    @NotNull(message = "longitude is required")
    double longitude
) {}
