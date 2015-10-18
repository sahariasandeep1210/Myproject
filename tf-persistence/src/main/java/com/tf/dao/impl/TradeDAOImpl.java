package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.TradeDAO;
import com.tf.model.Trade;

@Repository
@Transactional(rollbackFor = Exception.class)
public class TradeDAOImpl  extends BaseDAOImpl<Trade, Long> implements TradeDAO {
	
	public TradeDAOImpl() {
		super(Trade.class);
	}

}
