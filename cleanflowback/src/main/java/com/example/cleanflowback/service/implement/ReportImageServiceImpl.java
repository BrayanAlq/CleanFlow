package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.out.ReportImageResponseDTO;
import com.example.cleanflowback.exception.ReportImagesNotProvidedException;
import com.example.cleanflowback.mapper.ReportImageMapper;
import com.example.cleanflowback.model.ReportImageEntity;
import com.example.cleanflowback.repository.ReportImageRepository;
import com.example.cleanflowback.service.CloudinaryService;
import com.example.cleanflowback.service.ReportImageService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class ReportImageServiceImpl implements ReportImageService {
    private final CloudinaryService cloudinaryService;
    private final ReportImageRepository reportImageRepository;
    private final ReportImageMapper reportImageMapper;

    @Override
    public List<ReportImageResponseDTO> createReportImage(List<MultipartFile> images) {
        if (images == null || images.isEmpty()) {
            throw new ReportImagesNotProvidedException("images is required");
        }

        List<ReportImageEntity> imagesToSave = new ArrayList<>();
        for (MultipartFile file : images) {
            String path = cloudinaryService.uploadImage(file);
            ReportImageEntity entity = new ReportImageEntity();
            entity.setPath(path);

            imagesToSave.add(entity);
        }

        List<ReportImageEntity> saved = reportImageRepository.saveAll(imagesToSave);

        return saved.stream()
            .map(reportImageMapper::fromEntityToDTO)
            .toList();
    }
}
