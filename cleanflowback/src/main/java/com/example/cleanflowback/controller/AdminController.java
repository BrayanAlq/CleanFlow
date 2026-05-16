package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.service.DriverService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("admin")
@AllArgsConstructor
public class AdminController {
    private final DriverService driverService;

    @GetMapping("/driver")
    public ResponseEntity<List<DriverInfoResponseDTO>> getDriverInfo() {
        return ResponseEntity.ok(driverService.getAllDrivers());
    }
}
