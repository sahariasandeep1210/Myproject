package com.tf.util;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class CompanyDTO implements Serializable{
	private static final long serialVersionUID = -4213667135092864080L;
	private String fileType;
	private MultipartFile companyDoc;
	private Long companyId;
	private Long id;


	

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public MultipartFile getCompanyDoc() {
		return companyDoc;
	}

	public void setCompanyDoc(MultipartFile companyDoc) {
		this.companyDoc = companyDoc;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
