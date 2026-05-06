package com.example.cleanflowback.exception;

public class CredentialsAlreadyUsedException extends RuntimeException {
    public CredentialsAlreadyUsedException(String message) {
        super(message);
    }
}
