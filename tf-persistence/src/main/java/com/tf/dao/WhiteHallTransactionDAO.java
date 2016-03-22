package com.tf.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.tf.model.SCFTrade;
import com.tf.model.WhiteHallTransaction;


public interface WhiteHallTransactionDAO extends BaseDAO<WhiteHallTransaction, Serializable> {

	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize);
	public Long getWhiteHallTransactionsCount();
	public List<WhiteHallTransaction> getReportListWithSearch(String searchtxt, Date fromDate, Date toDate,int startIndex, int pageSize);
	public Long getReportListWithSearchCount(String searchtxt, Date fromDate, Date toDate);
}
