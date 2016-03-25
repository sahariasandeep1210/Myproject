package com.tf.persistance.util;


public enum TranscationStatus {
	
	DEPOSIT("Deposit"),
	WITHDRAWAL("Withdrawal"),
	ALLOTED("Alloted"),
	INVESTED("Invested"),
	REPAID("Repaid"),
	PROFIT("Profit"),	
	INVETOR_PROFIT("Investor Profit"),
	WHITEHALL_PROFIT("Whitehall Profit"),
	WHITEHALL_FEE("Whitehall Fee");
		
	private final String value;
	
	TranscationStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}

