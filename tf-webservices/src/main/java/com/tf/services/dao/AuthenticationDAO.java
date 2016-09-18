package com.tf.services.dao;

import org.springframework.security.core.userdetails.UserDetails;

public interface AuthenticationDAO {
    
    public UserDetails loadUserByUsername(String username);

}
