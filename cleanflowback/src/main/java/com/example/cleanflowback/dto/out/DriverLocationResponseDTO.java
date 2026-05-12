package com.example.cleanflowback.dto.out;

public record DriverLocationResponseDTO(
    Long driverId,
    double latitude,
    double longitude
) {}
