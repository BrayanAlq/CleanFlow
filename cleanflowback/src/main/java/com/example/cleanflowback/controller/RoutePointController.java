package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.DriverLocationRequestDTO;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.service.PointService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/driver/route")
@AllArgsConstructor
public class RoutePointController {
    private final PointService pointService;

    @PostMapping("/point")
    public ResponseEntity<Void> createPoint(
        @AuthenticationPrincipal DriverEntity driver,
        @Valid @RequestBody DriverLocationRequestDTO requestDTO
    ) {
        pointService.createPoint(requestDTO, driver);
        return ResponseEntity.ok().build();
    }
}
