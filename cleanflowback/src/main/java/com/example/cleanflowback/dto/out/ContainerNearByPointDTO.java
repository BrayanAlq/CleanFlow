package com.example.cleanflowback.dto.out;

public record ContainerNearByPointDTO(
    Long id,
    String name,
    String addressName,
    double distance,
    String url,
    MetricResponseDTO lastMetric
) {}
