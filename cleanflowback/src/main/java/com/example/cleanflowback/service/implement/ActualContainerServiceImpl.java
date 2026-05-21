package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.ActualContainerRequestDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.ActualContainerEntity;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.repository.ActualContainerRepository;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.service.ActualContainerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ActualContainerServiceImpl implements ActualContainerService {
    private final ActualContainerRepository actualContainerRepository;
    private final ContainerRepository containerRepository;

    @Override
    public void createOrUpdateActualContainer(ActualContainerRequestDTO requestDTO) {
        List<ActualContainerEntity> actualContainerEntities = actualContainerRepository.findAll();
        ContainerEntity container = containerRepository.findById(requestDTO.containerId())
            .orElseThrow(() -> new ResourceNotFoundException("Container not found"));

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
