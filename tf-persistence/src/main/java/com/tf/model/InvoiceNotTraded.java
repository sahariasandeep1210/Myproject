package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class InvoiceNotTraded implements Serializable {
	
	  private static final long serialVersionUID = -5443978907849652613L;
	  
	
	  private BigDecimal amount;
	  private int totalInvoiceCount;
	  private String status;
	  private String vat_amount;
	  private String finance_date;
	  private String  seller_company_vat_number;
	  private String  seller_company_name;
	  private String  invoice_date;
	  private String  invoice_number;
	  private String  seller_company_registration_number;
	  private String	  currency;
	  private String	  scf_company;
	  private String	  id;
	  private String  duration;
	  private String  create_date;
	  private String	  trade_id;
	  private String	  invoice_desc;
	  private String	  invoice_amout;
	  private String  update_date;
	  private String  scf_company_name;
	  
	  
	
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVat_amount() {
		return vat_amount;
	}
	public void setVat_amount(String vat_amount) {
		this.vat_amount = vat_amount;
	}
	public String getFinance_date() {
		return finance_date;
	}
	public void setFinance_date(String finance_date) {
		this.finance_date = finance_date;
	}
	public String getSeller_company_vat_number() {
		return seller_company_vat_number;
	}
	public void setSeller_company_vat_number(String seller_company_vat_number) {
		this.seller_company_vat_number = seller_company_vat_number;
	}
	public String getInvoice_date() {
		return invoice_date;
	}
	public void setInvoice_date(String invoice_date) {
		this.invoice_date = invoice_date;
	}
	public String getInvoice_number() {
		return invoice_number;
	}
	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}
	public String getSeller_company_registration_number() {
		return seller_company_registration_number;
	}
	public void setSeller_company_registration_number(
			String seller_company_registration_number) {
		this.seller_company_registration_number = seller_company_registration_number;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getScf_company() {
		return scf_company;
	}
	public void setScf_company(String scf_company) {
		this.scf_company = scf_company;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getTrade_id() {
		return trade_id;
	}
	public void setTrade_id(String trade_id) {
		this.trade_id = trade_id;
	}
	public String getInvoice_desc() {
		return invoice_desc;
	}
	public void setInvoice_desc(String invoice_desc) {
		this.invoice_desc = invoice_desc;
	}
	public String getInvoice_amout() {
		return invoice_amout;
	}
	public void setInvoice_amout(String invoice_amout) {
		this.invoice_amout = invoice_amout;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getScf_company_name() {
		return scf_company_name;
	}
	public void setScf_company_name(String scf_company_name) {
		this.scf_company_name = scf_company_name;
	}
	public String getSeller_company_name() {
		return seller_company_name;
	}
	public void setSeller_company_name(String seller_company_name) {
		this.seller_company_name = seller_company_name;
	}
	public int getTotalInvoiceCount() {
		return totalInvoiceCount;
	}
	public void setTotalInvoiceCount(int totalInvoiceCount) {
		this.totalInvoiceCount = totalInvoiceCount;
	}
	  
	
	  
	
	  

}
