package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.UpdateUserStatusRequestDTO;
import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.service.AuthService;
import com.example.cleanflowback.service.DriverService;
import com.example.cleanflowback.service.ResidentService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {
    private final DriverService driverService;
    private final ResidentService residentService;
    private final AuthService authService;

    @GetMapping("/drivers")
    public ResponseEntity<List<DriverInfoResponseDTO>> getAllDrivers() {
        return ResponseEntity.ok(driverService.getAllDrivers());
    }

    @GetMapping("/driver")
    public ResponseEntity<Page<DriverInfoResponseDTO>> getDriverInfo(
        Pageable pageable
    ) {
        return ResponseEntity.ok(driverService.getAllDrivers(pageable));
    }

    @GetMapping("/resident")
    public ResponseEntity<Page<ResidentInfoDTO>> getResidentsInfo(
        Pageable pageable
    ) {
        return ResponseEntity.ok(residentService.getAllResidentsInfo(pageable));
    }

    @PatchMapping("/user/status")
    public ResponseEntity<Void> updateUserStatus(
        @Valid @RequestBody UpdateUserStatusRequestDTO dto
    ) {
        authService.updateUserStatus(dto.userId(), dto.enabled());
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/resident/viewport")
    public ResponseEntity<List<ResidentInfoDTO>> getResidentsInViewport(
        @RequestParam(value = "north", required = true) Double north,
        @RequestParam(value = "south", required = true) Double south,
        @RequestParam(value = "west", required = true)  Double west,
        @RequestParam(value = "east", required = true) Double east
    ) {
        return ResponseEntity.ok(residentService.getResidentsInViewport(north, south, east, west));
    }
}
