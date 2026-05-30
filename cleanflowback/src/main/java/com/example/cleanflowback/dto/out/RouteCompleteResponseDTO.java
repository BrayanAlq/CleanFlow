package com.example.cleanflowback.dto.out;

import java.time.Instant;

public record RouteCompleteResponseDTO(
    Long id,
    Instant startAt,
    Instant endAt,
    String status,
    String polyline,
    DriverInfoResponseDTO driver
) {}
