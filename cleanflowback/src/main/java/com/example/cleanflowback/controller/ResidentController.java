package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.PatchResidentRequestDTO;
import com.example.cleanflowback.dto.out.ContainerNearByPointDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.ReportGoalDTO;
import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.service.ContainerService;
import com.example.cleanflowback.service.ResidentService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/resident")
@AllArgsConstructor
public class ResidentController {
    private final ResidentService residentService;
    private final ContainerService containerService;

    @GetMapping("")
    public ResponseEntity<ResidentInfoDTO> getResidentInfo(
        @AuthenticationPrincipal ResidentEntity residentEntity
    ) {
        return ResponseEntity.ok(residentService.getResidentInfo(residentEntity));
    }

    @PatchMapping("")
    public ResponseEntity<Void> patchResident(
        @AuthenticationPrincipal ResidentEntity residentEntity,
        @Valid @RequestBody PatchResidentRequestDTO requestDTO
    ) {
        residentService.patchResident(residentEntity, requestDTO);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/container/near")
    public ResponseEntity<CursorPageWithEncodedResponseDTO<ContainerNearByPointDTO>> getNearContainers(
        @AuthenticationPrincipal ResidentEntity resident,
        @RequestParam(value = "cursor", required = false) String cursor,
        @RequestParam(value = "size", required = false, defaultValue = "10") int size
    ) {
        return ResponseEntity.ok(containerService.getContainerNearToResident(resident, cursor, size));
    }

    @GetMapping("/remaining/goal")
    public ResponseEntity<ReportGoalDTO> getRemaining(
        @AuthenticationPrincipal ResidentEntity resident
    ) {
        return ResponseEntity.ok(residentService.getRemaining(resident));
    }
}
