
package com.tf.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tf_seller_scfcompany_mapping")
public class SellerScfCompanyMapping implements Serializable {

	
	private static final long serialVersionUID = 7988327503450014261L;
	

	@Id
	@Column(name = "id")
	@GeneratedValue
	private Long id;

	@Column(name = "scf_company")
	private Long scfCompany;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "seller_company")
	private Company sellerCompany;

	@Column(name = "status")
	private String status;

	@Column(name = "update_date")
	private Date updateDate;

	@Column(name = "comment")
	private String comment;

	public SellerScfCompanyMapping() {

	}

	public Long getId() {

		return id;
	}

	public void setId(Long id) {

		this.id = id;
	}

	public Long getScfCompany() {

		return scfCompany;
	}

	public void setScfCompany(Long scfCompany) {

		this.scfCompany = scfCompany;
	}

	public Company getSellerCompany() {

		return sellerCompany;
	}

	public void setSellerCompany(Company sellerCompany) {

		this.sellerCompany = sellerCompany;
	}

	public String getStatus() {

		return status;
	}

	public void setStatus(String status) {

		this.status = status;
	}

	public Date getUpdateDate() {

		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {

		this.updateDate = updateDate;
	}

	public String getComment() {

		return comment;
	}

	public void setComment(String comment) {

		this.comment = comment;
	}

}
