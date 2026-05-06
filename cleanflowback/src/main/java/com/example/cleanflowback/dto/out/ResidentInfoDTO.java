package com.example.cleanflowback.dto.out;

public record ResidentInfoDTO(
    String username,
    String firstName,
    String lastName,
    String email,
    double latitude,
    double longitude
) {}
