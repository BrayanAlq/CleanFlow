package com.example.cleanflowback.repository;

import com.example.cleanflowback.model.PolylineEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PolylineRepository extends JpaRepository<PolylineEntity, Long> {
}
