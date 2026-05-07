package com.example.cleanflowback.dto.in;

public record CreateContainerRequestDTO(
    String name,
    double latitude,
    double longitude
) {}
