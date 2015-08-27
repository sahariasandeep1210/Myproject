package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Invoice;

@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDAOImpl  extends BaseDAO implements InvoiceDAO {

	public void addInvoice(Invoice invoice) {
		try {
			sessionFactory.getCurrentSession().save(invoice);
			_log.debug("persist successful"+invoice);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

}
