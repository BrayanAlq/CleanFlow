package com.example.cleanflowback.service;

import com.example.cleanflowback.model.UserEntity;

public interface DeviceTokenService {
    void saveOrUpdate(UserEntity user, String token);
    void deleteToken(UserEntity user, String token);
}
