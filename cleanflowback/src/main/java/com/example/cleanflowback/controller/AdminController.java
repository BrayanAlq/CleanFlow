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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("admin")
@AllArgsConstructor
public class AdminController {
    private final DriverService driverService;
    private final ResidentService residentService;
    private final AuthService authService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/drivers")
    public ResponseEntity<List<DriverInfoResponseDTO>> getAllDrivers() {
        return ResponseEntity.ok(driverService.getAllDrivers());
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/driver")
    public ResponseEntity<Page<DriverInfoResponseDTO>> getDriverInfo(
        Pageable pageable
    ) {
        return ResponseEntity.ok(driverService.getAllDrivers(pageable));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/resident")
    public ResponseEntity<Page<ResidentInfoDTO>> getResidentsInfo(
        Pageable pageable
    ) {
        return ResponseEntity.ok(residentService.getAllResidentsInfo(pageable));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PatchMapping("/user/status")
    public ResponseEntity<Void> updateUserStatus(
        @Valid @RequestBody UpdateUserStatusRequestDTO dto
    ) {
        authService.updateUserStatus(dto.userId(), dto.enabled());
        return ResponseEntity.noContent().build();
    }
}
