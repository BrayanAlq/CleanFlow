package com.example.cleanflowback.dto.out;

public record ContainerResponseDTO(
    Long id,
    String name,
    String addressName,
    double latitude,
    double longitude,
    ContainerImageResponseDTO containerImage
) {}
