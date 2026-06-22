package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.FinishRouteBodyRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.service.RouteService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/route")
@AllArgsConstructor
public class RouteController {
    private final RouteService routeService;

    @PostMapping("")
    @PreAuthorize("hasRole('DRIVER')")
    public ResponseEntity<RouteResponseDTO> createRoute(
        @AuthenticationPrincipal DriverEntity driverEntity
    ) {
        return ResponseEntity.ok(routeService.createRoute(driverEntity));
    }

    @PatchMapping("/{routeId}")
    @PreAuthorize("hasRole('DRIVER')")
    public ResponseEntity<Void> updateRoute(
        @AuthenticationPrincipal DriverEntity driverEntity,
        @PathVariable Long routeId,
        @Valid @RequestBody FinishRouteBodyRequestDTO dto
    ) {
        routeService.finishRoute(driverEntity, routeId, dto);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<CursorPageResponseDTO<RouteCompleteResponseDTO>> getRoutes(
        @RequestParam(required = false) LocalDate date,
        @RequestParam(required = false) Long driverId,
        @RequestParam(required = false) Integer size,
        @RequestParam(required = false) Long cursor
    ) {
        return ResponseEntity.ok(routeService.getRoutesWithFilter(date, driverId, cursor, size));
    }

    @GetMapping("/points/{routeId}")
    public ResponseEntity<List<PointResponseDTO>> getPointsByRouteId(
        @AuthenticationPrincipal DriverEntity driverEntity,
        @PathVariable Long routeId
    ) {
        return ResponseEntity.ok(routeService.getPointsByRouteId(driverEntity, routeId));
    }
}
