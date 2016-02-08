package com.tf.service;

import com.tf.model.SellerSetting;

import java.util.List;

public interface SettingService {
	
	public void saveSellerSettings(SellerSetting sellerDTO);
	public void updateSellerSettings(SellerSetting sellerSetting) ;
	public SellerSetting getSellerSettings();
	public List<SellerSetting> findByCompanyId(Long companyId);
	public SellerSetting findBySellerId(Long id);
	public List<SellerSetting> getSellers();
	public List<Object[]> getSellersName();
}
