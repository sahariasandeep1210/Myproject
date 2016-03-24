package com.tf.service;

import com.tf.model.WhiteHallTransaction;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface  WhiteHallTransactionService {

	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize);
	
	public Long getWhiteHallTransactionsCount();
	
	public List<WhiteHallTransaction> getReportListWithSearch(String searchtxt, Date fromDate, Date toDate,int startIndex, int pageSize);
	
	public Long getReportListWithSearchCount(String searchtxt, Date fromDate, Date toDate);
	
	public BigDecimal getWhiteHallEarnings();
}
