package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
import com.example.cleanflowback.exception.EmailAlreadyUsedException;
import com.example.cleanflowback.exception.UsernameAlreadyUsedException;
import com.example.cleanflowback.mapper.ResidentMapper;
import com.example.cleanflowback.model.ResidentEntity;
import com.example.cleanflowback.repository.ResidentRepository;
import com.example.cleanflowback.repository.UserRepository;
import com.example.cleanflowback.service.AuthService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final ResidentMapper residentMapper;
    private final ResidentRepository residentRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void createResident(CreateResidentRequestDTO dto) {
        if (userRepository.existsByUsername(dto.username())) {
            throw new UsernameAlreadyUsedException("username is already in use");
        }

        if (userRepository.existsByEmail(dto.email())) {
            throw new EmailAlreadyUsedException("email is already in use");
        }

        ResidentEntity residentEntity = residentMapper.toEntity(dto);
        residentEntity.setPassword(bCryptPasswordEncoder.encode(dto.password()));

        residentRepository.save(residentEntity);
    }
}
