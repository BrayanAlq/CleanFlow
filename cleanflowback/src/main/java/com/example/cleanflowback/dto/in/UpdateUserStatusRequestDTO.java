package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotNull;

public record UpdateUserStatusRequestDTO(
    @NotNull(message = "user_id is required")
    Long userId,
    @NotNull(message = "enabled is required")
    Boolean enabled
) {}
