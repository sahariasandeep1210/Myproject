package com.tf.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.CompanyDAO;
import com.tf.dao.FcmTokenDAO;
import com.tf.model.FcmToken;
import com.tf.service.FcmTokenService;

@Service
public class FcmTokenServiceImpl implements FcmTokenService {


	@Autowired
	private FcmTokenDAO fcmTokenDao;
	public void addFcmToken(FcmToken fcmToken) {
		// TODO Auto-generated method stub
		fcmTokenDao.addFcmToken(fcmToken);
	}
	public String getFcmToken(String userId) {
		// TODO Auto-generated method stub
		
		return fcmTokenDao.getFcmToken(userId);
	}
	public String getUserId(String regNo) {
		// TODO Auto-generated method stub
		return fcmTokenDao.getUserId(regNo);
	}

	
}
