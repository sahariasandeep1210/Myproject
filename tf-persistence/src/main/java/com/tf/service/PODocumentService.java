package com.tf.service;

import java.util.List;

import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;

public interface PODocumentService {
	
	public void addPODocument(PODocument PODocument);
	
	public List<PODocument> getPODocuments(); 
  
	public List<PODocument> findById(long id);
	
	public void deleteDocuments(PODocument poDocument);

}
