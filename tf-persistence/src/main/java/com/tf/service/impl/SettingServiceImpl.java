package com.tf.service.impl;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;
import com.tf.service.SettingService;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDAO settingDAO;

	public void saveSellerSettings(SellerSetting sellerDTO) {
		if(sellerDTO.getId()==null || sellerDTO.getId()==0){
			sellerDTO.setCreateDate(new Date());
		}else{
			sellerDTO.setUpdateDate(new Date());
		}
		settingDAO.saveSellerSettings(sellerDTO);
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
	public SellerSetting findBySellerId(Long id){
		return settingDAO.findBySellerId(id);
	}
	public List<Object[]> getSellersName(){
		return settingDAO.getSellersName();
	}

	/*public List<SellerSetting> getSellerSettings() {
		return settingDAO.getSellerSettings();		
	}
*/
	public List<SellerSetting> getSellersSetting(){
		return settingDAO.getSellersSetting();
	}
	public SellerSetting getSellerSetting(long sellerCmpId) {
		return settingDAO.getSellerSetting(sellerCmpId);
	}
	public SellerSetting getSellerSettings() {
		// TODO Auto-generated method stub
		return null;
	}

}
