package com.tf.dto;

import java.io.Serializable;
import java.util.List;

import com.tf.persistance.util.InvestorDTO;

public class InvestorModel implements Serializable {

	private static final long serialVersionUID = 5347134510188136691L;
	
	private List<InvestorDTO>  investorDTO;
	
	public InvestorModel() {
		// TODO Auto-generated constructor stub
	}

	public List<InvestorDTO> getInvestorDTO() {
		return investorDTO;
	}

	public void setInvestorDTO(List<InvestorDTO> investorDTO) {
		this.investorDTO = investorDTO;
	}

	@Override
	public String toString() {
		return "InvestorModel [investorDTO=" + investorDTO + "]";
	}
	

}
