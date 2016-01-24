package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;

public class InvestorDTO  implements Serializable {
	
	
	
	private static final long serialVersionUID = -2665768060498858807L;
	
	private Long investorID;
	private String name;
	private BigDecimal whitehallShare;
	
	public InvestorDTO() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "InvestorDTO [investorID=" + investorID + ", name=" + name
				+ ", whitehallShare=" + whitehallShare + "]";
	}
	
	
	
	

}
