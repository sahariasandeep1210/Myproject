package com.tf.services.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.mail.internet.InternetAddress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.liferay.mail.service.MailServiceUtil;
import com.liferay.portal.NoSuchUserException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.model.User;
import com.liferay.portal.service.CompanyLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.util.ContentUtil;
import com.tf.model.Company;
import com.tf.model.GenericListModel;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.DashboardModel;
import com.tf.persistance.util.FinanceConfirmationDTO;
import com.tf.persistance.util.InSuffcientFund;
import com.tf.persistance.util.InvalidDuration;
import com.tf.service.CompanyService;
import com.tf.service.DashBoardService;
import com.tf.service.InvestorService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;
import com.tf.service.SellerScfMappingService;
import com.tf.service.UserService;
import com.tf.services.dto.APRModel;
import com.tf.services.dto.ErrorResponse;
import com.tf.services.dto.Invoice;
import com.tf.services.dto.ListDTO;
import com.tf.services.dto.PasswordReset;
import com.tf.services.dto.SellerDetails;
import com.tf.services.dto.SuccessResponse;
import com.tf.services.dto.Trade;
import com.tf.services.helper.TransformEntities;

@RestController 
public class WhitehallController {
    

	private static final String PASSWORD_CHAR = "abcdefghijklmnopqrstuvwxyz0123456789";

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
	
	@Autowired
	protected SellerScfMappingService sellerScfMappingService;
	
	@Autowired
	private DashBoardService dashBoardService;
	
	@Autowired
	private InvestorService investorService;
    
    
        /**
         * Returns List of invoices based on userId
         * @param userID
         * @param startIndex
         * @param size
         * @return
         * @throws ParseException 
         */
        @SuppressWarnings("unchecked")
		@RequestMapping(value = "/invoices/{userID}",params = { "startIndex", "size" }, method = RequestMethod.GET)  
        public ResponseEntity<ListDTO> getInvoices(@PathVariable("userID") long userID,@RequestParam("startIndex") int startIndex, 
        	@RequestParam("size") int size) throws ParseException {            
            	ListDTO listDTO=new ListDTO();
            	long companyId = userService.getCompanyIDbyUserID(userID);
            	String registrationNo=companyService.findById(companyId).getRegNumber();            	
            	GenericListModel  genericListModel = invoiceService.getInvoices(null,startIndex, size,registrationNo,null,null);
    		if(genericListModel !=null && genericListModel.getList() !=null && genericListModel.getList().size() >0){
    		    List<Invoice> list=transformEntities.getInvoices((List<com.tf.model.Invoice>)genericListModel.getList());    		  
    		    listDTO.setList(list);
    		    listDTO.setPageSize(size);
    		    listDTO.setStartIndex(startIndex);
    		    listDTO.setTotalRecords(genericListModel.getCount());
    		    listDTO.setType("list#Invoices");
    		    return new ResponseEntity<ListDTO>(listDTO, HttpStatus.OK);
    	        }else{
    	            return new ResponseEntity<ListDTO>(listDTO,HttpStatus.NO_CONTENT); 
    	        }
    		
        }  
        
        /**
         * 
         * Returns List of trades based on userId
         * @param userID
         * @param startIndex
         * @param size
         * @return RequestMethod.OPTIONS
         */
        @RequestMapping(value = "/trades/{userID}",params = { "startIndex", "size" }, method = RequestMethod.GET )  
        public ResponseEntity<ListDTO> getTrades(@PathVariable("userID") long userID,@RequestParam("startIndex") int startIndex, 
        	@RequestParam("size") int size) {  
            	ListDTO listDTO=new ListDTO();
            	String order = "";
            	long companyId = userService.getCompanyIDbyUserID(userID);
            	String registrationNo=companyService.findById(companyId).getRegNumber();
            	List<SCFTrade> scftrades = scfTradeService.getScfTradeList(registrationNo, startIndex, size, order, order);
            	Long noOfRecords = scfTradeService.getScfTradeCounts(registrationNo);
    		if(scftrades !=null && scftrades.size() >0){
    		    List<Trade> list=transformEntities.getTrades(scftrades,true);
    		    
    		    listDTO.setList(list);
    		    listDTO.setPageSize(size);
    		    listDTO.setStartIndex(startIndex);
    		    listDTO.setTotalRecords(noOfRecords);
    		    listDTO.setType("list#Trades");
    		    return new ResponseEntity<ListDTO>(listDTO, HttpStatus.OK);
    	        }else{
    	            return new ResponseEntity<ListDTO>(listDTO,HttpStatus.NO_CONTENT); 
    	        }
    		
        } 
        
