package com.tf.listener;

import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.liferay.portal.ModelListenerException;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.model.BaseModelListener;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.tf.persistance.util.Constants;
import com.tf.util.RestServiceConsumerUtil;

public class CustomUserListener extends BaseModelListener<User>  {
    
    
    public void onAfterUpdate(User user) throws ModelListenerException {
	try {
	    System.out.println(user.getFullName());
	    List<Role> userRoles = user.getRoles();
	    String userRole="";
	    for(Role role : userRoles){
		if(role.getName().equalsIgnoreCase(Constants.OMNI_ADMIN) || role.getName().equalsIgnoreCase(Constants.WHITEHALL_ADMIN) ){
			userRole=Constants.WHITEHALL_ADMIN;
			break;
		}
		
	    }
	    if(!Constants.WHITEHALL_ADMIN.equals(userRole)){
		 HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);	
		    
		    HttpEntity<String> request = new HttpEntity<String>(headers);
		    ResponseEntity<String>  response   = RestServiceConsumerUtil.restTemplate.exchange(
			    PropsUtil.get("user.sync.url") + user.getUserId(), HttpMethod.GET, request, String.class);
	    }	   
	   
	} catch (Exception e) {
	    e.getStackTrace();
	}
        
    }

}
