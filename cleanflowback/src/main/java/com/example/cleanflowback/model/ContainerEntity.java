package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "containers")
@Getter
@Setter
@NoArgsConstructor
public class ContainerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    double latitude;

    @Column(nullable = false)
    double longitude;

    @OneToMany(mappedBy = "container")
    private List<ReportEntity> reports;

    @OneToMany(mappedBy = "container")
    private List<MetricEntity> metrics;
}
