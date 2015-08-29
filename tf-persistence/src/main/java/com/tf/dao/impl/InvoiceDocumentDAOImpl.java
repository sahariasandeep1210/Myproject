package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDocumentDAO;
import com.tf.model.InvoiceDocument;


@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDocumentDAOImpl extends BaseDAO implements InvoiceDocumentDAO {
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument) {
		try {
			sessionFactory.getCurrentSession().save(invoiceDocument);
			_log.debug("persist successful"+invoiceDocument);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

}
