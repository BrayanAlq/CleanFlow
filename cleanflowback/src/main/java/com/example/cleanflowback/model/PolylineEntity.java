package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "polylines")
@Getter
@Setter
@NoArgsConstructor
public class PolylineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String polyline;

    @Column(nullable = false)
    private int segmentOrder;

    @ManyToOne
    @JoinColumn(name = "generated_route_id", nullable = false)
    private GeneratedRouteEntity generatedRoute;
}
