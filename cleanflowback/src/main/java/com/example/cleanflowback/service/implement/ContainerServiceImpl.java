package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.ContainerNearByPointRawDTO;
import com.example.cleanflowback.dto.DistanceIdCursorDTO;
import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.*;
import com.example.cleanflowback.exception.ContainerConflictException;
import com.example.cleanflowback.exception.CredentialsAlreadyUsedException;
import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.mapper.ContainerImageMapper;
import com.example.cleanflowback.mapper.ContainerMapper;
import com.example.cleanflowback.mapper.MetricMapper;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.ActualContainerRepository;
import com.example.cleanflowback.repository.ContainerRepository;
import com.example.cleanflowback.repository.MetricRepository;
import com.example.cleanflowback.repository.ReportRepository;
import com.example.cleanflowback.service.CloudinaryService;
import com.example.cleanflowback.service.ContainerService;
import com.example.cleanflowback.utils.CursorUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ContainerServiceImpl implements ContainerService {
    private final ContainerRepository containerRepository;
    private final ContainerMapper containerMapper;
    private final ReportRepository reportRepository;
    private final CloudinaryService cloudinaryService;
    private final PasswordEncoder passwordEncoder;
    private final ActualContainerRepository actualContainerRepository;
    private final MetricRepository metricRepository;
    private final ContainerImageMapper containerImageMapper;
    private final MetricMapper metricMapper;
    private final CursorUtil cursorUtil;

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

        return containerMapper.fromEntityDTO(containerRepository.save(containerEntity));
    }

    @Override
    public List<ContainerResponseDTO> findAllContainersInViewport(double north, double south, double east, double west) {
        List<ContainerEntity> containerInViewport = containerRepository.findAllInViewport(north, south, east, west);

        List<Long> containerIds = containerInViewport.stream().map(ContainerEntity::getId).toList();

        Map<Long, MetricEntity> latestMetrics = metricRepository
            .findLatestByContainerIds(containerIds)
            .stream()
            .collect(Collectors.toMap(m -> m.getContainer().getId(), m -> m));

        return containerInViewport.stream()
            .map(container -> {
                MetricResponseDTO lastMetric = Optional
                    .ofNullable(latestMetrics.get(container.getId()))
                    .map(metricMapper::fromEntityToDTO)
                    .orElse(null);

                return new ContainerResponseDTO(
                    container.getId(),
                    container.getName(),
                    container.getAddressName(),
                    container.getType().name(),
                    container.getLatitude(),
                    container.getLongitude(),
                    containerImageMapper.fromEntityToDTO(container.getContainerImage()),
                    lastMetric
                );
            }).toList();
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

        List<Long> containerIds = List.of(containerEntity.getId());

        List<MetricEntity> lastMetric = metricRepository.findLatestByContainerIds(containerIds);

        return new ContainerResponseDTO(
            containerEntity.getId(),
            containerEntity.getName(),
            containerEntity.getAddressName(),
            containerEntity.getType().name(),
            containerEntity.getLatitude(),
            containerEntity.getLongitude(),
            containerImageMapper.fromEntityToDTO(containerEntity.getContainerImage()),
            metricMapper.fromEntityToDTO(lastMetric.stream().findFirst().orElse(null))
        );
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

    @Override
    public CursorPageWithEncodedResponseDTO<ContainerNearByPointDTO> getContainerNearToResident(
        ResidentEntity resident, String cursor, int size
    ) {
        DistanceIdCursorDTO cursorDecoded = cursor == null
            ? new DistanceIdCursorDTO(null, null)
            : cursorUtil.decodeDistanceId(cursor);

        List<ContainerNearByPointRawDTO> nearContainers = containerRepository.findAllOrderedByPointDistance(
            resident.getLatitude(), resident.getLongitude(), cursorDecoded.distance(), cursorDecoded.id(), size + 1
        );

        boolean hasNext = nearContainers.size() > size;

        nearContainers.removeLast();

        String nextCursor = hasNext
            ? cursorUtil.encodeDistanceId(new DistanceIdCursorDTO(nearContainers.getLast().id(), nearContainers.getLast().distance()))
            : null;

        List<Long> containerIds = nearContainers.stream().map(ContainerNearByPointRawDTO::id).toList();
        Map<Long, MetricEntity> lastMetrics = metricRepository.findLatestByContainerIds(containerIds)
            .stream()
            .collect(Collectors.toMap(m -> m.getContainer().getId(), m -> m));

        return new CursorPageWithEncodedResponseDTO<>(
            nearContainers.stream().map(c -> new ContainerNearByPointDTO(
                c.id(), c.name(), c.addressName(), c.distance(), c.url(), metricMapper.fromEntityToDTO(lastMetrics.get(c.id()))
            )).toList(),
            hasNext,
            nextCursor
        );
    }
}
