package com.tf.persistance.util;

public enum TradeStatus {
	
	NEW("New"),
	LIVE("Live"),
	SETTLED("Settled"),
	COMPLETED("Completed");	
		
	private final String value;
	
	TradeStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
