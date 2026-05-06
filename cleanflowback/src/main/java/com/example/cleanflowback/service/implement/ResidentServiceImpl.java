package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.out.ResidentInfoDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ResidentMapper;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.repository.ResidentRepository;
import com.example.cleanflowback.service.ResidentService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ResidentServiceImpl implements ResidentService {
    private final ResidentRepository residentRepository;
    private final ResidentMapper residentMapper;

    @Override
    public ResidentInfoDTO getResidentInfo(ResidentEntity residentEntity) {
        ResidentEntity residentOnDb = residentRepository.findById(residentEntity.getId())
            .orElseThrow(() -> new ResourceNotFoundException("resident not found"));

        return residentMapper.toInfoDTO(residentOnDb);
    }
}
