package com.tf.persistance.util;

public enum TradeStatus {
	
	NEW("New"),
	LIVE("Live"),
	ALLOTMENT_PAID("Allotment Paid"),
	HOLD("Hold"),
	SUPPLIER_PAID("Supplier Paid"),
	SCF_REPAYMENT("SCF Repayment"),
	INVESTOR_PAID ("Investor Paid"),
	SETTLED("Settled"),
	CLOSED("Closed");	
		
	private final String value;
	
	TradeStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
