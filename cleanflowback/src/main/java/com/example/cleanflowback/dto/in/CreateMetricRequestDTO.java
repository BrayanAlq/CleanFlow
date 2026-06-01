package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record CreateMetricRequestDTO(
    @NotNull(message = "container_id is required")
    Long containerId,
    @NotNull(message = "is_alive is required")
    Boolean isAlive,
    @NotBlank(message = "air_quality_level is required")
    String airQualityLevel,
    @NotNull(message = "ppm is required")
    double ppm,
    @NotNull(message = "filling_level is required")
    double fillingLevel
) {}
