package com.example.cleanflowback.dto.out;

public record ContainerResponseDTO(
    Long id,
    String name,
    String addressName,
    String apiKey,
    double latitude,
    double longitude,
    ContainerImageResponseDTO containerImage
) {}
