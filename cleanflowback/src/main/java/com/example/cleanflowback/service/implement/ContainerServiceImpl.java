package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.exception.ContainerConflictException;
import com.example.cleanflowback.exception.CredentialsAlreadyUsedException;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ContainerMapper;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.ReportEntity;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.ReportRepository;
import com.example.cleanflowback.service.ContainerService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ContainerServiceImpl implements ContainerService {
    private final ContainerRepository containerRepository;
    private final ContainerMapper containerMapper;
    private final ReportRepository reportRepository;

    @Override
    public ContainerResponseDTO createContainer(CreateContainerRequestDTO requestDTO) {
        if (containerRepository.existsByName(requestDTO.name())) {
            throw new CredentialsAlreadyUsedException("name for container already exists");
        }

        ContainerEntity containerEntity = containerMapper.fromRequestDTOtoEntity(requestDTO);
        containerEntity.setLocation(requestDTO.latitude(), requestDTO.longitude());
        return containerMapper.fromEntitytoDTO(containerRepository.save(containerEntity));
    }

    @Override
    public List<ContainerResponseDTO> findAllContainersInViewport(double north, double south, double east, double west) {
        List<ContainerEntity> containerInViewport = containerRepository.findAllInViewport(north, south, east, west);

        return containerInViewport.stream()
            .map(containerMapper::fromEntitytoDTO)
            .toList();
    }

    @Override
    public void deleteContainerById(Long id) {
        if (!containerRepository.existsById(id)) {
            throw new ResourceNotFoundException(("container not found"));
        }

        List<ReportEntity> reports = reportRepository.findAllByContainer_Id(id);
        if (!reports.isEmpty()) {
            throw new ContainerConflictException("Cannot delete container with asociated reports");
        }

        containerRepository.deleteById(id);
    }
}
