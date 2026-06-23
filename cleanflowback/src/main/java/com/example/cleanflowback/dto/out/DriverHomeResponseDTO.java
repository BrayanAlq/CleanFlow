package com.example.cleanflowback.dto.out;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.time.Instant;
import java.util.Map;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record DriverHomeResponseDTO(
    Long id,
    Instant createdAt,
    GeneratedContainerResponseDTO currentTarget,
    int cursor,
    int totalCount,
    int aliveCount,
    int highPriorityCount,
    Map<String, Integer> airQualityCounts
) {}
