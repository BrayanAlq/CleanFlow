package com.example.cleanflowback.config.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.Map;

@Service
public class JwtService {
    @Value("${security.jwt.secret-key}")
    private String secretKey;

    @Value("${security.jwt.expiration-time}")
    private long expirationTime;

    private SecretKey getSecretKey() {
        return Keys.hmacShaKeyFor(Decoders.BASE64.decode(secretKey));
    }

    public String buildAccessToken(Map<String, Object> claims) {
        return Jwts.builder()
            .claims(claims)
            .signWith(getSecretKey())
            .expiration(new Date(System.currentTimeMillis() + expirationTime))
            .compact();
    }

    public Map<String, Object> extractPayload(String token) {
        try {
            return Jwts.parser()
                .verifyWith(getSecretKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
        } catch (SignatureException e) {
            return null;
        }
    }

    public boolean isValidToken(String token) {
        try {
            Jwts.parser()
                .verifyWith(getSecretKey())
                .build()
                .parseSignedClaims(token);
            return true;
        } catch (SignatureException e) {
            return false;
        }
    }

    public String getUsernameFromToken(String token) {
        Map<String, Object> claims = extractPayload(token);
        return claims != null ? claims.get("username").toString() : null;
    }
}
