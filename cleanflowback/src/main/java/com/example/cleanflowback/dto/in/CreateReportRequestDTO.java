package com.example.cleanflowback.dto.in;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public record CreateReportRequestDTO(
    @NotBlank(message = "content is required")
    String content,
    @NotNull(message = "container_id is required")
    Long containerId,
    List<Long> imageIds
) {}
