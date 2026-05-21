package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "generated_containers")
@Getter
@Setter
@NoArgsConstructor
public class GeneratedContainerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "generated_route_id", nullable = false)
    private GeneratedRouteEntity generatedRoute;

    @ManyToOne
    @JoinColumn(name = "container_id", nullable = false)
    private ContainerEntity container;

    @Column(nullable = false)
    private int visitOrder;

}
