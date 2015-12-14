package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.AllotmentDAO;
import com.tf.model.Allotment;
import com.tf.service.AllotmentService;

@Service
public class AllotmentServiceImpl implements AllotmentService{
	
	@Autowired
	private AllotmentDAO allotmentDAO;

	public List<Allotment> getALlotmentsbyTrade(long tradeID) {
		// TODO Auto-generated method stub
		return allotmentDAO.getALlotmentsbyTrade(tradeID);
	}

}
