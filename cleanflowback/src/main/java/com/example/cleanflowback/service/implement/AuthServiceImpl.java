package com.example.cleanflowback.service.implement;

import com.example.cleanflowback.config.security.JwtService;
import com.example.cleanflowback.dto.in.CreateAdminRequestDTO;
import com.example.cleanflowback.dto.in.CreateDriverRequestDTO;
import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
import com.example.cleanflowback.dto.in.LoginRequestDTO;
import com.example.cleanflowback.dto.out.LoginResponseDTO;
import com.example.cleanflowback.exception.CredentialsAlreadyUsedException;
import com.example.cleanflowback.exception.UserInvalidCredentialsException;
import com.example.cleanflowback.mapper.AdminMapper;
import com.example.cleanflowback.mapper.DriverMapper;
import com.example.cleanflowback.mapper.ResidentMapper;
import com.example.cleanflowback.model.*;
import com.example.cleanflowback.repository.AdminRepository;
import com.example.cleanflowback.repository.DriverRepository;
import com.example.cleanflowback.repository.ResidentRepository;
import com.example.cleanflowback.repository.UserRepository;
import com.example.cleanflowback.service.AuthService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final ResidentMapper residentMapper;
    private final ResidentRepository residentRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final JwtService jwtService;
    private final DriverMapper driverMapper;
    private final DriverRepository driverRepository;
    private final AdminMapper adminMapper;
    private final AdminRepository adminRepository;

    @Override
    public void createResident(CreateResidentRequestDTO dto) {
        checkUsernameAndEmail(dto.username(), dto.email());

        ResidentEntity residentEntity = residentMapper.toEntity(dto);
        residentEntity.setRole(RoleEnum.RESIDENT);
        residentEntity.setPassword(bCryptPasswordEncoder.encode(dto.password()));

        residentRepository.save(residentEntity);
    }

    @Override
    public void createDriver(CreateDriverRequestDTO dto) {
        checkUsernameAndEmail(dto.username(), dto.email());

        DriverEntity driverEntity = driverMapper.toEntity(dto);
        driverEntity.setPassword(bCryptPasswordEncoder.encode(dto.password()));
        driverEntity.setRole(RoleEnum.DRIVER);

        driverRepository.save(driverEntity);
    }

    @Override
    public void createAdmin(CreateAdminRequestDTO dto) {
        checkUsernameAndEmail(dto.username(), dto.email());

        AdminEntity adminEntity = adminMapper.fromDTOtoEntity(dto);
        adminEntity.setRole(RoleEnum.ADMIN);
        adminEntity.setPassword(bCryptPasswordEncoder.encode(dto.password()));

        adminRepository.save(adminEntity);
    }

    @Override
    public LoginResponseDTO login(LoginRequestDTO dto) {
        UserEntity user = userRepository.findByUsername(dto.username())
            .orElseThrow(() -> new UserInvalidCredentialsException("username not found"));

        if (!bCryptPasswordEncoder.matches(dto.password(), user.getPassword())) {
            throw new UserInvalidCredentialsException("username or password is incorrect");
        }

        Map<String, Object> claims = buildClaims(user);

        return new LoginResponseDTO(
            jwtService.buildAccessToken(claims)
        );
    }

    private Map<String, Object> buildClaims(UserEntity user) {
        return Map.of(
            "id", user.getId(),
            "username", user.getUsername(),
            "first_name", user.getFirstName(),
            "last_name", user.getLastName(),
            "role", user.getRole().name()
        );
    }

    private void checkUsernameAndEmail(String username, String email) {
        if (userRepository.existsByUsername(username)) {
            throw new CredentialsAlreadyUsedException("username is already in use");
        }

        if (userRepository.existsByEmail(email)) {
            throw new CredentialsAlreadyUsedException("email is already in use");
        }
    }
}
