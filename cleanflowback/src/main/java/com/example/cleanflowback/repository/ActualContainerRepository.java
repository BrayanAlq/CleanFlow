package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ActualContainerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ActualContainerRepository extends JpaRepository<ActualContainerEntity, Long> {
}
