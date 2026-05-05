package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.ResidentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResidentRepository extends JpaRepository<ResidentEntity, Long> {
}
