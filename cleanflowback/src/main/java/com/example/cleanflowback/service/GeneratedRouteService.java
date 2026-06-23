package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.DriverHomeResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;

import java.time.LocalDate;
import java.util.List;

public interface GeneratedRouteService {
    CursorPageWithEncodedResponseDTO<GeneratedRouteResponseDTO> getGeneratedRoutes(
        Long driverId, LocalDate date, String cursor, Integer size
    );
    GeneratedRouteResponseDTO getGeneratedRouteByDriver(Long driverId);
    DriverHomeResponseDTO getDriverHome(Long driverId, int cursor);
}
