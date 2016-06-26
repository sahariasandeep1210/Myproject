package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.WhiteHallTransaction;
import com.tf.service.WhiteHallTransactionService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Service
public class WhiteHallTransactionServiceImpl implements WhiteHallTransactionService {

	@Autowired
	private WhiteHallTransactionDAO whiteHallTransactionDAO;
	
	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize) {
		return whiteHallTransactionDAO.getWhiteHallTransactions(startIndex, pageSize);
	}

	public Long getWhiteHallTransactionsCount() {
		return whiteHallTransactionDAO.getWhiteHallTransactionsCount();
	}
	
	public List<WhiteHallTransaction> getReportListWithSearch(String searchtxt, Date fromDate, Date toDate,int startIndex, int pageSize){
		return whiteHallTransactionDAO.getReportListWithSearch(searchtxt, fromDate, toDate, startIndex, pageSize);
	}
	
	public Long getReportListWithSearchCount(String searchtxt, Date fromDate, Date toDate){
		return whiteHallTransactionDAO.getReportListWithSearchCount(searchtxt, fromDate, toDate);
	}
	
	public BigDecimal getWhiteHallEarnings(String searchtxt,Date fromDate,Date toDate){
		return whiteHallTransactionDAO.getWhiteHallEarnings(searchtxt,fromDate,toDate);
	}

}
