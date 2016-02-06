package com.tf.dao;

import java.util.List;

import com.tf.model.SellerSetting;

public interface SettingDAO {
	
	public void saveSellerSettings(SellerSetting sellerDTO);
	
	public List<SellerSetting> getSellerSettings();
	
	public SellerSetting getSellerSetting(long sellerCmpId);

}
