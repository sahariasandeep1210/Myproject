package com.tf.service;

import com.tf.model.WhiteHallTransaction;

import java.util.List;

public interface  WhiteHallTransactionService {

	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize);
	
	public Long getWhiteHallTransactionsCount();
}
