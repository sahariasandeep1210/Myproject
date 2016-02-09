package com.tf.service;

import java.util.List;

import com.tf.model.SellerSetting;

import java.util.List;

public interface SettingService {
	
	public void saveSellerSettings(SellerSetting sellerDTO);
	public void updateSellerSettings(SellerSetting sell) ;
	public SellerSetting getSellerSettings();
	public List<SellerSetting> findByCompanyId(Long companyId);
	public SellerSetting findBySellerId(Long id);
	public List<SellerSetting> getSellers();
	public List<Object[]> getSellersName();
	
	List<SellerSetting> getSellersSetting();
	public SellerSetting getSellerSetting(long sellerCmpId);

}
