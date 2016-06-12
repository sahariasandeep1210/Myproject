package com.tf.util.exception;


public class DuplicateName  extends Exception {
	
	
	private static final long serialVersionUID = -4668549774144001671L;
	
	private String message = null;
	 
    public DuplicateName() {
        super();
    }
 
    public DuplicateName(String message) {
        super(message);
        this.message = message;
    }
 
    public DuplicateName(Throwable cause) {
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
