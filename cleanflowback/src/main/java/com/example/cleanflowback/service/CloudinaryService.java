package com.example.cleanflowback.service;

import org.springframework.web.multipart.MultipartFile;

public interface CloudinaryService {
    public String uploadImage(MultipartFile file);
}
