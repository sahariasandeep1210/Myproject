package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;
import com.tf.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO settingDAO;

	public void saveSellerSettings(SellerSetting sellerDTO) {
		settingDAO.saveSellerSettings(sellerDTO);
	}

}
