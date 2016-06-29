package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;

public class StackedChartDTO implements Serializable {
    

    private static final long serialVersionUID = -2704215594797343120L;
    
    private long id;
    private String companyName;
    private BigDecimal liveTradeAmount=BigDecimal.ZERO;
    private BigDecimal settledTradeAmount =BigDecimal.ZERO;
    private BigDecimal availTradeAmount=BigDecimal.ZERO;
    
    public StackedChartDTO (){
	
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public BigDecimal getLiveTradeAmount() {
        return liveTradeAmount;
    }

    public void setLiveTradeAmount(BigDecimal liveTradeAmount) {
        this.liveTradeAmount = liveTradeAmount;
    }

    public BigDecimal getSettledTradeAmount() {
        return settledTradeAmount;
    }

    public void setSettledTradeAmount(BigDecimal settledTradeAmount) {
        this.settledTradeAmount = settledTradeAmount;
    }

    public BigDecimal getAvailTradeAmount() {
        return availTradeAmount;
    }

    public void setAvailTradeAmount(BigDecimal availTradeAmount) {
        this.availTradeAmount = availTradeAmount;
    }

    @Override
    public String toString() {
	return "StackedChartDTO [id=" + id + ", companyName=" + companyName
		+ ", liveTradeAmount=" + liveTradeAmount
		+ ", settledTradeAmount=" + settledTradeAmount
		+ ", availTradeAmount=" + availTradeAmount + "]";
    }
    
    
    

}
