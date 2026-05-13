package com.example.cleanflowback.dto.out;

public record ContainerInfoResponseDTO(
    Long containerId,
    boolean isAlive,
    String airQualityLevel,
    double ppm,
    double fillingLevel
) {}
