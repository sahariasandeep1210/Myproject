package com.tf.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "scf_company_document")
public class CompanyDocument  implements Serializable{
	
	

    	private static final long serialVersionUID = 2221142131625726861L;

	@Id
	@Column(name = "id")
	@GeneratedValue
	private Long id;
	
	@Column(name = "document_id")
	private Long documentId;
	
	@Column(name = "document_name")
	private String documentName;
	
	@Column(name = "document_type")
	private String documentType;
	
	@Column(name = "document_url")
	private String documentUrl;
	
	@Column(name = "uploadedby")
	private String uploadedby;
	
	@Column(name = "upload_date")
	private Date uploadDate;
	
	/*@ManyToOne  
    @JoinColumn(name = "scf_company")  
	private Company scfCompany;*/
	
	
	
	public CompanyDocument() {
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDocumentId() {
		return documentId;
	}

	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
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

	public String getUploadedby() {
		return uploadedby;
	}

	public void setUploadedby(String uploadedby) {
		this.uploadedby = uploadedby;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	/*public Company getScfCompany() {
		return scfCompany;
	}

	public void setScfCompany(Company scfCompany) {
		this.scfCompany = scfCompany;
	}*/

	@Override
	public String toString() {
		return "InvoiceDocument [id=" + id + ", documentId=" + documentId
				+ ", documentName=" + documentName + ", documentType="
				+ documentType + ", documentUrl=" + documentUrl
				+ ", uploadedby=" + uploadedby + ", uploadDate=" + uploadDate
				+ "]";
	}
	
	

}
