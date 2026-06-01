package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.PatchResidentRequestDTO;
import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.service.ResidentService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/resident")
@AllArgsConstructor
public class ResidentController {
    private final ResidentService residentService;

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
}
