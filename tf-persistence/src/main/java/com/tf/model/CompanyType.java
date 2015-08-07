package com.tf.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tf_company_type")
public class CompanyType {
	
	
	@Id
    @Column(name="id")
	private Long id;	
	
	@Column(name="name")
	private String name;
	
	public CompanyType() {
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CompanyType [id=" + id + ", name=" + name + "]";
	}
	
	
	

}
