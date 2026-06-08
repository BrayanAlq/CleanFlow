package com.example.cleanflowback.dto.out;

public record ResidentInfoDTO(
    Long id,
    String username,
    String firstName,
    String lastName,
    String email,
    double latitude,
    double longitude,
    boolean enabled,
    String address,
    int reportCount,
    int badgeCount
) {}
