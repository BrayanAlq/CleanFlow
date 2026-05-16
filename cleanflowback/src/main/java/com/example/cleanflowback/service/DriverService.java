package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.model.DriverEntity;

import java.util.List;

public interface DriverService {
    DriverInfoResponseDTO getDriverInfo(DriverEntity driverEntity);
    List<DriverInfoResponseDTO> getAllDrivers();
}
