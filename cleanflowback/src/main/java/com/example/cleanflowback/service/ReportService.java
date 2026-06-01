package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.CreateReportRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.model.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ReportService {
    Page<ReportResponseDTO> getReportsByContainerId(Long id, Pageable pageable);
    ReportResponseDTO createReport(UserEntity user, CreateReportRequestDTO createReportRequestDTO);
    CursorPageWithEncodedResponseDTO<ReportResponseDTO> getReportsByContainerIdWithCursor(Long containerId, String cursor, int size);
    CursorPageWithEncodedResponseDTO<ReportResponseDTO> getReportsByResident(ResidentEntity resident, String cursor, int size);
}
