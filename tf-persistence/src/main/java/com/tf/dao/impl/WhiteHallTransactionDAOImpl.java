package com.tf.dao.impl;

import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.WhiteHallTransaction;
import com.tf.util.ValidationUtil;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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

				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(WhiteHallTransaction.class);
					results = (List<WhiteHallTransaction>) criteria.setFirstResult(startIndex).setMaxResults(pageSize).list();
			
			_log.debug("WhiteHallTransactions successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("WhiteHallTransactions failed", re);
			throw re;
		}
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
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<WhiteHallTransaction> getReportListWithSearch(String searchtxt, Date fromDate, Date toDate,int startIndex, int pageSize) {
		_log.debug("Inside getReportListWithSearch ");
		try {
			List<WhiteHallTransaction> results=new ArrayList<WhiteHallTransaction>();

			Session session = sessionFactory.getCurrentSession();
			Criteria criteria =
							session.createCriteria(WhiteHallTransaction.class);
			Disjunction or = Restrictions.disjunction();
			or.add(Restrictions.like("reference", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("companyType", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("transcationType", searchtxt, MatchMode.ANYWHERE));
			if(!StringUtils.isEmpty(fromDate)){
				_log.info("From Date " + fromDate);
				criteria.add(Restrictions.ge("transcationDate", fromDate));
	         }
			if(!StringUtils.isEmpty(toDate)){
				_log.info("To Date"+toDate);
				criteria.add(Restrictions.le("transcationDate",toDate));
			}
			results = (List<WhiteHallTransaction>) criteria.add(or).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getReportListWithSearch successful, result size: " + results.size());
			return results;

		}
		catch (RuntimeException re) {
			_log.error("getReportListWithSearch failed", re);
			throw re;
		}

	}
	public Long getReportListWithSearchCount(String searchtxt, Date fromDate, Date toDate) {
		_log.debug("Inside getReportListWithSearch ");
		try {

			Session session = sessionFactory.getCurrentSession();
			Criteria criteria =
							session.createCriteria(WhiteHallTransaction.class);
			Disjunction or = Restrictions.disjunction();
			or.add(Restrictions.like("reference", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("companyType", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("transcationType", searchtxt, MatchMode.ANYWHERE));
			if(!StringUtils.isEmpty(fromDate)){
				_log.info("From Date " + fromDate);
				criteria.add(Restrictions.ge("transcationDate", fromDate));
	         }
			if(!StringUtils.isEmpty(toDate)){
				_log.info("To Date"+toDate);
				criteria.add(Restrictions.le("transcationDate",toDate));
			}
			Long resultCount = (Long) criteria.add(or).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getReportListWithSearch successful, result size: " + resultCount);
			return resultCount;

		}
		catch (RuntimeException re) {
			_log.error("getReportListWithSearch failed", re);
			throw re;
		}

	}

}
