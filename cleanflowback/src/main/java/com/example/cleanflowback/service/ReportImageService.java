package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.ReportImageResponseDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ReportImageService {
    List<ReportImageResponseDTO> createReportImage(
        List<MultipartFile> images
    );
}
