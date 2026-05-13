package com.example.cleanflowback.config;

import com.example.cleanflowback.config.security.JwtService;
import com.example.cleanflowback.exception.UnauthorizedAccessException;
import com.example.cleanflowback.model.ContainerEntity;
import com.example.cleanflowback.repository.ContainerRepository;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@Configuration
@EnableWebSocketMessageBroker
@AllArgsConstructor
public class WebSocketConfiguration implements WebSocketMessageBrokerConfigurer {
    private final JwtService jwtService;
    private final UserDetailsService userDetailsService;
    private final ContainerRepository containerRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic", "/queue");
        config.setApplicationDestinationPrefixes("/app");
        config.setUserDestinationPrefix("/user");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
            .setAllowedOriginPatterns("*")
            .setHandshakeHandler(defaultHandshakeHandler())
            .withSockJS();
    }

    @Bean
    public DefaultHandshakeHandler defaultHandshakeHandler() {
        return new DefaultHandshakeHandler() {
            @Override
            protected Principal determineUser(
                ServerHttpRequest request,
                WebSocketHandler wsHandler,
                Map<String, Object> attributes
            ) {
                return super.determineUser(request, wsHandler, attributes);
            }
        };
    }

    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
                StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);

                if (accessor == null || accessor.getCommand() == null) return message;
                if (StompCommand.CONNECT.equals(accessor.getCommand())) {
                    String apiKey = accessor.getFirstNativeHeader("X-Api-Key");
                    String secret = accessor.getFirstNativeHeader("X-Secret");

                    if (apiKey != null && secret != null) {
                        ContainerEntity containerEntity = containerRepository.findByApiKey(apiKey);
                        if (containerEntity != null && passwordEncoder.matches(secret, containerEntity.getSecret())) {
                            UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                                containerEntity, null, List.of(new SimpleGrantedAuthority("ROLE_DEVICE"))
                            );
                            accessor.setUser(auth);
                            accessor.setLeaveMutable(true);
                            return message;
                        }
                        throw new UnauthorizedAccessException("Invalid api key");
                    }

                    String token = accessor.getFirstNativeHeader("Authorization");
                    if (token != null && token.startsWith("Bearer ")) {
                        token = token.substring(7);
                        boolean flag = jwtService.isValidToken(token);
                        if (flag) {
                            String username = jwtService.getUsernameFromToken(token);
                            if (username != null) {
                                UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                                UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                                    userDetails, null, userDetails.getAuthorities()
                                );
                                accessor.setUser(auth);
                                accessor.setLeaveMutable(true);
                                SecurityContextHolder.getContext().setAuthentication(auth);

                                return message;
                            }
                        }
                        throw new UnauthorizedAccessException("Invalid token");
                    }
                    throw new UnauthorizedAccessException("token not found");
                } else {
                    if (accessor.getUser() instanceof UsernamePasswordAuthenticationToken auth) {
                        SecurityContextHolder.getContext().setAuthentication(auth);
                    }
                }
                return message;
            }
        });
    }
}
