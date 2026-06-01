package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.dto.out.ContainerResponseForDeviceDTO;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.ContainerTypeEnum;
import org.mapstruct.*;

@Mapper(
    componentModel = MappingConstants.ComponentModel.SPRING,
    uses = {ContainerImageMapper.class}
)
public interface ContainerMapper {
    @Mappings({
        @Mapping(target = "location", ignore = true),
        @Mapping(target = "type", source = "type", qualifiedByName ="stringToEnum")
    })
    ContainerEntity fromRequestDTOtoEntity(CreateContainerRequestDTO dto);
    ContainerResponseDTO fromEntityDTO(ContainerEntity entity);
    ContainerResponseForDeviceDTO fromEntityToDTOForDevice(ContainerEntity entity);

    @Named("stringToEnum")
    default ContainerTypeEnum stringToEnum(String value) {
        if (value == null) return null;
        try {
            return ContainerTypeEnum.valueOf(value.toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid container type: " + value);
        }
    }
}
