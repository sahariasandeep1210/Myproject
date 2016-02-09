package com.tf.dao;

import java.util.List;

import com.tf.model.Allotment;

public interface AllotmentDAO   extends BaseDAO<Allotment, Long> {
	
	public List<Allotment> getALlotmentsbyTrade(long tradeID);
	public List<Allotment> groupAllotmentbyBps();

}
