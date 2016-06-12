package com.tf.util.exception;


public class DuplicateNumber extends Exception {

	private static final long serialVersionUID = -2375048068700158916L;
	
	private String message = null;
	 
    public DuplicateNumber() {
        super();
    }
 
    public DuplicateNumber(String message) {
        super(message);
        this.message = message;
    }
 
    public DuplicateNumber(Throwable cause) {
        super(cause);
    }
 
    @Override
    public String toString() {
        return message;
    }
 
    @Override
    public String getMessage() {
        return message;
    }

}
