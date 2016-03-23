package com.tf.dao;

import com.tf.model.SellerScfCompanyMapping;

import java.io.Serializable;
import java.util.List;


public interface SellerScfMappingDAO   extends BaseDAO<SellerScfCompanyMapping, Serializable> {
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize);
	public Long getSellerScfMappingCount();
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping);
}
