package com.example.cleanflowback.dto.out;

public record MetricResponseDTO(
    Long containerId,
    boolean isAlive,
    String airQualityLevel,
    double ppm,
    double fillingLevel
) {}
