package com.example.cleanflowback.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "residents")
public class ResidentEntity extends UserEntity {
    @Column(nullable = false)
    private Double longitude;

    @Column(nullable = false)
    private Double latitude;
}
