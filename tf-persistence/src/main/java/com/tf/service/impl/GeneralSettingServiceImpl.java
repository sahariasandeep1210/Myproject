package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.GeneralSettingDAO;
import com.tf.model.GeneralSetting;
import com.tf.service.GeneralSettingService;


@Service
public class GeneralSettingServiceImpl implements GeneralSettingService {
	
	@Autowired
	private GeneralSettingDAO generalSettingDAO;
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel){
		generalSettingDAO.saveGeneralSettings(generalSettingModel);
	}
	public GeneralSetting getGeneralSetting(){
		return generalSettingDAO.getGeneralSetting();
	}
	
}
