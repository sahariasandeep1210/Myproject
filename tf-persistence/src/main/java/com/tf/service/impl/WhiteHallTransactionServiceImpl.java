package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.WhiteHallTransaction;
import com.tf.service.WhiteHallTransactionService;

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

}
