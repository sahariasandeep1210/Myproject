package com.tf.service.impl;

import java.util.Date;
import java.util.List;

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
		if(sellerDTO.getId()==null || sellerDTO.getId()==0){
			sellerDTO.setCreateDate(new Date());
		}else{
			sellerDTO.setUpdateDate(new Date());
		}
		settingDAO.saveSellerSettings(sellerDTO);
	}

	public List<SellerSetting> getSellerSettings() {
		return settingDAO.getSellerSettings();		
	}

	public SellerSetting getSellerSetting(long sellerCmpId) {
		return settingDAO.getSellerSetting(sellerCmpId);
	}

}
