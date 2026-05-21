package com.example.cleanflowback.dto.out;

import java.time.LocalDateTime;
import java.util.List;

public record GeneratedRouteResponseDTO(
    Long id,
    DriverInfoResponseDTO driver,
    List<PolylineResponseDTO> polylines,
    LocalDateTime createdAt
) {}
