package com.tf.util.exception;


public class DuplicateNumberException extends Exception {

	private static final long serialVersionUID = -2512854533811162524L;
	
	
	private String message = null;
	 
    public DuplicateNumberException() {
        super();
    }
 
    public DuplicateNumberException(String message) {
        super(message);
        this.message = message;
    }
 
    public DuplicateNumberException(Throwable cause) {
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
