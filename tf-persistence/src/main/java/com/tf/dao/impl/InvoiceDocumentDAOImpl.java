package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDocumentDAO;
import com.tf.model.InvoiceDocument;


@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDocumentDAOImpl extends BaseDAOImpl<InvoiceDocument, Long> implements InvoiceDocumentDAO {
	
	public InvoiceDocumentDAOImpl() {
		super(InvoiceDocument.class);
	}
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument) {
		try {
			sessionFactory.getCurrentSession().save(invoiceDocument);
			_log.debug("persist successful"+invoiceDocument);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

	
	public List<InvoiceDocument> getInvoiceDocuments(){
		_log.debug("Inside getInvoice ");
		try {
			List<InvoiceDocument> results = (List<InvoiceDocument>) sessionFactory.getCurrentSession().createQuery("from InvoiceDocument").list();
			_log.debug("getInvoiceDocuments successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoiceDocuments failed", re);
			throw re;
		}
	}
	public List<InvoiceDocument> getInvoiceDocuments(long companyId){
		try {
			List<InvoiceDocument> results = (List<InvoiceDocument>) sessionFactory
					.getCurrentSession().createCriteria(InvoiceDocument.class)
					.add(Restrictions.eq("scfCompany.id", companyId)).list();
			_log.debug("getInvoiceDocuments successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoiceDocuments failed", re);
			throw re;
		}
		
	}
}
