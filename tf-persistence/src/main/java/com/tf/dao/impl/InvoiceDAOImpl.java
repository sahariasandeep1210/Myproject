package com.tf.dao.impl;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Invoice;

@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDAOImpl  extends BaseDAOImpl<Invoice, Long> implements InvoiceDAO {

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
	
	public List<BigDecimal> getInvoicesAmount(List<Long> invoiceIds){
		_log.debug("Inside getInvoice ");
		try {
			
			Query query =  sessionFactory.getCurrentSession().createQuery("SELECT invoice.invoiceAmount FROM Invoice invoice WHERE invoice.id IN (:ids) ");
			query.setParameterList("ids", invoiceIds);
			List<BigDecimal> results = query.list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
}
