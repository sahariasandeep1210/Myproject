package com.tf.persistance.util;

public enum CompanyStatus {
	
	NEW(0),
	PENDINGCREDITCHECK(1),
	CREDITCHECKSUCCESS(2),
	ACTIVESTATUS(3),
	DELETED(4),
	DISABLED(5);
		
	private final int value;
	
	CompanyStatus(int value){
		this.value = value;
	}

	public int getValue() {
		return value;
	}

}
