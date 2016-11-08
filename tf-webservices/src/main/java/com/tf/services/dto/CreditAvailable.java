package com.tf.services.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class CreditAvailable implements Serializable{


    private static final long serialVersionUID = -1793511120812495555L;
    
    
    private BigDecimal available;
    private Integer discountRate;
    
    public CreditAvailable() {
	
    }

    public BigDecimal getAvailable() {
        return available;
    }

    public void setAvailable(BigDecimal available) {
        this.available = available;
    }

    public Integer getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(Integer discountRate) {
        this.discountRate = discountRate;
    }

    @Override
    public String toString() {
	return "CreditAvailable [available=" + available + ", discountRate="
		+ discountRate + "]";
    }    
    
    

}
