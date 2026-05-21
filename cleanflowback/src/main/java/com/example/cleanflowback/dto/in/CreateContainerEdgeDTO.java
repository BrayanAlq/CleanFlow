package com.example.cleanflowback.dto.in;

public record CreateContainerEdgeDTO(
    Long idFirstContainer,
    Long idSecondContainer,
    double duration,
    String polyline
) {}
