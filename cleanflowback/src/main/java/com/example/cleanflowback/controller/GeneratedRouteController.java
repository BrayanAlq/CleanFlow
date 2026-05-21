package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.GeneratedRouteResponseDTO;
import com.example.cleanflowback.service.GeneratedRouteService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RestController
@RequestMapping("/generated-route")
@AllArgsConstructor
public class GeneratedRouteController {
    private final GeneratedRouteService generatedRouteService;

    @GetMapping("")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<CursorPageWithEncodedResponseDTO<GeneratedRouteResponseDTO>> getRoutes(
        @RequestParam(required = false) String cursor,
        @RequestParam(required = false) Long driverId,
        @RequestParam(required = false) LocalDate date,
        @RequestParam(required = false) Integer size
    ) {
        return ResponseEntity.ok(generatedRouteService.getGeneratedRoutes(driverId, date, cursor, size));
    }
}
