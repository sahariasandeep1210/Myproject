package com.tf.service;

import com.tf.model.GeneralSetting;
import com.tf.model.SellerSetting;

import java.util.List;

public interface GeneralSettingService {
	public void saveGeneralSettings(GeneralSetting generalSettingModel);
	public List<GeneralSetting> getGeneralSettings();
}
