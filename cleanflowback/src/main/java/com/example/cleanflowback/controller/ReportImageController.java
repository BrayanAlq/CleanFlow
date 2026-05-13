package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.out.ReportImageResponseDTO;
import com.example.cleanflowback.service.ReportImageService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/report-image")
@AllArgsConstructor
public class ReportImageController {
    private final ReportImageService reportImageService;

    @PostMapping("")
    public ResponseEntity<List<ReportImageResponseDTO>> createReportImage(
        @RequestParam("images") List<MultipartFile> images
    ) {
        return ResponseEntity.ok(reportImageService.createReportImage(images));
    }
}
