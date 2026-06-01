package com.example.cleanflowback.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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

    @Column(nullable = false)
    private int reportCount;

    @Column(nullable = false)
    private int badgeCount;

    @Column(nullable = false)
    private String address;

    @Override
    @PrePersist
    public void prePersist() {
        super.prePersist();
        this.reportCount = 0;
        this.badgeCount = 0;
    }
}
