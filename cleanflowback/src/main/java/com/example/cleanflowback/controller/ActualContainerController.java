package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.ActualContainerRequestDTO;
import com.example.cleanflowback.service.ActualContainerService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/actual-container")
@AllArgsConstructor
public class ActualContainerController {
    private final ActualContainerService actualContainerService;

    @PostMapping("")
    public ResponseEntity<Void> createOrUpdateActualContainer(
        @Valid @RequestBody ActualContainerRequestDTO actualContainerRequestDTO
    ) {
        actualContainerService.createOrUpdateActualContainer(actualContainerRequestDTO);
        return ResponseEntity.noContent().build();
    }
}
