package com.tf.service;


import com.tf.model.FcmToken;

public interface FcmTokenService {

	public void addFcmToken(FcmToken fcmToken);
	public String getUserId(String regNo);
	public String getFcmToken(String userId);
}