       @RequestMapping(value = "/trades/{userID}",params = { "startIndex", "size" }, method = RequestMethod.OPTIONS )  
        public ResponseEntity<ListDTO> getTradesAlt(@PathVariable("userID") long userID,@RequestParam("startIndex") int startIndex, 
        	@RequestParam("size") int size) {  
            	ListDTO listDTO=new ListDTO();
            	String order = "";
            	long companyId = userService.getCompanyIDbyUserID(userID);
            	String registrationNo=companyService.findById(companyId).getRegNumber();
            	List<SCFTrade> scftrades = scfTradeService.getScfTradeList(registrationNo, startIndex, size,order, order);
            	Long noOfRecords = scfTradeService.getScfTradeCounts(registrationNo);
    		if(scftrades !=null && scftrades.size() >0){
    		    List<Trade> list=transformEntities.getTrades(scftrades,true);
    		    
    		    listDTO.setList(list);
    		    listDTO.setPageSize(size);
    		    listDTO.setStartIndex(startIndex);
    		    listDTO.setTotalRecords(noOfRecords);
    		    listDTO.setType("list#Trades");
    		    return new ResponseEntity<ListDTO>(listDTO, HttpStatus.OK);
    	        }else{
    	            return new ResponseEntity<ListDTO>(listDTO,HttpStatus.NO_CONTENT); 
    	        }
    		
        }
        
       
       
       
     /**
     * 
     * return Trade details
     * @param userID
     * @param tradeID
     * @return
     */
    @RequestMapping(value = "/trade/{userID}/{tradeID}",method = RequestMethod.GET )  
       public ResponseEntity<Trade> getTradeDetails(@PathVariable("userID") long userID,@PathVariable("tradeID") long tradeID) {
	   
	   SCFTrade scfTrade = scfTradeService.findById(tradeID);
	   Trade tradeDTO =new Trade();
	   transformEntities.transformTrade(scfTrade, tradeDTO,false);
	   return new ResponseEntity<Trade>(tradeDTO, HttpStatus.OK);     
       }
    
