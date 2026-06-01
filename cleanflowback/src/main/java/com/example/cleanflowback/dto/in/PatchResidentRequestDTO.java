package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotNull;

public record PatchResidentRequestDTO(
    @NotNull(message = "first_name is required")
    String firstName,
    @NotNull(message = "last_name is required")
    String lastName,
    @NotNull(message = "address is required")
    String address
) {}
