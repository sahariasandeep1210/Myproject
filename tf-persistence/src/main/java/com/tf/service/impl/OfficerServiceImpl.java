package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.OfficerDAO;
import com.tf.model.Officer;
import com.tf.service.OfficerService;


@Service
public class OfficerServiceImpl implements OfficerService {
	
	@Autowired
	private OfficerDAO officerDAO;

	public List<Officer> findOfficersByCompanyId(long id) {
		// TODO Auto-generated method stub
		return officerDAO.findOfficersByCompanyId(id);
	}
	
	public void addOfficer(List<Officer> officers){
		 officerDAO.addOfficer(officers);
	}

}
