package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "generated_routes")
@Getter
@Setter
@NoArgsConstructor
public class GeneratedRouteEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "driver_id", nullable = false)
    private DriverEntity driver;

    @OneToMany(mappedBy = "generatedRoute", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<GeneratedContainerEntity> generatedContainers;

    @OneToMany(mappedBy = "generatedRoute", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<PolylineEntity> polylines;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }
}
