package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotNull;

public record ViewportRequestDTO(
    @NotNull(message = "north is required")
    double north,
    @NotNull(message = "south is required")
    double south,
    @NotNull(message = "east is required")
    double east,
    @NotNull(message = "west is required")
    double west
) {}
