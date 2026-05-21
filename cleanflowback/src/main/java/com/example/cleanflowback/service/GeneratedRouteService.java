package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;

import java.time.LocalDate;

public interface GeneratedRouteService {
    CursorPageWithEncodedResponseDTO<GeneratedRouteResponseDTO> getGeneratedRoutes(
        Long driverId, LocalDate date, String cursor, Integer size
    );
}
