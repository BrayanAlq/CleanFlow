package com.example.cleanflowback.mapper;

import com.example.cleanflowback.dto.out.RouteCompleteResponseDTO;
import com.example.cleanflowback.dto.out.RouteResponseDTO;
import com.example.cleanflowback.model.RouteEntity;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

@Mapper(
    componentModel = MappingConstants.ComponentModel.SPRING,
    uses = {DriverMapper.class}
)
public interface RouteMapper {
    RouteResponseDTO fromEntityToDTO(RouteEntity routeEntity);
    RouteCompleteResponseDTO fromEntityToCompleteDTO(RouteEntity routeEntity);
}
