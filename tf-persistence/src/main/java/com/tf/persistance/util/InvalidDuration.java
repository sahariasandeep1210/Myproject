package com.tf.persistance.util;

import org.springframework.stereotype.Component;


@Component
public class InvalidDuration extends Exception {
	

	private static final long serialVersionUID = 5099564774775185627L;
	
	private int duration;

	
	public int getDuration() {	
	    return duration;
	}

	
	public void setDuration(int duration) {	
	    this.duration = duration;
	}

	public InvalidDuration(){
		
	}
	
	public InvalidDuration(int duration){
	    this.duration=duration;
	}
	
	 public InvalidDuration(String s){
	     super(s);
	 } 

}
