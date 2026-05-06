package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.model.ResidentEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ResidentMapper {
    ResidentEntity toEntity(CreateResidentRequestDTO createResidentRequestDTO);
    ResidentInfoDTO toInfoDTO(ResidentEntity residentEntity);
}
