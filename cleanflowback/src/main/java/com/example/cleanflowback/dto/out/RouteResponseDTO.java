package com.example.cleanflowback.dto.out;

import java.time.Instant;

public record RouteResponseDTO(
    Long id,
    Instant startAt,
    Instant endAt,
    String status
) {}
