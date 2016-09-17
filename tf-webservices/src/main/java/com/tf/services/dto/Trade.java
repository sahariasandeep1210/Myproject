package com.tf.services.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Trade  implements Serializable{

    private static final long serialVersionUID = 3246407086155941603L;
    
    
    private long id;
    private String scfTradeID;
    private BigDecimal tradeAmount;
    private String status;
    private Integer duration;
    private Date openingDate;
    private Date closingDate;
    private Date sellerPaymentDate;
    private BigDecimal 	fixedCharges;
    private BigDecimal 	whitehallVariableFee;
    private BigDecimal 	investorFee;
    private BigDecimal 	grossCharges;
    private BigDecimal 	financeAmount;
    
    public Trade() {
	
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getScfTradeID() {
        return scfTradeID;
    }

    public void setScfTradeID(String scfTradeID) {
        this.scfTradeID = scfTradeID;
    }

    public BigDecimal getTradeAmount() {
        return tradeAmount;
    }

    public void setTradeAmount(BigDecimal tradeAmount) {
        this.tradeAmount = tradeAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Date getOpeningDate() {
        return openingDate;
    }

    public void setOpeningDate(Date openingDate) {
        this.openingDate = openingDate;
    }

    public Date getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(Date closingDate) {
        this.closingDate = closingDate;
    }

    public Date getSellerPaymentDate() {
        return sellerPaymentDate;
    }

    public void setSellerPaymentDate(Date sellerPaymentDate) {
        this.sellerPaymentDate = sellerPaymentDate;
    }

    public BigDecimal getFixedCharges() {
        return fixedCharges;
    }

    public void setFixedCharges(BigDecimal fixedCharges) {
        this.fixedCharges = fixedCharges;
    }

    public BigDecimal getWhitehallVariableFee() {
        return whitehallVariableFee;
    }

    public void setWhitehallVariableFee(BigDecimal whitehallVariableFee) {
        this.whitehallVariableFee = whitehallVariableFee;
    }

    public BigDecimal getInvestorFee() {
        return investorFee;
    }

    public void setInvestorFee(BigDecimal investorFee) {
        this.investorFee = investorFee;
    }

    public BigDecimal getGrossCharges() {
        return grossCharges;
    }

    public void setGrossCharges(BigDecimal grossCharges) {
        this.grossCharges = grossCharges;
    }

    public BigDecimal getFinanceAmount() {
        return financeAmount;
    }

    public void setFinanceAmount(BigDecimal financeAmount) {
        this.financeAmount = financeAmount;
    }

    @Override
    public String toString() {
	return "Trade [id=" + id + ", scfTradeID=" + scfTradeID
		+ ", tradeAmount=" + tradeAmount + ", status=" + status
		+ ", duration=" + duration + ", openingDate=" + openingDate
		+ ", closingDate=" + closingDate + ", sellerPaymentDate="
		+ sellerPaymentDate + ", fixedCharges=" + fixedCharges
		+ ", whitehallVariableFee=" + whitehallVariableFee
		+ ", investorFee=" + investorFee + ", grossCharges="
		+ grossCharges + ", financeAmount=" + financeAmount + "]";
    }   
    


}
