package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.PurchaseOrderDAO;
import com.tf.model.PurchaseOrderModel;
import com.tf.service.PurchaseOrderService;

@Service
public class PurchaseOrderServiceImpl  implements PurchaseOrderService{

	@Autowired
	private PurchaseOrderDAO purchaseOrderDAO;
	
	public PurchaseOrderModel addPO(PurchaseOrderModel poModel) {
		return purchaseOrderDAO.addPO(poModel);		
	}
	
	public List<PurchaseOrderModel> getPurchaseOrderList(){
		return purchaseOrderDAO.getPurchaseOrderList();	
		
	}

	public PurchaseOrderModel findById(long id) {
		return purchaseOrderDAO.findById(id);
	}

}
