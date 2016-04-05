package com.tf.service;

import com.tf.model.SellerScfCompanyMapping;

import java.util.List;


public interface SellerScfMappingService {
	
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize,Long sellerComapanyId,Long scfCompanyId,String status[]);
	public Long getSellerScfMappingCount();
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping);
	public void updateStatus(Long id, String status,String comment);
}
