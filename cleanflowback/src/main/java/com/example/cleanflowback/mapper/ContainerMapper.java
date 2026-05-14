package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.dto.out.ContainerResponseForDeviceDTO;
import com.example.cleanflowback.model.ContainerEntity;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingConstants;

@Mapper(
    componentModel = MappingConstants.ComponentModel.SPRING,
    uses = {ContainerImageMapper.class}
)
public interface ContainerMapper {
    @Mapping(target = "location", ignore = true)
    ContainerEntity fromRequestDTOtoEntity(CreateContainerRequestDTO dto);
    ContainerResponseDTO fromEntitytoDTO(ContainerEntity entity);
    ContainerResponseForDeviceDTO fromEntityToDTOForDevice(ContainerEntity entity);
}
