package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.ContainerNearByPointRawDTO;
import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerNearByPointDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;
import com.example.cleanflowback.dto.out.ContainerResponseForDeviceDTO;
import com.example.cleanflowback.dto.out.CursorPageWithEncodedResponseDTO;
import com.example.cleanflowback.model.ResidentEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ContainerService {
    ContainerResponseDTO createContainer(CreateContainerRequestDTO requestDTO, MultipartFile image);
    List<ContainerResponseDTO> findAllContainersInViewport(
        double north, double south, double east, double west
    );
    void deleteContainerById(Long id);
    ContainerResponseDTO getContainerById(Long id);
    ContainerResponseForDeviceDTO getContainerForDevice();
    CursorPageWithEncodedResponseDTO<ContainerNearByPointDTO> getContainerNearToResident(
        ResidentEntity resident, String cursor, int size
    );
}
