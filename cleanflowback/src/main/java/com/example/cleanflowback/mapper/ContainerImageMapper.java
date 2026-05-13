package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.ContainerImageResponseDTO;
import com.example.cleanflowback.model.ContainerImageEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ContainerImageMapper {
    ContainerImageResponseDTO fromEntityToDTO(ContainerImageEntity containerImageEntity);
}
