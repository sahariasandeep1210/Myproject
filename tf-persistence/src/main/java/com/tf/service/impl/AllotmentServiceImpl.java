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
	public List<Allotment> groupAllotmentbyBps(long tradeID){
		return allotmentDAO.groupAllotmentbyBps(tradeID);
	}
	public List<Allotment> getALlotmentByPortId(long portId,int startIndex,int pageSize){
		return allotmentDAO.getALlotmentByPortId(portId,startIndex,pageSize);
	}
	public Long getAllotsCount(long allotId){
		return allotmentDAO.getAllotsCount(allotId);
	}
	public List<Allotment> getAllotmentByInvestorAndStatus(long invId,String status){
		return allotmentDAO.getAllotmentByInvestorAndStatus(invId,status);
	}
	public List<Allotment> getAllotmentByStatus(String status){
		return allotmentDAO.getAllotmentByStatus(status);
	}

}
