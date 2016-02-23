package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;

public class InvestorDTO  implements Serializable {
	
	
	private static final long serialVersionUID = -8427199293490117782L;
	
	
	private Long investorID;
	private String name;
	private BigDecimal whitehallShare;
	private BigDecimal cashPosition;
	
	public InvestorDTO() {
		
	}

	public Long getInvestorID() {
		return investorID;
	}

	public void setInvestorID(Long investorID) {
		this.investorID = investorID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getWhitehallShare() {
		return whitehallShare;
	}

	public void setWhitehallShare(BigDecimal whitehallShare) {
		this.whitehallShare = whitehallShare;
	}

	public BigDecimal getCashPosition() {
		return cashPosition;
	}

	public void setCashPosition(BigDecimal cashPosition) {
		this.cashPosition = cashPosition;
	}

	@Override
	public String toString() {
		return "InvestorDTO [investorID=" + investorID + ", name=" + name
				+ ", whitehallShare=" + whitehallShare + ", cashPosition="
				+ cashPosition + "]";
	}
	
	

}
