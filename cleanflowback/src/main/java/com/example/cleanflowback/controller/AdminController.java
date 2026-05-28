package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.service.DriverService;
import com.example.cleanflowback.service.ResidentService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("admin")
@AllArgsConstructor
public class AdminController {
    private final DriverService driverService;
    private final ResidentService residentService;

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
}
