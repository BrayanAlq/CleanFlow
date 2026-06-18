package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.GeneratedCursorInternalDTO;
import com.example.cleanflowback.dto.in.CreateReportRequestDTO;
import com.example.cleanflowback.dto.out.CursorPageResponseDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.exception.ReportImageAlreadyAsignedException;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ReportMapper;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.ReportImageRepository;
import com.example.cleanflowback.repository.ReportRepository;
import com.example.cleanflowback.repository.ResidentRepository;
import com.example.cleanflowback.service.ReportService;
import com.example.cleanflowback.utils.CursorUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Limit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReportServiceImpl implements ReportService {
    private final ReportRepository reportRepository;
    private final ReportMapper reportMapper;
    private final ContainerRepository containerRepository;
    private final ReportImageRepository reportImageRepository;
    private final ResidentRepository residentRepository;
    private final CursorUtil cursorUtil;

    @Override
    public Page<ReportResponseDTO> getReportsByContainerId(Long containerId, Pageable pageable) {
        Page<ReportEntity> page = reportRepository.findAllByContainer_Id(containerId, pageable);
        return page.map(reportMapper::fromEntityToDTO);
    }

    @Override
    public ReportResponseDTO createReport(UserEntity user, CreateReportRequestDTO requestDTO) {
        ContainerEntity containerEntity = containerRepository.findById(requestDTO.containerId())
            .orElseThrow(() -> new ResourceNotFoundException("Container not found"));

        ReportEntity reportEntity = new ReportEntity();
        reportEntity.setContainer(containerEntity);
        reportEntity.setUser(user);
        reportEntity.setContent(requestDTO.content().trim());

        List<Long> imageIds = requestDTO.imageIds() == null ? List.of() : requestDTO.imageIds();
        List<ReportImageEntity> images = reportImageRepository.findAllById(imageIds);

        boolean anyAlreadyExists = images.stream().anyMatch(i -> i.getReport() != null);
        if (anyAlreadyExists) {
            throw new ReportImageAlreadyAsignedException("image already assigned");
        }

        images.forEach(i -> i.setReport(reportEntity));

        reportEntity.setImages(images);

        ReportEntity saved = reportRepository.save(reportEntity);

        // report count and badge counts
        if (user.getRole().equals(RoleEnum.RESIDENT)) {
            ResidentEntity resident = residentRepository.findById(user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Resident not found"));
            int reportCount = resident.getReportCount();
            resident.setReportCount(reportCount + 1);

            int badgeCount = getBadgeLevel(reportCount + 1);
            if (resident.getBadgeCount() != badgeCount) {
                resident.setBadgeCount(badgeCount);
            }

            residentRepository.save(resident);
        }
        return reportMapper.fromEntityToDTO(saved);
    }

    @Override
    public CursorPageWithEncodedResponseDTO<ReportResponseDTO> getReportsByContainerIdWithCursor(
        Long containerId, String cursor, int size
    ) {
        GeneratedCursorInternalDTO cursorInternal = cursor == null ? null : cursorUtil.decode(cursor);

        List<ReportEntity> reportEntities = reportRepository.getReportsByContainerWithCursor(
            containerId, cursorInternal, size + 1
        );

        boolean hasNext = reportEntities.size() > size;

        if (hasNext) {
            reportEntities.removeLast();
        }

        String nextCursor = hasNext
            ? cursorUtil.encode(new GeneratedCursorInternalDTO(
                reportEntities.getLast().getTimestamp(), reportEntities.getLast().getId()
            ))
            : null;


        return new CursorPageWithEncodedResponseDTO<>(
            reportEntities.stream().map(reportMapper::fromEntityToDTO).toList(),
            hasNext,
            nextCursor
        );
    }

    @Override
    public CursorPageWithEncodedResponseDTO<ReportResponseDTO> getReportsByResident(
        ResidentEntity resident, String cursor, int size
    ) {
        GeneratedCursorInternalDTO decodedCursor = cursor == null ? null : cursorUtil.decode(cursor);

        List<ReportEntity> reportEntities = reportRepository.getReportsByResidentWithCursor(
            resident, decodedCursor, size + 1
        );

        boolean hasNext = reportEntities.size() > size;

        if (hasNext) {
            reportEntities.removeLast();
        }

        String nextCursor = hasNext
            ? cursorUtil.encode(new GeneratedCursorInternalDTO(
                reportEntities.getLast().getTimestamp(), reportEntities.getLast().getId()
            ))
            : null;

        return new CursorPageWithEncodedResponseDTO<>(
            reportEntities.stream().map(reportMapper::fromEntityToDTO).toList(),
            hasNext,
            nextCursor
        );
    }

    public int getBadgeLevel(int reportCount) {
        int[] thresholds = {10, 30, 70, 120};
        for (int i = 0; i < thresholds.length; i++) {
            if (reportCount < thresholds[i]) return i;
        }
        return thresholds.length;
    }
}
