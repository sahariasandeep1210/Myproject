package com.tf.dao;

import java.util.List;

import com.tf.model.PurchaseOrderModel;

public interface PurchaseOrderDAO {
	/**
	 * 
	 * @param PoModel
	 * @return
	 */
	public PurchaseOrderModel addPO(PurchaseOrderModel PoModel);
	/**
	 * 
	 * @return
	 */
	public List<PurchaseOrderModel> getPurchaseOrderList();
	/**
	 * 
	 * @param id
	 * @return
	 */
	public PurchaseOrderModel findById(long id);
	
	/**
	 * 
	 * @param poModel
	 */
	public void UpdatePurchaseOrder(PurchaseOrderModel poModel);

}
