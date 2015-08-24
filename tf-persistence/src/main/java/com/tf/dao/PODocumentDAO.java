package com.tf.dao;

import java.util.List;

import com.tf.model.PODocument;

public interface PODocumentDAO {
	
	public PODocument addPODocument(PODocument PoModel);
	public List<PODocument> getPODocuments(); 
	public List<PODocument>  findById(long id);
}
