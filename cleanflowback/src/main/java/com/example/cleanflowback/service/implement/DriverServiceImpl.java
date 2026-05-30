package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.out.DriverInfoResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.DriverMapper;
import com.example.cleanflowback.model.DriverEntity;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.service.DriverService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class DriverServiceImpl implements DriverService {
    private final DriverRepository driverRepository;
    private final DriverMapper driverMapper;

    @Override
    public DriverInfoResponseDTO getDriverInfo(DriverEntity driverEntity) {
        DriverEntity driverOnDb = driverRepository.findById(driverEntity.getId())
            .orElseThrow(() -> new ResourceNotFoundException("Driver Not Found"));

        return driverMapper.toInfoDTO(driverOnDb);
    }

    @Override
    public Page<DriverInfoResponseDTO> getAllDrivers(Pageable pageable) {
        return driverRepository.findAll(pageable)
            .map(driverMapper::toInfoDTO);
    }

    @Override
    public List<DriverInfoResponseDTO> getAllDrivers() {
        return driverRepository.findAll()
            .stream().map(driverMapper::toInfoDTO).toList();
    }
}
