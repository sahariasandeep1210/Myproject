package com.tf.util.exception;


public class DuplicateNameException  extends Exception {
	

	private static final long serialVersionUID = 2492485670974026195L;
	
	
	private String message = null;
	 
    public DuplicateNameException() {
        super();
    }
 
    public DuplicateNameException(String message) {
        super(message);
        this.message = message;
    }
 
    public DuplicateNameException(Throwable cause) {
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
