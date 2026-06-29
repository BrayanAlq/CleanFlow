package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.DriverLocationRequestDTO;
import com.example.cleanflowback.dto.out.PointResponseDTO;
import com.example.cleanflowback.model.DriverEntity;

public interface PointService {
    PointResponseDTO createPoint(DriverLocationRequestDTO requestDTO, DriverEntity driver);
}
