package com.tf.dao;

import com.tf.model.SellerSetting;

import java.util.List;

public interface SettingDAO {
	
	public void saveSellerSettings(SellerSetting sellerLists);

	public void updateSellerSettings(SellerSetting sellerSetting) ;
	
	public List<SellerSetting> findByCompanyId(Long companyId);
	
	public List<SellerSetting> getSellers();
	
	public List<Object[]> getSellersName();
	
	public List<SellerSetting> getSellerList(long companyId);
	
	public List<SellerSetting> getSellersSetting();

	public SellerSetting getSellerSetting(long sellerCmpId);

}
