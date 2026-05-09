package com.example.cleanflowback.dto.in;

public record CreateContainerRequestDTO(
    String name,
    String addressName,
    double latitude,
    double longitude
) {}
