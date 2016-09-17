package com.tf.services.helper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.tf.model.SCFTrade;
import com.tf.services.dto.Invoice;
import com.tf.services.dto.Trade;


@Component
public class TransformEntities {
    
    
    public List<Invoice> getInvoices(List<com.tf.model.Invoice> invoices){
	
	List<Invoice> invoicesList=new ArrayList<Invoice>();
	for(com.tf.model.Invoice inv : invoices){
	    Invoice invoice =new Invoice();
	    transformToInvoiceDTO(inv, invoice);
	    invoicesList.add(invoice);
	}
	return invoicesList;
	
    }

    public void transformToInvoiceDTO(com.tf.model.Invoice inv, Invoice invoice) {
	invoice.setId(inv.getId());
	invoice.setInvoiceNumber(inv.getInvoiceNumber());
	invoice.setInvoiceDate(inv.getInvoiceDate());
	invoice.setSellerCompanyRegistrationNumber(inv.getSellerCompanyRegistrationNumber());
	invoice.setSellerCompanyVatNumber(inv.getSellerCompanyVatNumber());
	invoice.setInvoiceAmount(inv.getInvoiceAmount());
	invoice.setVatAmount(inv.getVatAmount());
	invoice.setInvoiceDesc(inv.getInvoiceDesc());
	invoice.setDuration(inv.getDuration());
	invoice.setPayment_date(inv.getPayment_date());
	invoice.setCurrency(inv.getCurrency());
	invoice.setScfCompany(inv.getScfCompany().getId());
	invoice.setScfCompanyName(inv.getScfCompany().getName());
	invoice.setFinanceDate(inv.getFinanceDate());
	invoice.setStatus(inv.getStatus());
	invoice.setTradeID(inv.getScfTrade()!=null?inv.getScfTrade().getId():0l);
	invoice.setCreateDate(inv.getCreateDate());
	invoice.setUpdateDate(inv.getUpdateDate());
    }
    
    public List<Trade> getTrades(List<SCFTrade> trades){
	
   	List<Trade> tradeList=new ArrayList<Trade>();
   	for(SCFTrade scfTrade : trades){
   	    Trade trade=new Trade();
   	    trade.setId(scfTrade.getId());
   	    trade.setScfTradeID(scfTrade.getScfId());
   	    trade.setTradeAmount(scfTrade.getTradeAmount());
   	    trade.setStatus(scfTrade.getStatus());
   	    trade.setDuration(scfTrade.getDuration());
   	    trade.setOpeningDate(scfTrade.getOpeningDate());
   	    trade.setClosingDate(scfTrade.getClosingDate());
   	    trade.setSellerPaymentDate(scfTrade.getSellerPaymentDate());
   	    trade.setFixedCharges(scfTrade.getSellerTransFee());
   	    trade.setWhitehallVariableFee(scfTrade.getSellerFees());
   	    trade.setInvestorFee(scfTrade.getInvestorTotalGross());
   	    trade.setGrossCharges(getGrossCharges(scfTrade));
   	    trade.setFinanceAmount(scfTrade.getSellerNetAllotment());
   	    tradeList.add(trade);
   	}
   	return tradeList;
   	
       }

    private BigDecimal getGrossCharges(SCFTrade scfTrade) {
	BigDecimal totalGross = BigDecimal.ZERO;
	totalGross.add(scfTrade.getSellerTransFee()).add(scfTrade.getSellerFees()).add(scfTrade.getInvestorTotalGross());
	return totalGross;
    }

}
