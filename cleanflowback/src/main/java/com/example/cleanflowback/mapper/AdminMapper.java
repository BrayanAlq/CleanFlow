package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.in.CreateAdminRequestDTO;
import com.example.cleanflowback.model.AdminEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface AdminMapper {
    AdminEntity fromDTOtoEntity(CreateAdminRequestDTO createAdminRequestDTO);
}
