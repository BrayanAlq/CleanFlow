package com.example.cleanflowback.dto.out;

import java.time.Instant;
import java.util.List;

public record GeneratedRouteResponseDTO(
    Long id,
    DriverInfoResponseDTO driver,
    List<PolylineResponseDTO> polylines,
    List<GeneratedContainerResponseDTO> containers,
    Instant createdAt
) {}
