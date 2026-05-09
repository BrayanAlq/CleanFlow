package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.UserInfoResponseDTO;
import com.example.cleanflowback.model.UserEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserMapper {
    UserInfoResponseDTO fromEntityToDTO(UserEntity user);
}
