package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "container_images")
@Getter
@Setter
@NoArgsConstructor
public class ContainerImageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String url;

    @OneToOne(mappedBy = "containerImage", cascade = CascadeType.ALL, orphanRemoval = true)
    private ContainerEntity container;
}
