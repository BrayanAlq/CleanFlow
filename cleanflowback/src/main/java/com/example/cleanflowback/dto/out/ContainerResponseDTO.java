package com.example.cleanflowback.dto.out;

public record ContainerResponseDTO(
    Long id,
    String name,
    String addressName,
    String type,
//    String apiKey,
    double latitude,
    double longitude,
    ContainerImageResponseDTO containerImage,
    MetricResponseDTO lastMetric
) {}
