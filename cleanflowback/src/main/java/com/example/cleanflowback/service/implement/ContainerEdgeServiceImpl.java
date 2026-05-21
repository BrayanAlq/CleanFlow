package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.CreateContainerEdgeDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.ContainerEdgeEntity;
import com.example.cleanflowback.repository.ContainerEdgeRepository;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.service.ContainerEdgeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ContainerEdgeServiceImpl implements ContainerEdgeService {
    private final ContainerEdgeRepository containerEdgeRepository;
    private final ContainerRepository containerRepository;

    @Override
    public void createContainerEdge(CreateContainerEdgeDTO containerEdgeDTO) {
        ContainerEdgeEntity containerEdge = new ContainerEdgeEntity();

        containerEdge.setFirstContainer(
            containerRepository.findById(containerEdgeDTO.idFirstContainer()).orElseThrow(
                () -> new ResourceNotFoundException("id_container not found")
            )
        );
        containerEdge.setSecondContainer(
            containerRepository.findById(containerEdgeDTO.idSecondContainer()).orElseThrow(
                () -> new ResourceNotFoundException("id_second_container not found")
            )
        );
        containerEdge.setDuration(containerEdgeDTO.duration());
        containerEdge.setPolyline(containerEdgeDTO.polyline());

        containerEdgeRepository.save(containerEdge);
    }
}
