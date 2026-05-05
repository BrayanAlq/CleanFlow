package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
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
}
