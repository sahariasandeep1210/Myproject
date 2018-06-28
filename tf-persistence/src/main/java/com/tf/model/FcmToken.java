package com.tf.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fcm_token")
public class FcmToken implements Serializable {
     
	   @Id
	   @Column(name="userId")
	   private Long userId;	
		
		@Column(name="token")
		private String token;
		
	
		public FcmToken() {
			// TODO Auto-generated constructor stub
		}


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
			return "FcmToken [userId=" + userId + ", token=" + token +   "]";
		}

}
