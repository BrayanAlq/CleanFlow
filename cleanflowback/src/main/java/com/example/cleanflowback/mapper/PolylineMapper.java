package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.PolylineResponseDTO;
import com.example.cleanflowback.model.PolylineEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface PolylineMapper {
    PolylineResponseDTO fromEntityToDTO(PolylineEntity entity);
}
