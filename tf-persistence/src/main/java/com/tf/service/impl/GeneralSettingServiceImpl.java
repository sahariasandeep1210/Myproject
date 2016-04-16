package com.tf.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.GeneralSettingDAO;
import com.tf.model.GeneralSetting;
import com.tf.service.GeneralSettingService;


@Service
public class GeneralSettingServiceImpl implements GeneralSettingService {
	
	@Autowired
	private GeneralSettingDAO generalSettingDAO;
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel){
		Date date =new Date();
		if(generalSettingModel.getId()!=null){
			GeneralSetting generalSetting=getGenralSettingFromModel(generalSettingModel);
			generalSetting.setUpdateDate(date);
			generalSettingDAO.saveGeneralSettings(generalSetting);
		}else{
			generalSettingModel.setCreateDate(date);
			generalSettingDAO.saveGeneralSettings(generalSettingModel);
		}
		
	}
	
	public GeneralSetting getGeneralSetting(){
		return generalSettingDAO.getGeneralSetting();
	}
	
	private GeneralSetting getGenralSettingFromModel(GeneralSetting generalSettingModel) {
		GeneralSetting generalSetting =generalSettingDAO.findById(generalSettingModel.getId());
		generalSetting.setSellerFinFee(generalSettingModel.getSellerFinFee());
		generalSetting.setSellerTransFee(generalSettingModel.getSellerTransFee());
		generalSetting.setMinPaymentDateDuartion(generalSettingModel.getMinPaymentDateDuartion());
		generalSetting.setVat(generalSettingModel.getVat());
		generalSetting.setWhitehalShare(generalSettingModel.getWhitehalShare());
		return generalSetting;
	}
	
}
