package com.tf.service;

import java.util.List;

import com.tf.model.SellerSetting;

public interface SettingService {
	
	public void saveSellerSettings(SellerSetting sellerDTO);
	
	public List<SellerSetting> getSellerSettings();
	
	public SellerSetting getSellerSetting(long sellerCmpId);

}
