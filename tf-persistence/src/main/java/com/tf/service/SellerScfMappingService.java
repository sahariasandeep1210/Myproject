package com.tf.service;

import com.tf.model.Company;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.persistance.util.SellerScfCompanyDTO;

import java.util.List;


public interface SellerScfMappingService {
	
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize,Long sellerComapanyId,Long scfCompanyId,String status[]);
	
	public Long getSellerScfMappingCount();
	
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping);
	
	public void updateStatus(Long id, String status,String comment);
	
	public Long getSellerScfompany(Long sellerComapanyId);
	
	public Long getSellerScfMappingCountBasedOnId(Long scfCompanyID);
	
	public List<SellerScfCompanyMapping> getSellerCompanies(Long sellerComp);
	
	public List<SellerScfCompanyDTO> getSellerScfMappingAdminList(int startIndex, int pageSize, Long loggedInUserId, String orderBy);
}
