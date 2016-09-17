package com.tf.services.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tf.model.GenericListModel;
import com.tf.model.SCFTrade;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;
import com.tf.service.UserService;
import com.tf.services.dto.ErrorResponse;
import com.tf.services.dto.Invoice;
import com.tf.services.dto.ListDTO;
import com.tf.services.dto.Trade;
import com.tf.services.helper.TransformEntities;


@RestController 
public class WhitehallController {
    

	@Autowired
	protected InvoiceService invoiceService;
	
	@Autowired
	protected UserService userService;
	
	@Autowired
	protected CompanyService companyService;
	
	@Autowired
	protected TransformEntities transformEntities;
	
	@Autowired
	private SCFTradeService scfTradeService;
    
    
        @RequestMapping(value = "/invoices/{userID}",params = { "startIndex", "size" }, method = RequestMethod.GET)  
        public ResponseEntity<ListDTO> getInvoices(@PathVariable("userID") long userID,@RequestParam("startIndex") int startIndex, 
        	@RequestParam("size") int size) {  
            	long companyId = userService.getCompanyIDbyUserID(userID);
            	String registrationNo=companyService.findById(companyId).getRegNumber();
    		GenericListModel  genericListModel = invoiceService.getInvoices(null,startIndex, size,registrationNo);
    		if(genericListModel !=null && genericListModel.getList() !=null && genericListModel.getList().size() >0){
    		    List<Invoice> list=transformEntities.getInvoices((List<com.tf.model.Invoice>)genericListModel.getList());
    		    ListDTO listDTO=new ListDTO();
    		    listDTO.setList(list);
    		    listDTO.setPageSize(size);
    		    listDTO.setStartIndex(startIndex);
    		    listDTO.setTotalRecords(genericListModel.getCount());
    		    listDTO.setType("list#Invoices");
    		    return new ResponseEntity<ListDTO>(listDTO, HttpStatus.OK);
    	        }else{
    	            return new ResponseEntity<ListDTO>(HttpStatus.NO_CONTENT); 
    	        }
    		
        }  
        
        @RequestMapping(value = "/trades/{userID}",params = { "startIndex", "size" }, method = RequestMethod.GET)  
        public ResponseEntity<ListDTO> getTrades(@PathVariable("userID") long userID,@RequestParam("startIndex") int startIndex, 
        	@RequestParam("size") int size) {  
            	long companyId = userService.getCompanyIDbyUserID(userID);
            	String registrationNo=companyService.findById(companyId).getRegNumber();
            	List<SCFTrade> scftrades = scfTradeService.getScfTradeList(registrationNo, startIndex, size);
            	Long noOfRecords = scfTradeService.getScfTradeCounts(registrationNo);
    		if(scftrades !=null && scftrades.size() >0){
    		    List<Trade> list=transformEntities.getTrades(scftrades);
    		    ListDTO listDTO=new ListDTO();
    		    listDTO.setList(list);
    		    listDTO.setPageSize(size);
    		    listDTO.setStartIndex(startIndex);
    		    listDTO.setTotalRecords(noOfRecords);
    		    listDTO.setType("list#Trades");
    		    return new ResponseEntity<ListDTO>(listDTO, HttpStatus.OK);
    	        }else{
    	            return new ResponseEntity<ListDTO>(HttpStatus.NO_CONTENT); 
    	        }
    		
        } 
        
        @RequestMapping(value = "/invoice/{userID}/{invoiceID}", method = RequestMethod.GET)  
        public ResponseEntity<Invoice> getInvoice(@PathVariable("userID") long userID,@PathVariable("invoiceID") long invoiceID) {  
            com.tf.model.Invoice invoice = invoiceService.getInvoicesById(invoiceID);
            Invoice invoiceDTO =new Invoice();
            transformEntities.transformToInvoiceDTO(invoice, invoiceDTO);
	    return new ResponseEntity<Invoice>(invoiceDTO, HttpStatus.OK);            
        } 
        
        
        
        @ExceptionHandler(Exception.class)
	public ResponseEntity<ErrorResponse> exceptionHandler(Exception ex) {
		ErrorResponse error = new ErrorResponse();
		error.setErrorCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
		error.setMessage("Error ocured while processing your request");
		return new ResponseEntity<ErrorResponse>(error, HttpStatus.INTERNAL_SERVER_ERROR);
	}

    

}
