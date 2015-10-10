package com.tf.dao;

import java.util.List;

import com.tf.model.Officer;

public interface OfficerDAO {
	
	public List<Officer> findOfficersByCompanyId(long id);
	
	
	public void addOfficer(List<Officer> officers);

}
