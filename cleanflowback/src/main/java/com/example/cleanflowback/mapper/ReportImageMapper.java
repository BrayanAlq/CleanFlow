package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.ReportImageResponseDTO;
import com.example.cleanflowback.model.ReportImageEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ReportImageMapper {
    ReportImageResponseDTO fromEntityToDTO(ReportImageEntity entity);
}
