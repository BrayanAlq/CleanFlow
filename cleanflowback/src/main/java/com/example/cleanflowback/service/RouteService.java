package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.model.DriverEntity;

import java.time.LocalDate;

public interface RouteService {
    RouteResponseDTO createRoute(DriverEntity driver);
    void finishRoute(DriverEntity driverEntity, Long routeId);
    CursorPageResponseDTO<RouteCompleteResponseDTO> getRoutesWithFilter(
        LocalDate date, Long driverId, Long cursor, Integer size
    );
}
