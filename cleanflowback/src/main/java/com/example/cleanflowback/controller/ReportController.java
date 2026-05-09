package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateReportRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.service.ReportService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/report")
@AllArgsConstructor
public class ReportController {
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final ReportService reportService;

    @Transactional
    @MessageMapping("/reports.create")
    public void createReport(
        @Payload CreateReportRequestDTO dto,
        Principal principal
    ) {
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) principal;
        UserEntity user = (UserEntity) auth.getPrincipal();

        ReportResponseDTO reportResponseDTO = reportService.createReport(user, dto);

        simpMessagingTemplate.convertAndSend("/topic/reports/" + dto.containerId(), reportResponseDTO);
    }

    @PostMapping("")
    public ResponseEntity<ReportResponseDTO> createReport(
        @AuthenticationPrincipal UserEntity user,
        @Valid @RequestBody CreateReportRequestDTO createReportRequestDTO
    ) {
        return ResponseEntity.ok(reportService.createReport(user, createReportRequestDTO));
    }

    @GetMapping("/container/{containerId}")
    public ResponseEntity<CursorPageResponseDTO<ReportResponseDTO>> getReportsByContainerId(
        @PathVariable Long containerId,
        @RequestParam(value = "cursor", required = false) Long cursor,
        @RequestParam(value = "size", defaultValue = "5") int size
    ) {
        return ResponseEntity.ok(reportService.getReportsByContainerIdWithCursor(containerId, cursor, size));
    }
}
