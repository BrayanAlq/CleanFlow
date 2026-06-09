package com.example.cleanflowback.repository;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.model.GeneratedRouteEntity;

import java.time.Instant;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface GeneratedRouteCustom {
    List<GeneratedRouteEntity> getAllWithSpecs(
        Long driverId, LocalDate date, Integer size, GeneratedCursorInternalDTO cursorDto
    );
    Optional<GeneratedRouteEntity> getByDriverIdAndDate(Long driverId, Instant from, Instant to);
}
