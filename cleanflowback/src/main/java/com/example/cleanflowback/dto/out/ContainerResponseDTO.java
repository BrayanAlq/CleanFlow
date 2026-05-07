package com.example.cleanflowback.dto.out;

public record ContainerResponseDTO(
    Long id,
    String name,
    double latitude,
    double longitude
) {}
