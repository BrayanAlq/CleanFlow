package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.MetricResponseDTO;
import com.example.cleanflowback.model.MetricEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface MetricMapper {
    @Mapping(
        target = "containerId",
        expression = "java(entity.getContainer().getId())"
    )
    MetricResponseDTO fromEntityToDTO(MetricEntity entity);
}
