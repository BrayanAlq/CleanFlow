package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "residents")
@PrimaryKeyJoinColumn(name = "id")
@Getter
@Setter
@NoArgsConstructor
public class ResidentEntity extends UserEntity {
    @Column(nullable = false)
    private Double longitude;

    @Column(nullable = false)
    private Double latitude;

    @OneToMany(mappedBy = "resident")
    private List<ReportEntity> reports;
}
