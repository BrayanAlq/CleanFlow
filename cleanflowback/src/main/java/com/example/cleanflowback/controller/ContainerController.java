package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.dto.out.ContainerResponseForDeviceDTO;
import com.example.cleanflowback.service.ContainerService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/container")
@AllArgsConstructor
public class ContainerController {
    private final ContainerService containerService;

    @PostMapping("")
    @PreAuthorize("hasRole('ADMIN')") // Only admin can create containers
    public ResponseEntity<ContainerResponseDTO> createContainer(
        @Valid @RequestPart("container") CreateContainerRequestDTO createContainerRequestDTO,
        @RequestParam(value = "image", required = true) MultipartFile image
    ) {
       return ResponseEntity.ok(containerService.createContainer(createContainerRequestDTO, image));
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

    @GetMapping("/{containerId}")
    public ResponseEntity<ContainerResponseDTO> getContainerById(
        @PathVariable Long containerId
    ) {
        return ResponseEntity.ok(containerService.getContainerById(containerId));
    }

    @DeleteMapping("/{containerId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteContainerById(
        @PathVariable Long containerId
    ) {
        containerService.deleteContainerById(containerId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/device")
    public ResponseEntity<ContainerResponseForDeviceDTO> getContainerByDeviceId() {
        return ResponseEntity.ok(containerService.getContainerForDevice());
    }
}
