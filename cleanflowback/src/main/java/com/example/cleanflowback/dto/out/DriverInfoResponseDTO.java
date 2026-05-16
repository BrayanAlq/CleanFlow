package com.example.cleanflowback.dto.out;

public record DriverInfoResponseDTO(
    Long id,
    String username,
    String firstName,
    String lastName,
    String email
) {}
