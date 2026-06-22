package com.example.cleanflowback.dto.out;

import java.time.Instant;

public record PointResponseDTO(
    Long id,
    double latitude,
    double longitude,
    Instant timestamp
) {}
