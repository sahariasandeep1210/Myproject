package com.tf.persistance.util;

import java.io.Serializable;

public class InvestorDTO  implements Serializable {
	
	
	private static final long serialVersionUID = 4345291237734446085L;
	
	private Long investorID;
	private String name;
	private Integer whitehallShare;
	
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

	public Integer getWhitehallShare() {
		return whitehallShare;
	}

	public void setWhitehallShare(Integer whitehallShare) {
		this.whitehallShare = whitehallShare;
	}

	@Override
	public String toString() {
		return "InvestorDTO [investorID=" + investorID + ", name=" + name
				+ ", whitehallShare=" + whitehallShare + "]";
	}
	
	
	
	

}
