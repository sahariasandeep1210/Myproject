package com.tf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.WhiteHallTransaction;
import com.tf.util.ValidationUtil;

@Repository
@Transactional
public class WhiteHallTransactionDAOImpl extends BaseDAOImpl<WhiteHallTransaction, Serializable> implements WhiteHallTransactionDAO {

	public WhiteHallTransactionDAOImpl() {

		super(WhiteHallTransaction.class);
	}

	@Autowired
	protected ValidationUtil validationUtil;

	@SuppressWarnings("unchecked")
	public List<WhiteHallTransaction> getWhiteHallTransactions(int startIndex, int pageSize) {

		_log.debug("Inside WhiteHallTransactions  ");
		try {
			List<WhiteHallTransaction> results = new ArrayList<WhiteHallTransaction>();
			Collection<Long> ids = getIDListForPagination(startIndex, pageSize);
			if (!ids.isEmpty()) {
				System.out.println("with ids");
				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(WhiteHallTransaction.class).add(Restrictions.in("id", ids));
				results = (List<WhiteHallTransaction>) criteria.list();
			}else{
				System.out.println("with no ids");
				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(WhiteHallTransaction.class);
				results = (List<WhiteHallTransaction>) criteria.list();
			}
			System.out.println("results = "+results);
			System.out.println("results.size = "+results.size());
			_log.debug("WhiteHallTransactions successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("WhiteHallTransactions failed", re);
			throw re;
		}
	}
	
	public Collection<Long> getIDListForPagination(int startIndex, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(WhiteHallTransaction.class).setProjection(Projections.id());
		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		Collection<Long> ids = criteria.list();
		return ids;
	}

	public Long getWhiteHallTransactionsCount() {
		_log.debug("Inside WhiteHallTransactions ");
		try {
			Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createCriteria(WhiteHallTransaction.class);
			Long resultCount =
				(Long) criteria.setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("WhiteHallTransactions Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("WhiteHallTransactions Count failed", re);
			throw re;
		}
	}
}
