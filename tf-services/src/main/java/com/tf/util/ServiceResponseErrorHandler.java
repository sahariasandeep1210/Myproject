package com.tf.util;

import java.io.IOException;

import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.ResponseErrorHandler;

public class ServiceResponseErrorHandler  implements ResponseErrorHandler {

	private ResponseErrorHandler errorHandler = new DefaultResponseErrorHandler();
	  
	  public void handleError(ClientHttpResponse response)
	    throws IOException
	  {
		ServiceResponseException exception = new ServiceResponseException("Webservice Response Exception");
	    exception.setStatus(response.getStatusCode().toString());
	    exception.setMessage(response.getStatusText());
	    throw exception;
	  }
	  
	  public boolean hasError(ClientHttpResponse response)
	    throws IOException
	  {
	    return this.errorHandler.hasError(response);
	  }

}
