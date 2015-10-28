package com.tf.service;

import java.util.Comparator;

public class AvailableAmountComparator implements Comparator <InvestorPortfolio>{

	public int compare(InvestorPortfolio o1, InvestorPortfolio o2) {
		if (o1.getRate() == o2.getRate()){
			return o1.getAvailableAmt() - o2.getAvailableAmt();
		}else{
			return o1.getRate() - o2.getRate();
		}
		
	}

}
