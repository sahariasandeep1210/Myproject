package com.tf.services.helper;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.tf.model.Company;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.DashboardModel;
import com.tf.services.dto.APRModel;
import com.tf.services.dto.Address;
import com.tf.services.dto.CreditAvailable;
import com.tf.services.dto.Invoice;
import com.tf.services.dto.SellerDetails;
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
   	    transformTrade(scfTrade, trade);
   	    tradeList.add(trade);
   	}
   	return tradeList;
   	
       }

    public void transformTrade(SCFTrade scfTrade, Trade trade) {
	trade.setId(scfTrade.getId());
	trade.setScfCompanyName(scfTrade.getCompany().getName());
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
    }

    private BigDecimal getGrossCharges(SCFTrade scfTrade) {
	BigDecimal totalGross = BigDecimal.ZERO;
	totalGross.add(scfTrade.getSellerTransFee()).add(scfTrade.getSellerFees()).add(scfTrade.getInvestorTotalGross());
	return totalGross;
    }
    
    
    public APRModel getAPRModel(APRModel aprModel,DashboardModel dashboardModel) {	
	aprModel.setTotalCreditLine(dashboardModel.getInvestmentCap());
	aprModel.setCreditAvailable(dashboardModel.getAvailToInvest());
	List<CreditAvailable> creditAvailList=new ArrayList<CreditAvailable>();
	for(Object[] protfolios : dashboardModel.getInvestorPortfolios()){
	    CreditAvailable creditAvailable =new CreditAvailable();
	    creditAvailable.setAvailable(new BigDecimal(protfolios[0].toString()));
	    creditAvailable.setDiscountRate(Integer.parseInt(protfolios[1].toString()));
	    creditAvailList.add(creditAvailable);	    
	}
	aprModel.setCreditAvailableBreakDown(creditAvailList);
   	
   	return aprModel;
       }

    public void getSellerDetails(SellerDetails sellerDetails, Company sellerCmp) {
	sellerDetails.setSupplierCompanyID(sellerCmp.getId());
	sellerDetails.setSupplierCompanyName(sellerCmp.getName());	
	sellerDetails.setPhoneNo(sellerCmp.getTelnumber());
	
	Address address =new Address();
	com.tf.model.Address add=sellerCmp.getAddress();
	address.setId(add.getId());
	address.setAddressLine1(add.getAddressLine1());
	address.setAddressLine2(add.getAddressLine2());
	address.setLocality(add.getLocality());
	address.setRegion(add.getRegion());
	address.setCountry(add.getCountry());
	address.setPostalCode(add.getPostalCode());
	
	sellerDetails.setAddress(address);
	
    }
    
    public void updateCompanyAddress(SellerDetails sellerDetails, Company company) {
  	Address address =sellerDetails.getAddress();
  	com.tf.model.Address add=company.getAddress();
  	add.setAddressLine1(address.getAddressLine1());
  	add.setAddressLine2(address.getAddressLine2());
  	add.setLocality(address.getLocality());
  	add.setRegion(address.getRegion());
  	add.setPostalCode(address.getPostalCode());
  	add.setCountry(address.getCountry());  	
      }

}
