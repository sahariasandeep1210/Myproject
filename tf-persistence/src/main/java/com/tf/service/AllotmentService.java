package com.tf.service;

import java.util.List;

import com.tf.model.Allotment;

public interface AllotmentService {
	
	public List<Allotment> getALlotmentsbyTrade(long tradeID);
	public List<Allotment> groupAllotmentbyBps(long tradeID);

}
