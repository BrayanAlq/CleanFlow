package com.example.cleanflowback.dto.out;

import java.util.List;

public record RouterResponseDTO(
    Long id,
    Long driverId,
    List<Long> containerIds,
    List<String> polylines
) {}
