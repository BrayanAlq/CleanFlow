package com.example.cleanflowback.dto;

// When use @Query the order of the arguments is mandatory
public record ContainerNearByPointRawDTO(
    Long id,
    String name,
    String addressName,
    String url,
    double distance
) {}
