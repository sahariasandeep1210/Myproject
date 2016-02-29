package com.tf.service;

import java.util.List;

import com.tf.model.Allotment;

public interface AllotmentService {
	
	public List<Allotment> getALlotmentsbyTrade(long tradeID);
	
	public List<Allotment> groupAllotmentbyBps(long tradeID);
	
	public List<Allotment> getALlotmentByPortId(long portId,int startIndex,int pageSize);
	
	public Long getAllotsCount(long allotId);
	
	public List<Allotment> getAllotmentByInvestorAndStatus(long invId,String status);
	
	public List<Allotment> getAllotmentByStatus(String status);

}
