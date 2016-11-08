package com.tf.services.dto;

import java.io.Serializable;

public class SuccessResponse  implements Serializable{
    
 
    private static final long serialVersionUID = -7160918772686527468L;
    
    
    
    private String status;
    private String message;
    
    public SuccessResponse() {
	// TODO Auto-generated constructor stub
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
	return "SuccessResponse [status=" + status + ", message=" + message
		+ "]";
    }  
    

}
