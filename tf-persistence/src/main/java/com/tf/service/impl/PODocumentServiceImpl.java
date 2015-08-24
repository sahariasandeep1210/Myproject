package com.tf.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.PODocumentDAO;
import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;
import com.tf.service.PODocumentService;

@Service
public class PODocumentServiceImpl implements PODocumentService{

	@Autowired
	private PODocumentDAO poDocumentDAO;
	
	public PODocument addPODocument(PODocument PoModel) {
		return poDocumentDAO.addPODocument(PoModel);
	}

	public List<PODocument> getPODocuments() {
		return poDocumentDAO.getPODocuments();
	}

	public List<PODocument> findById(long id) {
		return poDocumentDAO.findById(id);
	}

}
