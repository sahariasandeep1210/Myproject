package com.tf.persistance.util;

import java.io.Serializable;
import java.util.Date;

public class PaymentScheduleDTO  implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3416290638302892477L;

	/**
	 * 
	 */

	private Long id;	
	
	private String sellerName;
	
	private Date paymentDate;
	
	private String invoiceNumber;
	
	private Date dateestablished;
	
	private String invoiceAmount;	
	
	private int duration;
	
	private Date financeDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public Date getDateestablished() {
		return dateestablished;
	}

	public void setDateestablished(Date dateestablished) {
		this.dateestablished = dateestablished;
	}

	public String getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(String invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getFinanceDate() {
		return financeDate;
	}

	public void setFinanceDate(Date financeDate) {
		this.financeDate = financeDate;
	}

	
	
}
