package com.tf.util;

import org.springframework.web.client.RestClientException;

public class ServiceResponseException extends RestClientException {
	
	private static final long serialVersionUID = 4904287952437163146L;
	private String status;
	private String message;

	public ServiceResponseException(String msg) {
		super(msg);
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String toString() {
		return "ServiceResponseExceptionStatus [status=" + this.status
				+ ", message=" + this.message + "]";
	}
}
