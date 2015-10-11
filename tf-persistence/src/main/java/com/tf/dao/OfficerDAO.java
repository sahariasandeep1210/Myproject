package com.tf.dao;

import java.util.List;

import com.tf.model.Officer;

public interface OfficerDAO extends BaseDAO<Officer, Long> {
	
	public List<Officer> findOfficersByCompanyId(long id);	
	
	public void addOfficer(List<Officer> officers);
	
	public Officer findById(long id);
	
	public void  addorUpdateOfficer(Officer officer);

}
