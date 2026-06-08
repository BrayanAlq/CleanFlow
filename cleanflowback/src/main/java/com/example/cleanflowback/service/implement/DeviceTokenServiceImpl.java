package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.exception.ResourceNotFoundException;
import com.example.cleanflowback.model.DeviceTokenEntity;
import com.example.cleanflowback.model.UserEntity;
import com.example.cleanflowback.repository.DeviceTokenRepository;
import com.example.cleanflowback.service.DeviceTokenService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class DeviceTokenServiceImpl implements DeviceTokenService {
    private final DeviceTokenRepository deviceTokenRepository;

    @Override
    public void saveOrUpdate(UserEntity user, String token) {
        deviceTokenRepository.findByToken(token).ifPresentOrElse(
            existing -> {
                existing.setUser(user);
                deviceTokenRepository.save(existing);
            },
            () -> {
                DeviceTokenEntity deviceTokenEntity = new DeviceTokenEntity();
                deviceTokenEntity.setToken(token);
                deviceTokenEntity.setUser(user);
                deviceTokenRepository.save(deviceTokenEntity);
            }
        );
    }

    @Override
    @Transactional
    public void deleteToken(UserEntity user, String token) {
        DeviceTokenEntity deviceToken = deviceTokenRepository.findByToken(token)
            .orElseThrow(() -> new ResourceNotFoundException("Device token not found"));

        if (deviceToken.getUser().getId().equals(user.getId())) {
            deviceTokenRepository.deleteByToken(token);
        }
    }
}
