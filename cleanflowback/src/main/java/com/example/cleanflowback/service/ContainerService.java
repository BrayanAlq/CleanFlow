package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.CreateContainerRequestDTO;
import com.example.cleanflowback.dto.out.ContainerResponseDTO;

import java.util.List;

public interface ContainerService {
    ContainerResponseDTO createContainer(CreateContainerRequestDTO requestDTO);
    List<ContainerResponseDTO> findAllContainersInViewport(
        double north, double south, double east, double west
    );
    void deleteContainerById(Long id);
}
