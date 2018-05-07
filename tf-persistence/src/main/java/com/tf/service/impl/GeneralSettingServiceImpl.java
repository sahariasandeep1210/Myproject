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
			System.out.println("GeneralSettingServiceImpl******A"+ generalSettingModel.getVatInvestor());
			generalSettingDAO.saveGeneralSettings(generalSetting);
			
		}else{
			System.out.println("GeneralSettingServiceImpl*****B"+ generalSettingModel.getVatInvestor());
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
		generalSetting.setMinLevelOfInvestment(generalSettingModel.getMinLevelOfInvestment());
		generalSetting.setVatInvestor(generalSettingModel.getVatInvestor());
		generalSetting.setVatWhitehall(generalSettingModel.getVatWhitehall());
		generalSetting.setVatSeller(generalSettingModel.getVatSeller());
		return generalSetting;
	}
	
}
