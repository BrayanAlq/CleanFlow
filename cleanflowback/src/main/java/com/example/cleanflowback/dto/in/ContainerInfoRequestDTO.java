package com.example.cleanflowback.dto.in;

public record ContainerInfoRequestDTO(
    boolean isAlive,
    String airQualityLevel,
    double ppm,
    double fillingLevel
) {}
