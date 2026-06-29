package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.FinishRouteBodyRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.model.DriverEntity;

import java.time.LocalDate;
import java.util.List;

public interface RouteService {
    RouteResponseDTO createRoute(DriverEntity driver);
    void finishRoute(DriverEntity driverEntity, Long routeId, FinishRouteBodyRequestDTO dto);
    CursorPageResponseDTO<RouteCompleteResponseDTO> getRoutesWithFilter(
        LocalDate date, Long driverId, Long cursor, Integer size
    );
    List<PointResponseDTO> getPointsByRouteId(DriverEntity driver, Long routeId);
}
