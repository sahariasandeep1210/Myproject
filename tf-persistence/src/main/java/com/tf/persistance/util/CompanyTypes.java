package com.tf.persistance.util;

public enum CompanyTypes {
	
	PRIMARY_INVESTOR("1"),
	SECONDARY_INVESTOR("2"),
	ADMIN("3"),
	SELLER("4"),
	SCF_COMPANY("5");	
		
	private final String value;
	
	CompanyTypes(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
