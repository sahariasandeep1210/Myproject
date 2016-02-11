package com.tf.service.impl;

import com.tf.dao.GeneralSettingDAO;
import com.tf.model.GeneralSetting;
import com.tf.model.SellerSetting;
import com.tf.service.GeneralSettingService;

import java.util.List;

import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class GeneralSettingServiceImpl implements GeneralSettingService {
	@Autowired
	private GeneralSettingDAO generalSettingDAO;
	public void saveGeneralSettings(GeneralSetting generalSettingModel){
		generalSettingDAO.saveGeneralSettings(generalSettingModel);
	}
	public List<GeneralSetting> getGeneralSettings(){
		return generalSettingDAO.getGeneralSettings();
	}
	
}
