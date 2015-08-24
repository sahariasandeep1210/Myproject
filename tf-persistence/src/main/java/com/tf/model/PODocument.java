package com.tf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tf_po_documents")
public class PODocument {
	
	@Id
	@Column(name = "document_id")
	private Long documentID;

	@Column(name = "purchase_order_id")
	private Long poID;
   
    
    @Column(name="document_type")
   	private String documentType;
    
    @Column(name="document_url")
   	private String documentUrl;
    
    @Column(name="create_date")
   	private Date create_date;
    
    @Column(name="document_name")
   	private String documentName;
    
    
    
    public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public PODocument() {
		// TODO Auto-generated constructor stub
	}

	public Long getPoID() {
		return poID;
	}

	public void setPoID(Long poID) {
		this.poID = poID;
	}

	public Long getDocumentID() {
		return documentID;
	}

	public void setDocumentID(Long documentID) {
		this.documentID = documentID;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getDocumentUrl() {
		return documentUrl;
	}

	public void setDocumentUrl(String documentUrl) {
		this.documentUrl = documentUrl;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "PODocument [documentID=" + documentID + ", poID=" + poID
				+ ", documentType=" + documentType + ", documentUrl="
				+ documentUrl + ", create_date=" + create_date
				+ ", documentName=" + documentName + "]";
	}
	

}
