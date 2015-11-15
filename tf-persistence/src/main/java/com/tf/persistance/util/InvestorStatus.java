package com.tf.persistance.util;

public enum InvestorStatus {
	
	NEW("New");
	private final String value;
	
	InvestorStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
