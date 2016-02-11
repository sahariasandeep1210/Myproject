package com.tf.dao;

import com.tf.model.GeneralSetting;

public interface GeneralSettingDAO extends BaseDAO<GeneralSetting, Long> {
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel);
	
	public GeneralSetting getGeneralSetting();

}
