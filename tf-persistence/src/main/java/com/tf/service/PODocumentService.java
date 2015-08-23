package com.tf.service;

import java.util.List;

import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;

public interface PODocumentService {
	
	public PODocument addPODocument(PODocument PODocument);
	
	public List<PODocument> getPODocuments(); 
  
	public PODocument findById(long id);

}
