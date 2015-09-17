package com.tf.persistance.util;

public enum CompanyStatus {
	
	NEW("New"),
	PENDINGCREDITCHECK("Pending Credit Check"),
	CREDITCHECKSUCCESS("Credit Check Success"),
	ACTIVESTATUS("Active"),
	DELETED("Deleted"),
	DISABLED("Disabled");
		
	private final String value;
	
	CompanyStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
