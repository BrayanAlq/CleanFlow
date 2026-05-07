package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.ReportResponseDTO;
import com.example.cleanflowback.model.ReportEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(
    componentModel = MappingConstants.ComponentModel.SPRING,
    uses = {ReportImageMapper.class}
)
public interface ReportMapper {
    ReportResponseDTO fromEntityToDTO(ReportEntity entity);
}
