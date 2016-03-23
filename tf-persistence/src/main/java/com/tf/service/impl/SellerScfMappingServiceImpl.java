package com.tf.service.impl;

import com.tf.dao.SellerScfMappingDAO;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.service.SellerScfMappingService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SellerScfMappingServiceImpl implements SellerScfMappingService{
	
	@Autowired
	 protected SellerScfMappingDAO sellerScfMappingDAO;

	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize){
		return sellerScfMappingDAO.getSellerScfMapping(startIndex, pageSize);
	}
	public Long getSellerScfMappingCount(){
		return sellerScfMappingDAO.getSellerScfMappingCount();
	}
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping){
		sellerScfMappingDAO.saveSeller(sellerScfMapping);
	}
	
}
