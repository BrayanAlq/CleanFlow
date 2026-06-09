package com.example.cleanflowback.dto.out;

public record GeneratedContainerResponseDTO(
    Long containerId,
    String name,
    String addressName,
    double latitude,
    double longitude,
    ContainerImageResponseDTO image,
    MetricResponseDTO lastMetric,
    int visitOrder
) {}
