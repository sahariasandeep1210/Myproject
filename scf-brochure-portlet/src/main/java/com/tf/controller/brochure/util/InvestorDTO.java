package com.tf.controller.brochure.util;

import java.util.List;

import com.tf.model.InvestorPortfolio;

public class InvestorDTO {
	
	private List<InvestorPortfolio>  investorModel;
	
	public InvestorDTO() {
		// TODO Auto-generated constructor stub
	}

	public List<InvestorPortfolio> getInvestorModel() {
		return investorModel;
	}

	public void setInvestorModel(List<InvestorPortfolio> investorModel) {
		this.investorModel = investorModel;
	}

}
