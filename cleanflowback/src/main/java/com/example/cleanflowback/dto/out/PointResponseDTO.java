package com.example.cleanflowback.dto.out;

import java.time.LocalDateTime;

public record PointResponseDTO(
    Long id,
    double latitude,
    double longitude,
    LocalDateTime timestamp
) {}