    /**
    * 
    * return Trade details
    * @param userID
    * @param tradeID
    * @return
     * @throws InvalidDuration 
     * @throws InSuffcientFund 
    */
   @RequestMapping(value = "/finance/{userID}/{invoiceids}",method = RequestMethod.GET )  
    public ResponseEntity<SuccessResponse> requestFinance(@PathVariable("userID") long userID,@PathVariable("invoiceids") String[] invoiceids) throws InSuffcientFund, InvalidDuration {
       		SuccessResponse successResponse =new SuccessResponse();
               if (invoiceids!=null && invoiceids.length >0) {
        	   	long companyId = userService.getCompanyIDbyUserID(userID);
        		long userId =userService.getUserbyLiferayUserID(userID);
        		List<String> invoicesIdList = Arrays.asList(invoiceids);
        		Date financeDate = 			invoiceService.triggerAllotment(
        				invoicesIdList, companyId, userId);
        		successResponse.setStatus("success");
        		successResponse.setMessage("Your finance allotment is successful for "+getDate(financeDate));
        		 return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.OK);   
        	}else{
        	    successResponse.setStatus("error");
        	    successResponse.setMessage("Invalid Input");
        	    return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.BAD_REQUEST);   
        	}       		
      }
   
   @RequestMapping(value = "/checkfinance/{userID}/{invoiceids}",method = RequestMethod.GET )  
   public ResponseEntity<FinanceConfirmationDTO> checkfinance(@PathVariable("userID") long userID,@PathVariable("invoiceids") String[] invoiceids) throws InSuffcientFund, InvalidDuration {
      		System.out.println("invoiceids::"+invoiceids);
       		FinanceConfirmationDTO financeConfirmationDTO =new FinanceConfirmationDTO();
      		if (invoiceids!=null && invoiceids.length >0) {
       	   	long companyId = userService.getCompanyIDbyUserID(userID);
       		long userId =userService.getUserbyLiferayUserID(userID);
       		List<String> invoicesIdList = Arrays.asList(invoiceids);
       		System.out.println("invoicesIdList:::"+invoicesIdList);
       		 financeConfirmationDTO = 			invoiceService.triggerAllotmentCheck(invoicesIdList, companyId, userId);
       		 
       	}    
              return new ResponseEntity<FinanceConfirmationDTO>(financeConfirmationDTO, HttpStatus.OK);  
     }
       
       
        /**
         * Return Invoice details
         * @param userID
         * @param invoiceID
         * @return
         */
        @RequestMapping(value = "/invoice/{userID}/{invoiceID}", method = RequestMethod.GET)  
        public ResponseEntity<Invoice> getInvoice(@PathVariable("userID") long userID,@PathVariable("invoiceID") long invoiceID) {  
            com.tf.model.Invoice invoice = invoiceService.getInvoicesById(invoiceID);
            Invoice invoiceDTO =new Invoice();
            transformEntities.transformToInvoiceDTO(invoice, invoiceDTO);
	    return new ResponseEntity<Invoice>(invoiceDTO, HttpStatus.OK);            
        } 
        
        
        /**
         * Return APR details
         * @param userID
         * @param invoiceID
         * @return
         */
        @RequestMapping(value = "/apr/{userID}", method = RequestMethod.GET)  
        public ResponseEntity<APRModel> getAPRModel(@PathVariable("userID") long userID) {  
            	Long sellerCmpID = userService.getCompanybyUserID(userID).getId();
		Long companyId=sellerScfMappingService.getSellerScfompany(sellerCmpID);		
		APRModel aprModel=new APRModel();
		if (companyId !=null && companyId >0) {
		    DashboardModel dashModel=new DashboardModel();	
		    dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForGraph(companyId));
		    dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForGraph(companyId));
		    dashBoardService.setDashBoardInformation(dashModel,Constants.SELLER_ADMIN, companyId);
		    transformEntities.getAPRModel(aprModel, dashModel);
		}
		   return new ResponseEntity<APRModel>(aprModel, HttpStatus.OK);            
        } 
        
        /**
         * Return Seller details
         * @param userID
         * @param invoiceID
         * @return
         */
        @RequestMapping(value = "/company/{userID}", method = RequestMethod.GET)  
        public ResponseEntity<SellerDetails> getCompany(@PathVariable("userID") long userID) {  
            	Company sellerCmp = userService.getCompanybyUserID(userID);
		Long scfcompanyId=sellerScfMappingService.getSellerScfompany(sellerCmp.getId());
		SellerDetails sellerDetails=new SellerDetails();
		sellerDetails.setSupplierID(userID);
		transformEntities.getSellerDetails(sellerDetails, sellerCmp);
		sellerDetails.setEmail(userService.getUserbyLiferayID(userID).getEmail());
		if(scfcompanyId!=null && scfcompanyId > 0){
		    sellerDetails.setScfCompanyName(companyService.findById(scfcompanyId).getName());
		}		
		return new ResponseEntity<SellerDetails>(sellerDetails, HttpStatus.OK);            
        } 
        
        
        /**
         * Return Seller details
         * @param userID
         * @param invoiceID
         * @return
         */
        @RequestMapping(value = "/company/{companyId}", method = RequestMethod.PUT)  
        public ResponseEntity<SuccessResponse> updateCompany(@PathVariable("companyId") long companyId,@RequestBody SellerDetails sellerDetails) {            	
            SuccessResponse successResponse =new SuccessResponse();
            if(companyId >0){
                Company company=companyService.findById(companyId);
                company.setTelnumber(sellerDetails.getPhoneNo());
                transformEntities.updateCompanyAddress(sellerDetails, company);
                companyService.addCompany(company);
                successResponse.setStatus("success");
                successResponse.setMessage("Seller information has been updated successfully");
                return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.OK);             
            } else{
        	    successResponse.setStatus("error");
        	    successResponse.setMessage("Invalid Input");
        	    return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.BAD_REQUEST);   
    	}   
        }
        
        /**
         * 
         * return Trade details
         * @param userID
         * @param tradeID
         * @return
         * @throws SystemException 
         * @throws PortalException 
         */
        @RequestMapping(value = "/{userID}/{emailID}/resetpin",method = RequestMethod.GET )  
           public ResponseEntity<SuccessResponse> resetPIN(@PathVariable("userID") long userID,@PathVariable("emailID") String emailID) throws PortalException, SystemException {
            SuccessResponse successResponse =new SuccessResponse();
            User user = UserLocalServiceUtil.getUser(userID);
            if(user!=null && user.getEmailAddress().equals(emailID)){        	
        	String tempPin=generatePIN();
        	user.getExpandoBridge().setAttribute("pin", tempPin,Boolean.FALSE);
        	String emailContent= ContentUtil.get("email/pin_request.html");
        	emailContent=emailContent.replace("<NAME>", user.getFullName());
        	emailContent=emailContent.replace("<PIN>", tempPin);
        	sendEmail("admin@whitehall.com", user.getEmailAddress(), "Pin Reset Request", emailContent);
        	successResponse.setStatus("success");
		successResponse.setMessage("Your PIN reset request has been completed successfully.Please check your email for new PIN");
		return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.OK);   
            }    	   
            successResponse.setStatus("error");
	    successResponse.setMessage("Invalid Input");
	    return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.BAD_REQUEST);     
           }
        
        @RequestMapping(value = "/useremail/{emailID}/forgotPassword",method = RequestMethod.GET )  
        public ResponseEntity<PasswordReset> forgotPassword(@PathVariable("emailID") String emailID) throws PortalException, SystemException {
            PasswordReset passwordReset =new PasswordReset();
        String webId = "liferay.com"; // PropsUtil.get(PropsKeys.COMPANY_DEFAULT_WEB_ID)
        com.liferay.portal.model.Company company = CompanyLocalServiceUtil.getCompanyByWebId(webId);
        long companyID = company.getCompanyId();
        User user = UserLocalServiceUtil.getUserByEmailAddress(companyID, emailID);
        if(user!=null && user.getEmailAddress().equals(emailID)){        	
         	passwordReset.setStatus("success");
         	Set<String> passReminderSet=new HashSet<>();
         	passReminderSet.add(user.getReminderQueryQuestion());
         	passwordReset.setPasswordReminderQuestions(passReminderSet);
         	return new ResponseEntity<PasswordReset>(passwordReset, HttpStatus.OK);   
         }    	   
        passwordReset.setStatus("error");
        passwordReset.setMessage("This email is not registered with us.Please try again!");
	 return new ResponseEntity<PasswordReset>(passwordReset, HttpStatus.BAD_REQUEST);     
        }
        
        @RequestMapping(value = "/useremail/{emailID}/passwordReset",method = RequestMethod.PUT )  
        public ResponseEntity<SuccessResponse> passwordReset(@PathVariable("emailID") String emailID, @RequestBody PasswordReset passwordReset) throws PortalException, SystemException {            
        SuccessResponse successResponse = new SuccessResponse();
        String webId = "liferay.com"; // PropsUtil.get(PropsKeys.COMPANY_DEFAULT_WEB_ID)
        com.liferay.portal.model.Company company = CompanyLocalServiceUtil.getCompanyByWebId(webId);
        long companyID = company.getCompanyId();
        User user = UserLocalServiceUtil.getUserByEmailAddress(companyID, emailID);
        if(user!=null && user.getEmailAddress().equals(emailID) && passwordReset.getPasswordResetQuestion().equals(user.getReminderQueryQuestion()) && passwordReset.getPasswordResetAnswer().equals(user.getReminderQueryAnswer())){  
            	String password = generatePassword(10);
            	UserLocalServiceUtil.updatePassword(user.getUserId(), password, password, false);
        	String emailContent= ContentUtil.get("email/password_request.html");
        	emailContent=emailContent.replace("<NAME>", user.getFullName());
        	emailContent=emailContent.replace("<PASSWORD>", password);
        	sendEmail("admin@whitehall.com", user.getEmailAddress(), "Password Reset Request", emailContent);
        	successResponse.setStatus("success");
        	successResponse.setMessage("Your password reset request has been completed successfully.Please check your email for new password");
         	return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.OK);   
         }    	   
        successResponse.setStatus("error");
        successResponse.setMessage("Your answer does not match in our database!");
	 return new ResponseEntity<SuccessResponse>(successResponse, HttpStatus.BAD_REQUEST);     
        }
        
        
        @RequestMapping(value = "/syncuser/{userID}",method = RequestMethod.GET )  
        public ResponseEntity<String> syncUser(@PathVariable("userID") long userID) throws PortalException, SystemException {
            	User user = UserLocalServiceUtil.getUser(userID);
            	if(user!=null){        
            	    		transformEntities.synchronizeDataFromLifeary(user);    	
    			return new ResponseEntity<String>("success", HttpStatus.OK);   
            	}    	   
             return new ResponseEntity<String>("error", HttpStatus.BAD_REQUEST);   
        }
        
        
        @ExceptionHandler(Exception.class)
	public ResponseEntity<ErrorResponse> exceptionHandler(Exception ex) {
		ErrorResponse error = new ErrorResponse();
		error.setErrorCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
		error.setMessage("Error ocured while processing your request");
		ex.printStackTrace();
		return new ResponseEntity<ErrorResponse>(error, HttpStatus.INTERNAL_SERVER_ERROR);
	}
        
        @ExceptionHandler(InSuffcientFund.class)
      	public ResponseEntity<ErrorResponse> exceptionHandlerInSuffcientFund(InSuffcientFund ex) {
      		ErrorResponse error = new ErrorResponse();
      		error.setErrorCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      		error.setMessage("Finance allotment failed.Please contact whileHall admin for further details");
      		return new ResponseEntity<ErrorResponse>(error, HttpStatus.BAD_REQUEST);
      	}
        
        @ExceptionHandler(InvalidDuration.class)
      	public ResponseEntity<ErrorResponse> exceptionHandlerInvalidDuration(InvalidDuration ex) {
      		ErrorResponse error = new ErrorResponse();
      		error.setErrorCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      		error.setMessage("Payment date should be "+ex.getDuration()+" days later than today's Date");
      		return new ResponseEntity<ErrorResponse>(error, HttpStatus.BAD_REQUEST);
      	} 
      	    
      	@ExceptionHandler(NoSuchUserException.class)
      	public ResponseEntity<ErrorResponse> exceptionHandlerNoSuchUserException(NoSuchUserException ex) {
      		ErrorResponse error = new ErrorResponse();
      		error.setErrorCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
      		error.setMessage("User doesn't exist");
      		return new ResponseEntity<ErrorResponse>(error, HttpStatus.BAD_REQUEST);
      	} 
        
        public String getDate(Date date) {	
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		String format = formatter.format(date);
		return format;
	}
        
        public  String generatePIN() {
	        //generate a 4 digit integer 1000 <10000
	        Integer randomPIN = (int)(Math.random()*9000)+1000;
		return randomPIN.toString(randomPIN);
	 }
        
        public static  String generatePassword(final int length) {
	     char[] chars = PASSWORD_CHAR.toCharArray();
	     StringBuilder sb = new StringBuilder();
	     Random random = new Random();
	     for (int i = 0; i < length; i++) {
	         char c = chars[random.nextInt(chars.length)];
	         sb.append(c);
	     }
	     return sb.toString();
	 }
        
        public void sendEmail(String from, String to, String subject, String body){		
		MailMessage mailMessage = new MailMessage();
		
		try {
			mailMessage.setTo(new InternetAddress(to));
			mailMessage.setFrom(new InternetAddress(from));
			mailMessage.setSubject(subject);
			mailMessage.setBody(body);
			mailMessage.setHTMLFormat(true);
			MailServiceUtil.sendEmail(mailMessage);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
    

}
