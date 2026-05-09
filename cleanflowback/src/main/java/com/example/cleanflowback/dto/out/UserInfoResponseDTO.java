package com.example.cleanflowback.dto.out;

public record UserInfoResponseDTO(
    Long id,
    String username,
    String firstName,
    String lastName,
    String email
) {}
