package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateDriverRequestDTO;
import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
import com.example.cleanflowback.dto.in.LoginRequestDTO;
import com.example.cleanflowback.dto.out.LoginResponseDTO;
import com.example.cleanflowback.service.AuthService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@AllArgsConstructor
public class AuthController {
    private final AuthService authService;

    @PostMapping("/resident")
    public ResponseEntity<Void> createResident(
        @Valid @RequestBody CreateResidentRequestDTO dto
    ) {
        authService.createResident(dto);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/driver")
    public ResponseEntity<Void> createDriver(
        @Valid @RequestBody CreateDriverRequestDTO dto
    ) {
        authService.createDriver(dto);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponseDTO> login(
        @Valid @RequestBody LoginRequestDTO dto
    ) {
        return ResponseEntity.ok(authService.login(dto));
    }
}
