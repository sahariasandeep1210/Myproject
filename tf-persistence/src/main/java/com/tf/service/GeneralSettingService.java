package com.tf.service;

import com.tf.model.GeneralSetting;

public interface GeneralSettingService {
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel);
	
	public GeneralSetting getGeneralSetting();
}
