package com.tf.dao;

import com.tf.model.GeneralSetting;

import java.util.List;

public interface GeneralSettingDAO extends BaseDAO<GeneralSetting, Long> {
	public void saveGeneralSettings(GeneralSetting generalSettingModel);
	public List<GeneralSetting> getGeneralSettings();

}
