package com.tf.dao;

import com.tf.model.SellerScfCompanyMapping;

import java.io.Serializable;
import java.util.List;


public interface SellerScfMappingDAO   extends BaseDAO<SellerScfCompanyMapping, Serializable> {
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize,Long sellerComapanyId,Long scfCompanyId,String status[]);
	public Long getSellerScfMappingCount();
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping);
	public void updateStatus(Long id,String status,String comment);
}
