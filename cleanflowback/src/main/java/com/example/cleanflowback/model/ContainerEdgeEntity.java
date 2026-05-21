package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "container_edge")
@Getter
@Setter
@NoArgsConstructor
public class ContainerEdgeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_first_container", nullable = false)
    private ContainerEntity firstContainer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_second_container", nullable = false)
    private ContainerEntity secondContainer;

    @Column(nullable = false)
    private String polyline;

    @Column(nullable = false)
    private double duration;
}
