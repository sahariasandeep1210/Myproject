package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;

public class FinanceConfirmationDTO  implements Serializable{
    

    private static final long serialVersionUID = -7661197671010248917L;
    
    private int noOfInvoices;
    private BigDecimal totalAmount;
    private BigDecimal allotmentAmount;
    private int duration;
    
    public FinanceConfirmationDTO() {
	
    }

    public int getNoOfInvoices() {
        return noOfInvoices;
    }

    public void setNoOfInvoices(int noOfInvoices) {
        this.noOfInvoices = noOfInvoices;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getAllotmentAmount() {
        return allotmentAmount;
    }

    public void setAllotmentAmount(BigDecimal allotmentAmount) {
        this.allotmentAmount = allotmentAmount;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
	return "FinanceConfirmationDTO [noOfInvoices=" + noOfInvoices
		+ ", totalAmount=" + totalAmount + ", allotmentAmount="
		+ allotmentAmount + ", duration=" + duration + "]";
    }

   
       
    

}
