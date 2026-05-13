package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.CreateReportRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.model.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ReportService {
    Page<ReportResponseDTO> getReportsByContainerId(Long id, Pageable pageable);
    ReportResponseDTO createReport(UserEntity user, CreateReportRequestDTO createReportRequestDTO);
    CursorPageResponseDTO<ReportResponseDTO> getReportsByContainerIdWithCursor(Long containerId, Long cursor, int size);
}
