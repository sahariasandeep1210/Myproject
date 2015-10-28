package com.tf.service;

public class Trade {

	int tradeId; 
	int supplierId;
	int amount; 
	
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	@Override
	public String toString() {
		return "Trade [amount=" + amount + ", tradeId=" + tradeId + ", supplierId=" + supplierId + "]";
	}
	public Trade(int tradeId, int supplierId, int amount) {
		super();
		this.tradeId = tradeId;
		this.supplierId = supplierId;
		this.amount = amount;
	} 
	
	
	
}
