package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record CreateResidentRequestDTO(
    @NotBlank(message = "username is required")
    String username,
    @NotBlank(message = "password is required")
    @Size(min = 6, max = 40, message = "password must be between 6 and 40 characters")
    String password,
    @NotBlank(message = "email is required")
    @Email
    String email,
    @NotBlank(message = "first_name is required")
    String firstName,
    @NotBlank(message = "last_name is required")
    String lastName,
    @NotNull
    Double longitude,
    @NotNull
    Double latitude
) {
}
