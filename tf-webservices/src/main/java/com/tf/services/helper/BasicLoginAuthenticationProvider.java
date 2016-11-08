package com.tf.services.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.service.PasswordTrackerLocalServiceUtil;
import com.tf.dao.UserDAO;

@Component
public class BasicLoginAuthenticationProvider implements AuthenticationProvider {
    
    @Autowired
    private UserDAO userDAO;
    
    static final String ORIGIN = "Origin";
    
    @Override
    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
	
        String name = authentication.getName();
        // You can get the password here
        String password = authentication.getCredentials().toString();
        Long userID=userDAO.findUserByEmail(name);
        try {
	    // Your custom authentication logic here
	        if (userID!=null && PasswordTrackerLocalServiceUtil.isSameAsCurrentPassword(userID, password)) {
	            List<GrantedAuthority> grantedAuths = new ArrayList<>();
	            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
	            return new UsernamePasswordAuthenticationToken(name, password, grantedAuths);
	        }
	} catch (PortalException e) {
	    e.printStackTrace();
	} catch (SystemException e) {
	    e.printStackTrace();
	}
       
        return null;
    }
    
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}