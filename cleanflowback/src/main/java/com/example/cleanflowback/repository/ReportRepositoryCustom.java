package com.example.cleanflowback.repository;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.model.ReportEntity;
import com.example.cleanflowback.model.ResidentEntity;

import java.util.List;

public interface ReportRepositoryCustom {
    List<ReportEntity> getReportsByResidentWithCursor(ResidentEntity resident, GeneratedCursorInternalDTO cursor, int size);
    List<ReportEntity> getReportsByContainerWithCursor(Long containerId, GeneratedCursorInternalDTO cursor, int size);
}
