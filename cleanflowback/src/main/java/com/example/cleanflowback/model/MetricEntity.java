package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "metrics")
@Getter
@Setter
@NoArgsConstructor
public class MetricEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private boolean isAlive;

    @Column(nullable = false)
    private String airQualityLevel;

    @Column(nullable = false)
    private double ppm;

    @Column(nullable = false)
    private double fillingLevel;

    @Column(nullable = false)
    private LocalDateTime timestamp;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "container_id")
    private ContainerEntity container;

    @PrePersist
    public void prePersist() {
        this.timestamp = LocalDateTime.now();
    }
}
