package com.tf.persistance.util;

public enum InvoiceStatus {
	
	NEW("New"),
	FINANCE_REQUESTED("Finance Requested"),
	TRADE_GENERATED("Trade Generated");	
		
	private final String value;
	
	InvoiceStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
