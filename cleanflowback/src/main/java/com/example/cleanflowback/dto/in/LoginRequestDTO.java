package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record LoginRequestDTO(
    @NotBlank(message = "username is required")
    @Size(min = 6, max = 40, message = "username must be between 6 and 40 characters")
    String username,
    @NotBlank(message = "password is required")
    String password
) {
}
