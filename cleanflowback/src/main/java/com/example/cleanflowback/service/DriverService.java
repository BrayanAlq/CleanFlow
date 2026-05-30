package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.model.DriverEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface DriverService {
    DriverInfoResponseDTO getDriverInfo(DriverEntity driverEntity);
    Page<DriverInfoResponseDTO> getAllDrivers(Pageable pageable);
    List<DriverInfoResponseDTO> getAllDrivers();
}
