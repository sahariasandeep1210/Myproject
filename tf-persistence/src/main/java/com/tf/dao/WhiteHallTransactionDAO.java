package com.tf.dao;

import java.io.Serializable;
import java.util.List;

import com.tf.model.SCFTrade;
import com.tf.model.WhiteHallTransaction;


public interface WhiteHallTransactionDAO extends BaseDAO<WhiteHallTransaction, Serializable> {

	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize);
	public Long getWhiteHallTransactionsCount();
}
