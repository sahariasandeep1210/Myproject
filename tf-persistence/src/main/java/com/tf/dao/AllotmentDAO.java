package com.tf.dao;

import com.tf.model.Allotment;

import java.util.List;

public interface AllotmentDAO   extends BaseDAO<Allotment, Long> {
	
	public List<Allotment> getALlotmentsbyTrade(long tradeID);
	
	public List<Allotment> groupAllotmentbyBps(long tradeID);
	public List<Allotment> getALlotmentByPortId(long portId,int startIndex,int pageSize);
	public Long getAllotsCount(long allotId);
	public List<Allotment> getALlotmentByPortId(long portId);
	public List<Allotment> getAllotmentByStatus(String status);

}
