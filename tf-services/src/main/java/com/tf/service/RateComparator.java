package com.tf.service;

import java.util.Comparator;

public class RateComparator implements Comparator<InvestorPortfolio> {

	public int compare(InvestorPortfolio o1, InvestorPortfolio o2) {
		
		return o1.getRate() - o2.getRate();
	}
}
