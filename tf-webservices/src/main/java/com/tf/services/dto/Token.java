package com.tf.services.dto;

import java.io.Serializable;

public class Token implements Serializable{

	 private Long 	userId;
	  
	      private String token;

		public Long getUserId() {
			return userId;
		}

		public void setUserId(Long userId) {
			this.userId = userId;
		}

		public String getToken() {
			return token;
		}

		public void setToken(String token) {
			this.token = token;
		}
	    
		 @Override
		    public String toString() {
			return "Token [userId=" + userId
				+ ", supplierCompanyID=" + token +"]";
				
}

}