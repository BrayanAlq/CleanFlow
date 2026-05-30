package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.service.DriverService;
import com.example.cleanflowback.service.GeneratedRouteService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/driver")
@AllArgsConstructor
public class DriverController {
    private final DriverService driverService;
    private final GeneratedRouteService generatedRouteService;

    @GetMapping("")
    public ResponseEntity<DriverInfoResponseDTO> getDriverInfo(
        @AuthenticationPrincipal DriverEntity driverEntity
    ) {
        return ResponseEntity.ok(driverService.getDriverInfo(driverEntity));
    }

    @GetMapping("/scheduled-route")
    public ResponseEntity<GeneratedRouteResponseDTO> getScheduledRoute(
        @AuthenticationPrincipal DriverEntity driverEntity
    ) {
        return generatedRouteService.getGeneratedRouteByDriver(driverEntity.getId())
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.ok().build());
    }
}
