package com.tf.dao;


import com.tf.model.FcmToken;

public interface FcmTokenDAO extends BaseDAO<FcmToken, Long> {

	public void addFcmToken(FcmToken fcmToken);
	
	public String getFcmToken(String UserId);
	
	public String getUserId(String regNo);
}
