package com.example.cleanflowback.controller;

import com.example.cleanflowback.dto.in.CreateReportRequestDTO;
import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.exception.ReportImageAlreadyAsignedException;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ReportMapper;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.ReportEntity;
import com.example.cleanflowback.model.ReportImageEntity;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.ReportImageRepository;
import com.example.cleanflowback.repository.ReportRepository;
import lombok.AllArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/report")
@AllArgsConstructor
public class ReportController {

    private final ContainerRepository containerRepository;
    private final ReportImageRepository reportImageRepository;
    private final ReportRepository reportRepository;
    private final ReportMapper reportMapper;
    private final SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping("/reports.create")
    public void createReport(
        @Payload CreateReportRequestDTO dto,
        @AuthenticationPrincipal ResidentEntity residentEntity
    ) {
        ContainerEntity containerEntity = containerRepository.findById(dto.containerId())
            .orElseThrow(() -> new ResourceNotFoundException("Container not found"));

        ReportEntity reportEntity = new ReportEntity();
        reportEntity.setResident(residentEntity);
        reportEntity.setContainer(containerEntity);
        reportEntity.setContent(dto.content());

        List<ReportImageEntity> images = reportImageRepository.findAllById(dto.imageIds());
        boolean anyAlreadyAssigned = images.stream().anyMatch(i -> i.getReport() != null);
        if (anyAlreadyAssigned) {
            throw new ReportImageAlreadyAsignedException("Image already assigned");
        }

        images.forEach(image -> image.setReport(reportEntity));

        reportEntity.setImages(images);

        ReportEntity saved = reportRepository.save(reportEntity);
        ReportResponseDTO reportResponseDTO = reportMapper.fromEntityToDTO(saved);

        simpMessagingTemplate.convertAndSend("/topic/reports/" + dto.containerId(), reportResponseDTO);
    }
}
