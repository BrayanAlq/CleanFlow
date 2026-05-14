package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.dto.out.ContainerResponseForDeviceDTO;
import com.example.cleanflowback.exception.ContainerConflictException;
import com.example.cleanflowback.exception.CredentialsAlreadyUsedException;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ContainerMapper;
import com.example.cleanflowback.model.ActualContainerEntity;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.model.ContainerImageEntity;
import com.example.cleanflowback.model.ReportEntity;
import com.example.cleanflowback.repository.ActualContainerRepository;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.ReportRepository;
import com.example.cleanflowback.service.CloudinaryService;
import com.example.cleanflowback.service.ContainerService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@Service
@AllArgsConstructor
public class ContainerServiceImpl implements ContainerService {
    private final ContainerRepository containerRepository;
    private final ContainerMapper containerMapper;
    private final ReportRepository reportRepository;
    private final CloudinaryService cloudinaryService;
    private final PasswordEncoder passwordEncoder;
    private final ActualContainerRepository actualContainerRepository;

    @Override
    @Transactional
    public ContainerResponseDTO createContainer(CreateContainerRequestDTO requestDTO, MultipartFile image) {
        if (containerRepository.existsByName(requestDTO.name())) {
            throw new CredentialsAlreadyUsedException("name for container already exists");
        }

        ContainerEntity containerEntity = containerMapper.fromRequestDTOtoEntity(requestDTO);

        ContainerImageEntity containerImageEntity = new ContainerImageEntity();
        if (image != null) {
            String url = cloudinaryService.uploadImage(image);
            containerImageEntity.setUrl(url);
            containerEntity.setContainerImage(containerImageEntity);
        }
        String secret = "password";
        String apiKey;
        do {
            apiKey = UUID.randomUUID().toString();
        } while (containerRepository.existsByApiKey(apiKey));

        containerEntity.setApiKey(apiKey);
        containerEntity.setSecret(passwordEncoder.encode(secret));
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

    @Override
    public ContainerResponseDTO getContainerById(Long id) {
        ContainerEntity containerEntity = containerRepository.findById(id)
            .orElseThrow(() -> new ResourceNotFoundException(("container not found")));

        return containerMapper.fromEntitytoDTO(containerEntity);
    }

    @Override
    public ContainerResponseForDeviceDTO getContainerForDevice() {
        List<ActualContainerEntity> actualContainerEntities = actualContainerRepository.findAll();

        if (actualContainerEntities.isEmpty()) {
            throw new ResourceNotFoundException(("actual container is not set"));
        }

        ContainerEntity containerEntity = containerRepository.findById(actualContainerEntities.getFirst().getContainerId())
            .orElseThrow(() -> new ResourceNotFoundException(("container not found")));
        ContainerResponseForDeviceDTO response = containerMapper.fromEntityToDTOForDevice(containerEntity);

        return new ContainerResponseForDeviceDTO(
            response.id(), response.apiKey(), "password"
        );
    }
}
