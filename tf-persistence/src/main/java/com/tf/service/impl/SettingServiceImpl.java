package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;
import com.tf.service.SettingService;

import java.util.List;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO settingDAO;

	public void saveSellerSettings(SellerSetting sellerDTO) {
		settingDAO.saveSellerSettings(sellerDTO);
	}
	public List<SellerSetting> getSellers(){
		return settingDAO.getSellers();
	}
	public SellerSetting getSellerSettings() {
		return settingDAO.getSellerSettings();		
	}
	public List<SellerSetting> findByCompanyId(Long companyId)  {
		return settingDAO.findByCompanyId(companyId);
	}
	public void updateSellerSettings(SellerSetting sellerSetting) {
		 settingDAO.updateSellerSettings(sellerSetting);
	}
	public SellerSetting findBySellerId(Long id){
		return settingDAO.findBySellerId(id);
	}
	public List<Object[]> getSellersName(){
		return settingDAO.getSellersName();
	}
}
