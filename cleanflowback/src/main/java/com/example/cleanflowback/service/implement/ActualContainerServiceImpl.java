package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.ActualContainerRequestDTO;
import com.example.cleanflowback.model.ActualContainerEntity;
import com.example.cleanflowback.repository.ActualContainerRepository;
import com.example.cleanflowback.service.ActualContainerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ActualContainerServiceImpl implements ActualContainerService {
    private final ActualContainerRepository actualContainerRepository;

    @Override
    public void createOrUpdateActualContainer(ActualContainerRequestDTO requestDTO) {
        List<ActualContainerEntity> actualContainerEntities = actualContainerRepository.findAll();

        ActualContainerEntity newActualContainerEntity = new ActualContainerEntity();

        if (actualContainerEntities.isEmpty()) {
            newActualContainerEntity.setContainerId(requestDTO.containerId());
        } else {
            newActualContainerEntity = actualContainerEntities.getFirst();
            newActualContainerEntity.setContainerId(requestDTO.containerId());
        }

        actualContainerRepository.save(newActualContainerEntity);
    }
}
