package com.example.cleanflowback.dto.out;

import java.time.LocalDateTime;

public record RouteResponseDTO(
    Long id,
    LocalDateTime startAt,
    LocalDateTime endAt,
    String status
) {}
