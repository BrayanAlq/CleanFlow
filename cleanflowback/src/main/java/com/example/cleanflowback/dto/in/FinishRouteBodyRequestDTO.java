package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;

public record FinishRouteBodyRequestDTO(
    @NotBlank(message = "polyline is required")
    String polyline
) {}
