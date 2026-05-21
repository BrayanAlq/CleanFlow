package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateContainerEdgeDTO;
import com.example.cleanflowback.service.ContainerEdgeService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/edge")
@AllArgsConstructor
public class ContainerEdgeController {
    private final ContainerEdgeService containerEdgeService;

    @PostMapping("")
    public ResponseEntity<Void> save(
        @Valid @RequestBody CreateContainerEdgeDTO createContainerEdgeDTO
    ) {
        containerEdgeService.createContainerEdge(createContainerEdgeDTO);
        return ResponseEntity.noContent().build();
    }
}
