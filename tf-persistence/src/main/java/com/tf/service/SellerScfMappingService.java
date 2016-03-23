package com.tf.service;

import com.tf.model.SellerScfCompanyMapping;

import java.util.List;


public interface SellerScfMappingService {
	
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize);
	public Long getSellerScfMappingCount();
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping);
}
