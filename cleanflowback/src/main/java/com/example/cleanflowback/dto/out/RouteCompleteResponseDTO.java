package com.example.cleanflowback.dto.out;

import java.time.LocalDateTime;
import java.util.List;

public record RouteCompleteResponseDTO(
    Long id,
    LocalDateTime startAt,
    LocalDateTime endAt,
    String status,
    String polyline,
    DriverInfoResponseDTO driver
) {}
