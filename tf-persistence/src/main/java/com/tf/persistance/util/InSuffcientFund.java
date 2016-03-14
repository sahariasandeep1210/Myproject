package com.tf.persistance.util;

import org.springframework.stereotype.Component;

@Component
public class InSuffcientFund extends Exception {
	
	private static final long serialVersionUID = -5977039358811798725L;
	
	public InSuffcientFund(){
		
	}
	
	 public InSuffcientFund(String s){
	 super(s);
    } 
	 
}
