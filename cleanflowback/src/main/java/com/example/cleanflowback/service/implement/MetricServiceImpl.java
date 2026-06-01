package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.CreateMetricRequestDTO;
import com.example.cleanflowback.dto.out.MetricResponseDTO;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.MetricMapper;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.MetricEntity;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.MetricRepository;
import com.example.cleanflowback.service.MetricService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MetricServiceImpl implements MetricService {
    private final MetricMapper metricMapper;
    private final ContainerRepository containerRepository;
    private final MetricRepository metricRepository;

    @Override
    public MetricResponseDTO createMetric(CreateMetricRequestDTO requestDTO) {
        MetricEntity metricToCreate = metricMapper.fromDTOToEntity(requestDTO);

        ContainerEntity container = containerRepository.findById(requestDTO.containerId())
            .orElseThrow(() -> new ResourceNotFoundException("Container not found"));

        metricToCreate.setContainer(container);

        return metricMapper.fromEntityToDTO(metricRepository.save(metricToCreate));
    }
}
