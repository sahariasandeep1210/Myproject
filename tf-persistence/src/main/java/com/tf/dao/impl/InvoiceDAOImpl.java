package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Invoice;

@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDAOImpl  extends BaseDAOImpl<Invoice, Long> implements InvoiceDAO {
	
	public InvoiceDAOImpl() {
		super(Invoice.class);
	}

	public void addInvoices(List<Invoice> invoices) {
		try {
			Session session=sessionFactory.getCurrentSession();
			for(Invoice invoice: invoices){
				session.save(invoice);
			}
			_log.debug("Invoices persisted successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

	
	public List<Invoice> getInvoices(){
		_log.debug("Inside getInvoice ");
		try {
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createQuery("from Invoice").list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds){
		_log.debug("Inside getInvoice ");
		try {
			
			Query query =  sessionFactory.getCurrentSession().createQuery("FROM Invoice invoice WHERE invoice.id IN (:ids) ");
			query.setParameterList("ids", invoiceIds);
			List<Invoice> results = (List<Invoice>)query.list();;
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	public List<Invoice> getInvoices(long companyID){
		
		_log.debug("Inside getInvoices ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfCompany.id", companyID)).list();
			_log.debug("getInvoices successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfgetInvoicesTrades failed", re);
			throw re;
		}
		
	}
	
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber){
		
		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber)).list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}
		
	}
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status){
		
		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class)
					.add(Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber))
					.add(Restrictions.eq("status", status))
					.list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}
		
	}
	
	public void updateInvoices(List<Invoice> invoices) {
		try {
			Session session=sessionFactory.getCurrentSession();
			for(Invoice invoice: invoices){
				session.saveOrUpdate(invoice);
			}
			_log.debug("Invoices updated successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
}
