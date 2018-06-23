package com.tf.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDocumentDAO;
import com.tf.model.Company;
import com.tf.model.CompanyDocument;
import com.tf.model.InvoiceDocument;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.persistance.util.Constants;


@Repository
@Transactional(rollbackFor = Exception.class)
public class CompanyDocumentDAOImpl extends BaseDAOImpl<InvoiceDocument, Long> implements CompanyDocumentDAO {
	
	public CompanyDocumentDAOImpl() {
		super(InvoiceDocument.class);
	}
	
	public void addCompanyDocument(CompanyDocument companyDocuments) {
		try {
			sessionFactory.getCurrentSession().save(companyDocuments);
			_log.debug("persist successful"+companyDocuments);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

	
	@SuppressWarnings("unchecked")
	public List<CompanyDocument> getCompanyDocuments(){
		_log.debug("Inside getInvoice ");
		try {
			List<CompanyDocument> results = (List<CompanyDocument>) sessionFactory.getCurrentSession().createCriteria(CompanyDocument.class).list();
			_log.debug("getCompanyDocuments successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getCompanyDocuments failed", re);
			throw re;
		}
	}
	@SuppressWarnings("unchecked")
	public List<CompanyDocument> getCompanyDocumentsWithId(long companyId){
		try {
			List<CompanyDocument> results = (List<CompanyDocument>) sessionFactory
					.getCurrentSession().createCriteria(CompanyDocument.class)
					.add(Restrictions.eq("scfCompany.id", companyId)).list();
			_log.debug("getCompanyDocumentsWithId successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getCompanyDocumentsWithId failed", re);
			throw re;
		}
		
	}

	@SuppressWarnings("unchecked")
	public Company getCompanyDetail(String regNumber, String name) {
		List<Company> results = null;
		try {
			results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("regNumber", regNumber)).list();
			if (null != results && results.size() > 0) {

				return results.get(0);

			}
			//Company results =  (Company) sessionFactory.getCurrentSession().get(Company.class, new Long(regNumber));
			return null;
		} catch (RuntimeException re) {
			_log.error("getCompanyDetail failed", re);
			throw re;
		}
	}

	public void addCompanyDetailList(List<Company> companyList) {
		_log.debug("persisting Company instance");
		try {
			Session session = sessionFactory.getCurrentSession();
			for(Company companyObj : companyList){
				companyObj.getAddress().setCompany(companyObj);
				companyObj.getCompanyAccountDetail().setCompany(companyObj);
				try{
					session.saveOrUpdate(companyObj);
					_log.debug("persist successful"+companyObj);
				}catch(Exception e){
					_log.debug("persist fail"+companyObj);
				}
			}
			
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<CompanyDocument> getCompanyDocumentsBasedOnUploadedBy(String uploadedBy) {
		try {
		
			List<CompanyDocument> results = (List<CompanyDocument>) sessionFactory
					.getCurrentSession().createCriteria(CompanyDocument.class)
					.add(Restrictions.eq("uploadedby", uploadedBy)).list();
			_log.debug("getCompanyDocumentsWithUserId successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getCompanyDocumentsWithUserId failed", re);
			throw re;
		}
	}

	public void saveSellerScfCompanyMapping(List<Company> companyList,
			long scfCompanyId) {
		_log.debug("inside saveSellerScfCompanyMapping()");
		try {
			Session session = sessionFactory.getCurrentSession();
			for(Company companyObj : companyList){
				try{
					
					SellerScfCompanyMapping scfSellerComapnyMappingObj=new SellerScfCompanyMapping();
					scfSellerComapnyMappingObj.setScfCompany(scfCompanyId);
					scfSellerComapnyMappingObj.setSellerCompany(companyObj);
					scfSellerComapnyMappingObj.setUpdateDate(Calendar.getInstance().getTime());
					scfSellerComapnyMappingObj.setStatus(Constants.STATUS.PENDING.getValue());
					companyObj.getAddress().setCompany(companyObj);
					companyObj.getCompanyAccountDetail().setCompany(companyObj);
					
					session.saveOrUpdate(scfSellerComapnyMappingObj);
					_log.debug("persist successful"+companyObj);
				}catch(Exception e){
					_log.debug("persist fail"+companyObj);
				}
			}
			
		} catch (RuntimeException re) {
			_log.error("saveSellerScfCompanyMapping() persist failed", re);
			throw re;
		}
		
		
	}
}
