package com.tf.service;

import java.util.List;

import com.tf.model.Officer;

public interface OfficerService {

	
	public List<Officer> findOfficersByCompanyId(long id);
	
	public void addOfficer(List<Officer> officers);
}
