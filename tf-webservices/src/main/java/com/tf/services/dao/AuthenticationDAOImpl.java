package com.tf.services.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.liferay.portal.service.UserLocalServiceUtil;
import com.tf.dao.UserDAO;


@Repository
public class AuthenticationDAOImpl  implements AuthenticationDAO,UserDetailsService{
    
    
    @Autowired
    private UserDAO userDAO;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
	try{
	   Long userID=userDAO.findUserByEmail(username);
	 
	 
	    if(userID!=null && userID >0){
		 List<GrantedAuthority> authorities = buildUserAuthority();
		 return new User(username,   UserLocalServiceUtil.getUser(userID).getPasswordUnencrypted(), true,true, true, true, authorities);
	    }
	   
	   
	}catch(Exception ex){
	    
	}
	return null;
    }
    
    	// Converts com.mkyong.users.model.User user to
 	// org.springframework.security.core.userdetails.User
 	private User buildUserForAuthentication(User user,
 		List<GrantedAuthority> authorities) {
 		return new User(user.getUsername(),
 			user.getPassword(), true,
                         true, true, true, authorities);
 	}

    
    private List<GrantedAuthority> buildUserAuthority() {
	List<GrantedAuthority> result = new ArrayList<GrantedAuthority>();
	result.add(new SimpleGrantedAuthority("ROLE_USER"));
	return result;
    }

}
