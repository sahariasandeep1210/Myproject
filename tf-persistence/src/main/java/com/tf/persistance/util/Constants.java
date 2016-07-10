package com.tf.persistance.util;


public class Constants {
	
	public static final String ADMIN 						= "Admin"; 
	public static final String SCF_ADMIN 						= "SCF Company Admin"; 
	public static final String SELLER_ADMIN 					= "Seller Admin"; 
	public static final String PRIMARY_INVESTOR_ADMIN 				= "Primary Investor Admin"; 
	
	public static final String OMNI_ADMIN						= "Administrator";	
	public static final String WHITEHALL_ADMIN					= "WhiteHall Admin";
	
	public static final String DATE_FORMAT						= "dd-MM-YYYY";
	
	public static enum STATUS {
	    PENDING("Pending"),
	    APPROVED("Approve"),
	    REJECTED("Reject");
	    
	    private final String value;
		
	    STATUS(String value){
		this.value = value;
	     }

	   public String getValue() {
		return value;
	    }

	}
}
