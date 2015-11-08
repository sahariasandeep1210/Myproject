package com.tf.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="tf_investor")
public class Investor  implements Serializable{
	

	private static final long serialVersionUID = 1L;


	@Id
    @Column(name="investor_id")
    @GeneratedValue
	private Long investorId;	
	
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
    @JoinColumn(name="company_id",insertable=true,updatable=true,nullable=true,unique=true)
	private Company company;
	
	@Column(name="create_date")
	private Date createDate;
	
	@OneToMany(mappedBy = "investor",cascade=CascadeType.ALL)      
	private Set<InvestorPortfolio> investorPortfolios;
	
	public Investor() {
		// TODO Auto-generated constructor stub
	}

	public Long getInvestorId() {
		return investorId;
	}

	public void setInvestorId(Long investorId) {
		this.investorId = investorId;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Set<InvestorPortfolio> getInvestorPortfolios() {
		return investorPortfolios;
	}

	public void setInvestorPortfolios(Set<InvestorPortfolio> investorPortfolios) {
		this.investorPortfolios = investorPortfolios;
	}

	@Override
	public String toString() {
		return "Investor [investorId=" + investorId + ", company=" + company
				+ ", createDate=" + createDate + "]";
	}
	
	
	
	

}
