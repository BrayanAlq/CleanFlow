package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.in.CreateDriverRequestDTO;
import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.model.DriverEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface DriverMapper {
    DriverEntity toEntity(CreateDriverRequestDTO createDriverRequestDTO);
    DriverInfoResponseDTO toInfoDTO(DriverEntity driverEntity);
}
