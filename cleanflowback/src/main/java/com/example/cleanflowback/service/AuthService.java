package com.example.cleanflowback.service;

import com.example.cleanflowback.dto.in.CreateDriverRequestDTO;
import com.example.cleanflowback.dto.in.CreateResidentRequestDTO;
import com.example.cleanflowback.dto.in.LoginRequestDTO;
import com.example.cleanflowback.dto.out.LoginResponseDTO;

public interface AuthService {
    void createResident(CreateResidentRequestDTO createResidentRequestDTO);
    void createDriver(CreateDriverRequestDTO createDriverRequestDTO);
    LoginResponseDTO login(LoginRequestDTO loginRequestDTO);
}
