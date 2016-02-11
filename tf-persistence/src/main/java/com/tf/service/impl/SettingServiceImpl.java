package com.tf.service.impl;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;
import com.tf.service.SettingService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO settingDAO;

	public void saveSellerSettings(SellerSetting sellerLists) {		
		settingDAO.saveSellerSettings(sellerLists);
	}
	
	public List<SellerSetting> getSellers(){
		return settingDAO.getSellers();
	}
	
	public List<SellerSetting> findByCompanyId(Long companyId)  {
		return settingDAO.findByCompanyId(companyId);
	}
	
	public void updateSellerSettings(SellerSetting sellerSetting) {
		 settingDAO.updateSellerSettings(sellerSetting);
	}
	
	public List<Object[]> getSellersName(){
		return settingDAO.getSellersName();
	}
	
	public List<SellerSetting> getSellerList(long companyId){
		return settingDAO.getSellerList(companyId);
	}
	
	public List<SellerSetting> getSellersSetting(){
		return settingDAO.getSellersSetting();
	}
	
	public SellerSetting getSellerSetting(long sellerCmpId) {
		return settingDAO.getSellerSetting(sellerCmpId);
	}
	
	

}
