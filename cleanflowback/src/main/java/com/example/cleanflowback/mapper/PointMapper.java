package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.model.PointEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PointMapper {
    PointResponseDTO fromEntityToDTO(PointEntity pointEntity);
}
