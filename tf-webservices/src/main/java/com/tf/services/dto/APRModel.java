package com.tf.services.dto;

import java.io.Serializable;
import java.util.List;

public class APRModel implements Serializable {   
    
  
    private static final long serialVersionUID = 3028615564861791027L;
    
    
    private Long totalCreditLine;
    private Long creditAvailable;
    private List<CreditAvailable> creditAvailableBreakDown;
    
    
    public APRModel() {
	
    }


    public Long getTotalCreditLine() {
        return totalCreditLine;
    }


    public void setTotalCreditLine(Long totalCreditLine) {
        this.totalCreditLine = totalCreditLine;
    }


    public Long getCreditAvailable() {
        return creditAvailable;
    }


    public void setCreditAvailable(Long creditAvailable) {
        this.creditAvailable = creditAvailable;
    }


    public List<CreditAvailable> getCreditAvailableBreakDown() {
        return creditAvailableBreakDown;
    }


    public void setCreditAvailableBreakDown(
    	List<CreditAvailable> creditAvailableBreakDown) {
        this.creditAvailableBreakDown = creditAvailableBreakDown;
    }


    @Override
    public String toString() {
	return "APRModel [totalCreditLine=" + totalCreditLine
		+ ", creditAvailable=" + creditAvailable
		+ ", creditAvailableBreakDown=" + creditAvailableBreakDown
		+ "]";
    }     
    

}
