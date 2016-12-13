package com.tf.services.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class APRModel implements Serializable {   
    
  
    private static final long serialVersionUID = 3028615564861791027L;
    
    
    private BigDecimal totalCreditLine;
    private BigDecimal creditAvailable;
    private List<CreditAvailable> creditAvailableBreakDown;
    
    
    public APRModel() {
	
    }


    public BigDecimal getTotalCreditLine() {
        return totalCreditLine;
    }


    public void setTotalCreditLine(BigDecimal totalCreditLine) {
        this.totalCreditLine = totalCreditLine;
    }


    public BigDecimal getCreditAvailable() {
        return creditAvailable;
    }


    public void setCreditAvailable(BigDecimal creditAvailable) {
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
