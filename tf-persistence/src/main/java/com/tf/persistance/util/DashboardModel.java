package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;

public class DashboardModel  implements Serializable{
	


	private static final long serialVersionUID = -3709717967340206158L;
	
	private long investmentCap;
	private long availToInvest;
	private long amountInvested;
	
	private long invoiceCount;
	private long companyCount;
	private long investorCount;
	
	private BigDecimal settledTradeAmount;
	private BigDecimal liveTradeAmount;
	private BigDecimal totalTradeAmount;
	
	private long settledTradeCount;
	private long liveTradeCount;
	
	private String createCompanyURL;
	private String createInvoiceURL;
	
	private List<Investor> investors;
	
	List<InvestorPortfolio> investorPortfolios;
	
	public DashboardModel() {
		
	}

	
	public long getInvestmentCap() {
	
		return investmentCap;
	}

	
	public void setInvestmentCap(long investmentCap) {
	
		this.investmentCap = investmentCap;
	}

	
	public long getAvailToInvest() {
	
		return availToInvest;
	}

	
	public void setAvailToInvest(long availToInvest) {
	
		this.availToInvest = availToInvest;
	}

	
	public long getAmountInvested() {
	
		return amountInvested;
	}

	
	public void setAmountInvested(long amountInvested) {
	
		this.amountInvested = amountInvested;
	}

	
	public long getInvoiceCount() {
	
		return invoiceCount;
	}

	
	public void setInvoiceCount(long invoiceCount) {
	
		this.invoiceCount = invoiceCount;
	}

	
	public long getCompanyCount() {
	
		return companyCount;
	}

	
	public void setCompanyCount(long companyCount) {
	
		this.companyCount = companyCount;
	}

	
	public long getInvestorCount() {
	
		return investorCount;
	}

	
	public void setInvestorCount(long investorCount) {
	
		this.investorCount = investorCount;
	}

	
	public BigDecimal getSettledTradeAmount() {
	
		return settledTradeAmount;
	}

	
	public void setSettledTradeAmount(BigDecimal settledTradeAmount) {
	
		this.settledTradeAmount = settledTradeAmount;
	}

	
	public BigDecimal getLiveTradeAmount() {
	
		return liveTradeAmount;
	}

	
	public void setLiveTradeAmount(BigDecimal liveTradeAmount) {
	
		this.liveTradeAmount = liveTradeAmount;
	}

	
	public BigDecimal getTotalTradeAmount() {
	
		return totalTradeAmount;
	}

	
	public void setTotalTradeAmount(BigDecimal totalTradeAmount) {
	
		this.totalTradeAmount = totalTradeAmount;
	}

	
	public long getSettledTradeCount() {
	
		return settledTradeCount;
	}

	
	public void setSettledTradeCount(long settledTradeCount) {
	
		this.settledTradeCount = settledTradeCount;
	}

	
	public long getLiveTradeCount() {
	
		return liveTradeCount;
	}

	
	public void setLiveTradeCount(long liveTradeCount) {
	
		this.liveTradeCount = liveTradeCount;
	}

	
	public String getCreateCompanyURL() {
	
		return createCompanyURL;
	}

	
	public void setCreateCompanyURL(String createCompanyURL) {
	
		this.createCompanyURL = createCompanyURL;
	}

	
	public String getCreateInvoiceURL() {
	
		return createInvoiceURL;
	}

	
	public void setCreateInvoiceURL(String createInvoiceURL) {
	
		this.createInvoiceURL = createInvoiceURL;
	}


	
	public List<Investor> getInvestors() {
	
		return investors;
	}


	
	public void setInvestors(List<Investor> investors) {
	
		this.investors = investors;
	}


	
	public List<InvestorPortfolio> getInvestorPortfolios() {
	
		return investorPortfolios;
	}


	
	public void setInvestorPortfolios(List<InvestorPortfolio> investorPortfolios) {
	
		this.investorPortfolios = investorPortfolios;
	}


	@Override
	public String toString() {

		return "DashboardModel [investmentCap=" + investmentCap + ", availToInvest=" + availToInvest + ", amountInvested=" + amountInvested +
			", invoiceCount=" + invoiceCount + ", companyCount=" + companyCount + ", investorCount=" + investorCount + ", settledTradeAmount=" +
			settledTradeAmount + ", liveTradeAmount=" + liveTradeAmount + ", totalTradeAmount=" + totalTradeAmount + ", settledTradeCount=" +
			settledTradeCount + ", liveTradeCount=" + liveTradeCount + ", createCompanyURL=" + createCompanyURL + ", createInvoiceURL=" +
			createInvoiceURL + "]";
	}	
	

}
