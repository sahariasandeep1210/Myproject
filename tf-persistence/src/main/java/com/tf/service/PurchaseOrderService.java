package com.tf.service;

import java.util.List;

import com.tf.model.PurchaseOrderModel;

public interface PurchaseOrderService {
	
	public PurchaseOrderModel addPO(PurchaseOrderModel PoModel);
	
	public List<PurchaseOrderModel> getPurchaseOrderList();
	
	public PurchaseOrderModel findById(long id);

	public void UpdatePurchaseOrder(PurchaseOrderModel poModel);
}
