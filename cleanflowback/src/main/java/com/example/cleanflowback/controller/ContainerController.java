package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.service.ContainerService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/container")
@AllArgsConstructor
public class ContainerController {
    private final ContainerService containerService;

    @PostMapping("")
    @PreAuthorize("hasRole('ADMIN')") // Only admin can create containers
    public ResponseEntity<ContainerResponseDTO> createContainer(
        @Valid @RequestBody CreateContainerRequestDTO createContainerRequestDTO
    ) {
       return ResponseEntity.ok(containerService.createContainer(createContainerRequestDTO));
    }

    @GetMapping("/viewport")
    public ResponseEntity<List<ContainerResponseDTO>> findAllInViewport(
        @RequestParam("north") Double north,
        @RequestParam("south") Double south,
        @RequestParam("west")  Double west,
        @RequestParam("east") Double east
    ) {
        return ResponseEntity.ok(containerService.findAllContainersInViewport(north, south, west, east));
    }

    @DeleteMapping("/{containerId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteContainerById(
        @PathVariable Long containerId
    ) {
        containerService.deleteContainerById(containerId);
        return ResponseEntity.noContent().build();
    }
}
