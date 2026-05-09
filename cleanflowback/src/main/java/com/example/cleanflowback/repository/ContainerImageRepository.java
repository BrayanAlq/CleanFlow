package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ContainerImageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

@Service
public interface ContainerImageRepository extends JpaRepository<ContainerImageEntity, Long> {
}
