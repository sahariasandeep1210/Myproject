
package com.tf.dao.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.SCFTrade;
import com.tf.util.ValidationUtil;

@Repository
@Transactional
public class SCFTradeDAOImpl extends BaseDAOImpl<SCFTrade, Serializable> implements SCFTradeDAO {

	public SCFTradeDAOImpl() {

		super(SCFTrade.class);
	}

	@Autowired
	protected ValidationUtil validationUtil;

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(int startIndex, int pageSize) {

		_log.debug("Inside getScfTrades  ");
		try {
			List<SCFTrade> results = new ArrayList<SCFTrade>();
			Collection<Long> ids = getIDListForPagination(startIndex, pageSize);
			if (!ids.isEmpty()) {
				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(SCFTrade.class).add(Restrictions.in("id", ids)).setFetchMode("invoices", FetchMode.JOIN).setFetchMode(
						"allotments", FetchMode.JOIN).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				results = (List<SCFTrade>) criteria.list();
			}
			_log.debug("getScfTrades successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}

	public Long getScfTradesCount() {

		_log.debug("Inside getScfTradesCount ");
		try {
			Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			Long resultCount =
				(Long) criteria.setFetchMode("invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCount Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesCount Count failed", re);
			throw re;
		}
	}

	public SCFTrade save(SCFTrade scfTrade) {

		try {
			Long id = (Long) sessionFactory.getCurrentSession().save(scfTrade);
			scfTrade.setId(id);
			_log.debug("persist successful" + scfTrade);
		}
		catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}

		return scfTrade;
	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID) {

		_log.debug("Inside getScfTrades ");
		try {

			List<SCFTrade> results =
				(List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).setFetchMode(
					"invoices", FetchMode.JOIN)/*
												 * .setResultTransformer(
												 * CriteriaSpecification
												 * .DISTINCT_ROOT_ENTITY)
												 */.list();
			_log.debug("getScfTrades successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}

	}

	public SCFTrade findById(long id) {

		_log.debug("getting Trade instance with id: " + id);
		try {
			SCFTrade instance = (SCFTrade) sessionFactory.getCurrentSession().get("com.tf.model.SCFTrade", id);
			Hibernate.initialize(instance.getInvoices());

			if (instance == null) {
				_log.debug("get successful, no instance found");
			}
			else {
				_log.debug("get successful, instance found");
			}
			return instance;
		}
		catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId) {

		_log.debug("Inside getScfTrades ");
		try {

			List<SCFTrade> results =
				(List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).list();
			_log.debug("getScfTrades successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeList(String RegNum, int startIndex, int pageSize) {

		_log.debug("Inside getScfTrades ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			ProjectionList prList = Projections.projectionList();
			prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
			criteria.setProjection(prList);

			List<SCFTrade> scftrades =
				(List<SCFTrade>) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", RegNum)).setFirstResult(startIndex).setMaxResults(
					pageSize).list();
			_log.debug("getScfTrades successful, result size: "

			+ scftrades.size());
			return scftrades;
		}
		catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeListWithSearch(String searchtxt, String RegNum, int startIndex, int pageSize) {

		_log.debug("Inside getScfTradeListWithSearch ");
		List<SCFTrade> scftrades = new ArrayList<SCFTrade>();
		try {

			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			criteria.createAlias("company", "company");
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("company.name", searchtxt, MatchMode.ANYWHERE));
			ProjectionList prList = Projections.projectionList();
			prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
			criteria.setProjection(prList);
			criteria.add(or);
			scftrades =
				(List<SCFTrade>) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", RegNum)).setFirstResult(startIndex).setMaxResults(
					pageSize).list();

			_log.debug("getScfTradeListWithSearch successful, result size: " + scftrades.size());
		}
		catch (RuntimeException re) {
			_log.error("getScfTradeListWithSearch failed", re);
			throw re;
		}
		return scftrades;

	}

	public Long getScfTradeListWithSearchCount(String searchtxt, String RegNum) {

		_log.debug("Inside getScfTradeListWithSearch ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			criteria.createAlias("company", "company");
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("company.name", searchtxt, MatchMode.ANYWHERE));
			ProjectionList prList = Projections.projectionList();
			prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
			criteria.setProjection(prList);
			criteria.add(or);
			Long count =
				(Long) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", RegNum)).setProjection(Projections.rowCount()).uniqueResult();

			return count;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesCountByCompanyId Count failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID, int startIndex, int pageSize) {

		_log.debug("Inside getScfTrades ");
		try {

			List<SCFTrade> results = new ArrayList<SCFTrade>();
			Collection<Long> ids = getIDListForScfPagination(startIndex, pageSize,companyID);
			if (!ids.isEmpty()) {
				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(SCFTrade.class).add(Restrictions.in("id", ids)).setFetchMode(
						"invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
				results = (List<SCFTrade>) criteria.list();
			}
			_log.debug("getScfTrades successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}

	public Long getScfTradesCountByCompanyId(Long companyID) {

		_log.debug("Inside getScfTradesCountByCompanyId ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCountByCompanyId Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesCountByCompanyId Count failed", re);
			throw re;
		}
	}

	public Long getScfTradesCount(Long companyID) {
		_log.debug("Inside getScfTradesCount ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID));
			Long resultCount =
				(Long) criteria.setFetchMode("invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setResultTransformer(
					CriteriaSpecification.DISTINCT_ROOT_ENTITY).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getScfTradesCount Count " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesCount Count failed", re);
			throw re;
		}
	}

	public Long getScfTradeCount(Long tradeId) {

		_log.debug("Inside getCompanies ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}

	public Long getScfTradeCounts(String regNum) {

		_log.debug("Inside getScfTradeCounts ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			ProjectionList prList = Projections.projectionList();
			prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
			criteria.setProjection(prList);
			Long resultCount =
				(Long) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", regNum)).setProjection(
					Projections.countDistinct("inv.scfTrade")).uniqueResult();

			_log.debug("getScfTradeCounts Count " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradeCounts Count failed", re);
			throw re;
		}
	}

	public String findByQueryId(String tradeId) {

		_log.debug("Inside findByQueryId ");
		try {
			String scfTrade = null;
			String sql = "select scf_id from scf_trade where scf_id = (select max(scf_id) from scf_trade where scf_id like'%" + tradeId + "%\')";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			scfTrade = (String) query.uniqueResult();
			_log.debug("findByQueryId: " + scfTrade);

			return scfTrade;
		}
		catch (RuntimeException re) {
			_log.error("findByQueryId  failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId, int startIndex, int pageSize) {

		_log.debug("Inside getTradeHistoryByComapnyId ");
		List<SCFTrade> scfTrades = new ArrayList<SCFTrade>();
		SCFTrade scfTrade;
		try {
			String query =
				"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
					companyId +
					" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number LIMIT " +
					startIndex +
					"," +
					pageSize;
			List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(query).list();
			for (Object[] row : resultscheck) {
				scfTrade = new SCFTrade();
				scfTrade.setId(Long.valueOf((row[0].toString())));
				scfTrade.setInsuranceDocId(Long.valueOf(row[1].toString()));
				scfTrade.setTradeNotes(row[2].toString());
				scfTrade.setStatus(row[3].toString());
				scfTrade.setTradeAmount(new BigDecimal(row[4].toString()));
				scfTrade.setDuration(Integer.valueOf(row[5].toString()));
				scfTrade.setInsuranceDocName(row[6].toString());
				scfTrades.add(scfTrade);
			}

			_log.debug("getTradeHistoryByComapnyId successful, result size: " + scfTrades.size());
			return scfTrades;

		}
		catch (RuntimeException re) {
			_log.error("getTradeHistoryByComapnyId failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryList(int startIndex, int pageSize) {

		_log.debug("Inside getTradeHistoryList ");

		List<SCFTrade> scfTrades = new ArrayList<SCFTrade>();
		SCFTrade scfTrade;
		try {
			String qry =
				"select (select name from tf_company where idcompany = company_id) as company, " +
					"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, " +
					"company_id from scf_trade group by company_id LIMIT " + startIndex + "," + pageSize;

			List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(qry).list();
			for (Object[] row : resultscheck) {
				scfTrade = new SCFTrade();
				scfTrade.setTradeNotes(row[0].toString());
				scfTrade.setTradeAmount(new BigDecimal(row[1].toString()));
				scfTrade.setDuration(Integer.valueOf(row[2].toString()));
				scfTrade.setInsuranceDocId(Long.valueOf(row[3].toString()));
				scfTrades.add(scfTrade);
			}

			_log.debug("getTradeHistoryList successful, result size: " + scfTrades.size());
			return scfTrades;
		}
		catch (RuntimeException re) {
			_log.error("getTradeHistoryList failed", re);
			throw re;
		}
	}

	public Long getScfTradesHistoryCount() {

		_log.debug("Inside getScfTradesHistoryCount ");
		try {

			String qry =
				"select (select name from tf_company where idcompany = company_id) as company, "
					+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
					+ "company_id from scf_trade group by company_id;";
			Long resultscheck = Long.valueOf((sessionFactory.getCurrentSession().createSQLQuery(qry)).list().size());
			_log.info("getScfTradesHistoryCount Count:: " + resultscheck);
			return resultscheck;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesHistoryCount Count failed", re);
			throw re;
		}
	}

	public Long getHistoryCount(long companyId) {

		_log.debug("Inside getScfTradesHistoryCount ");
		try {

			String query =
				"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
					companyId + " and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number ";
			Long resultscheck = Long.valueOf((sessionFactory.getCurrentSession().createSQLQuery(query)).list().size());
			_log.info("getScfTradesHistoryCount Count:: " + resultscheck);
			return resultscheck;
		}
		catch (RuntimeException re) {
			_log.error("getScfTradesHistoryCount Count failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeByScfCompany(String scfCompany, Date frmDate, Date toDate, int startIndex, int pageSize) {

		_log.debug("Inside getScfTradeByScfCompany  ");
		List<SCFTrade> scfTrades = new ArrayList<SCFTrade>();
		SCFTrade scfTrade = null;
		List<Object[]> resultscheck = new ArrayList<Object[]>();

		try {
			String qry = "";
			if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (:company_id)) as trades, " +
						"company_id from scf_trade where  opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id having company like (:company_id) LIMIT " +
						startIndex + "," + pageSize;
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, " +
						"company_id from scf_trade where opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id LIMIT " +
						startIndex + "," + pageSize;
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, " +
						"company_id from scf_trade where opening_date IN (:fromDate)  group by company_id LIMIT " + startIndex + "," + pageSize;
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, " +
						"company_id from scf_trade where opening_date IN (:toDate) group by company_id LIMIT " + startIndex + "," + pageSize;
			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades," +
						"company_id from scf_trade group by company_id having company like (:company_id) LIMIT " + startIndex + "," + pageSize;

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades," +
						"company_id from scf_trade where opening_date IN (:fromDate) group by company_id having company like (:company_id) LIMIT " +
						startIndex + "," + pageSize;
			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades," +
						"company_id from scf_trade where opening_date IN (:toDate) group by company_id having company like (:company_id) LIMIT " +
						startIndex + "," + pageSize;
			}
			else {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, " +
						"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, " +
						"company_id from scf_trade  group by company_id LIMIT " + startIndex + "," + pageSize;
			}

			Query resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(qry);
			if (!StringUtils.isEmpty(scfCompany)) {
				_log.info("Scf company" + scfCompany);
				resultscheck1.setParameter("company_id", "%" + scfCompany + "%");

			}
			if (frmDate != null) {
				_log.info("From Date " + frmDate);
				resultscheck1.setParameter("fromDate", frmDate);
			}
			if (toDate != null) {
				_log.info("To Date" + toDate);
				resultscheck1.setParameter("toDate", toDate);
			}
			resultscheck = resultscheck1.list();
			for (Object[] row : resultscheck) {
				scfTrade = new SCFTrade();
				scfTrade.setTradeNotes(row[0].toString());
				scfTrade.setTradeAmount(new BigDecimal(row[1].toString()));
				scfTrade.setDuration(Integer.valueOf(row[2].toString()));
				scfTrade.setInsuranceDocId(Long.valueOf(row[3].toString()));
				scfTrades.add(scfTrade);
			}
			_log.debug("getScfTradeByScfCompany, result size: " + scfTrades);

		}
		catch (RuntimeException re) {
			_log.error("getScfTradeByScfCompany failed", re);
			throw re;
		}

		return scfTrades;

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeSellerCompany(String scfCompany, Date frmDate, Date toDate, long compID, int startIndex, int pageSize) {

		_log.debug("Inside getScfTradeSellerCompany  ");
		List<SCFTrade> scfTrades = new ArrayList<SCFTrade>();
		SCFTrade scfTrade = null;
		List<Object[]> resultscheck = new ArrayList<Object[]>();
		try {

			String query = "";
			if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {

				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and opening_date IN (:fromDate) and opening_date IN (:toDate) LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (scfCompany.isEmpty() && frmDate != null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate) and opening_date IN (:toDate) LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (scfCompany.isEmpty() && frmDate != null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate)  LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (scfCompany.isEmpty() && frmDate == null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and  opening_date IN (:toDate) LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and  opening_date IN (:fromDate) LIMIT " +
						startIndex + "," + pageSize;

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and  opening_date IN (:toDate) LIMIT " +
						startIndex + "," + pageSize;

			}
			else {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number LIMIT " +
						startIndex +
						"," +
						pageSize;

			}
			System.out.println("query:::" + query);
			Query resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
			if (!StringUtils.isEmpty(scfCompany)) {
				_log.info("Scf company" + scfCompany);

				resultscheck1.setParameter("scfCompany", "%" + scfCompany + "%");
				resultscheck1.setParameter("status", "%" + scfCompany + "%");
			}

			if (frmDate != null) {
				_log.info("From Date " + frmDate);
				resultscheck1.setParameter("fromDate", frmDate);
			}
			if (toDate != null) {
				_log.info("To Date" + toDate);
				resultscheck1.setParameter("toDate", toDate);
			}

			resultscheck = resultscheck1.list();
			for (Object[] row : resultscheck) {
				scfTrade = new SCFTrade();
				scfTrade.setId(Long.valueOf((row[0].toString())));
				scfTrade.setInsuranceDocId(Long.valueOf(row[0].toString()));
				scfTrade.setTradeNotes(row[2].toString());
				scfTrade.setStatus(row[3].toString());
				scfTrade.setTradeAmount(new BigDecimal(row[4].toString()));
				scfTrade.setDuration(Integer.valueOf(row[5].toString()));
				scfTrade.setInsuranceDocName(row[6].toString());
				scfTrades.add(scfTrade);
			}
			_log.debug("getScfTradeSellerCompany, result size: " + scfTrades.size());

		}
		catch (RuntimeException re) {
			_log.error("getScfTradeSellerCompany failed", re);
			throw re;
		}

		return scfTrades;
	}

	public Long getScfTradeSellerCompanyCount(String scfCompany, Date frmDate, Date toDate, long compID) {

		_log.debug("Inside getScfTradeSellerCompanyCount  ");

		try {

			String query = "";
			if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {

				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and opening_date IN (:fromDate) and opening_date IN (:toDate)";

			}
			else if (scfCompany.isEmpty() && frmDate != null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate) and opening_date IN (:toDate)";

			}
			else if (scfCompany.isEmpty() && frmDate != null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate)";

			}
			else if (scfCompany.isEmpty() && frmDate == null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and  opening_date IN (:toDate)";

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status)";

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and  opening_date IN (:fromDate)";

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID +
						" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and  opening_date IN (:toDate)";

			}
			else {
				query =
					"select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = " +
						compID + " and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number";

			}
			System.out.println("query:::" + query);
			Query resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
			if (!StringUtils.isEmpty(scfCompany)) {
				_log.info("Scf company" + scfCompany);

				resultscheck1.setParameter("scfCompany", "%" + scfCompany + "%");
				resultscheck1.setParameter("status", "%" + scfCompany + "%");
			}

			if (frmDate != null) {
				_log.info("From Date " + frmDate);
				resultscheck1.setParameter("fromDate", frmDate);
			}
			if (toDate != null) {
				_log.info("To Date" + toDate);
				resultscheck1.setParameter("toDate", toDate);
			}

			Long resultscheck = Long.valueOf(resultscheck1.list().size());

			_log.debug("getScfTradeSellerCompanyCount, result size: " + resultscheck);
			return resultscheck;

		}
		catch (RuntimeException re) {
			_log.error("getScfTradeSellerCompanyCount failed", re);
			throw re;
		}

	}

	public Long getScfTradeByScfCompanyCount(String scfCompany, Date frmDate, Date toDate) {

		_log.debug("Inside getScfTradeByScfCompanyCount  ");

		try {
			String qry = "";
			if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (:company_id)) as trades, "
						+ "company_id from scf_trade where  opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id having company like (:company_id)";
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
						+ "company_id from scf_trade where opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id";
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
						+ "company_id from scf_trade where opening_date IN (:fromDate)  group by company_id";
			}
			else if (StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany IN (company_id)) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
						+ "company_id from scf_trade where opening_date IN (:toDate) group by company_id";
			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades,"
						+ "company_id from scf_trade group by company_id having company like (:company_id)";
			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate == null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades,"
						+ "company_id from scf_trade where opening_date IN (:fromDate) group by company_id having company like (:company_id)";

			}
			else if (!StringUtils.isEmpty(scfCompany) && frmDate == null && toDate != null) {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades,"
						+ "company_id from scf_trade where opening_date IN (:toDate) group by company_id having company like (:company_id)";
			}
			else {
				qry =
					"select (select name from tf_company where idcompany = company_id) as company, "
						+ "sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
						+ "company_id from scf_trade group by company_id";
			}
			System.out.println("query:::1" + qry);

			Query resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(qry);
			if (!StringUtils.isEmpty(scfCompany)) {
				_log.info("Scf company" + scfCompany);
				resultscheck1.setParameter("company_id", "%" + scfCompany + "%");

			}
			if (frmDate != null) {
				_log.info("From Date " + frmDate);
				resultscheck1.setParameter("fromDate", frmDate);
			}
			if (toDate != null) {
				_log.info("To Date" + toDate);
				resultscheck1.setParameter("toDate", toDate);
			}
			Long resultscheck = Long.valueOf(resultscheck1.list().size());

			_log.debug("getScfTradeByScfCompanyCount, result size: " + resultscheck);
			return resultscheck;

		}
		catch (RuntimeException re) {
			_log.error("getScfTradeByScfCompanyCount failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getAdminTradeListWithSearch(String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize) {
		_log.debug("Inside getAdminTradeListWithSearch ");
		Criteria criteria =null;
		try {
			Collection<Long> ids = getIDListForPagination(startIndex, pageSize);
			if (!ids.isEmpty()) {
				Session session = sessionFactory.getCurrentSession();
				criteria =
					session.createCriteria(SCFTrade.class).add(Restrictions.in("id", ids)).createAlias("company", "company").setFetchMode(
						"invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setFetchMode("company", FetchMode.JOIN).setResultTransformer(
						Criteria.DISTINCT_ROOT_ENTITY);
			}
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("company.name", searchtxt, MatchMode.ANYWHERE));
			Disjunction or2 = Restrictions.disjunction();
			or2.add(Restrictions.between(value, fromDate, toDate));
			if (fromDate != null && toDate == null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
					 criteria .add(Restrictions.eq(value, fromDate));
			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2);

			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && !searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2).add(or).add(Restrictions.eq(value, fromDate));

			}else{
				 criteria.add(or);
			}
			
			List<SCFTrade>	results = (List<SCFTrade>) criteria.list();
			
			_log.debug("getAdminTradeListWithSearch successful, result size: " + results.size());
			return results;

		}
		catch (RuntimeException re) {
			_log.error("getAdminTradeListWithSearch failed", re);
			throw re;
		}

	}

	public Long getAdminTradeListWithSearchCount(String searchtxt, Date fromDate, Date toDate, String value) {
   
		_log.debug("Inside getAdminTradeListWithSearchCount ");
		try {
			
			Criteria criteria =  (Criteria) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).createAlias("company", "company").setFetchMode(
				"invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setFetchMode("company", FetchMode.JOIN).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));
			or.add(Restrictions.like("company.name", searchtxt, MatchMode.ANYWHERE));

			Disjunction or2 = Restrictions.disjunction();
			or2.add(Restrictions.between(value, fromDate, toDate));
			
			if (fromDate != null && toDate == null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
					 criteria .add(Restrictions.eq(value, fromDate));
			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2);

			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && !searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2).add(or).add(Restrictions.eq(value, fromDate));

			}else{
				 criteria.add(or);
			}
				Long resultCount = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getAdminTradeListWithSearchCount" + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getAdminTradeListWithSearchCount failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfAdminTradeListWithSearch(
		long companyId, String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize) {

		_log.debug("Inside getScfAdminTradeListWithSearch ");
		Criteria criteria =null;
		try {
			Collection<Long> ids = getIDListForScfPagination(startIndex, pageSize,companyId);
			if (!ids.isEmpty()) {
				Session session = sessionFactory.getCurrentSession();
				criteria =
					session.createCriteria(SCFTrade.class).add(Restrictions.in("id", ids)).setFetchMode(
						"invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			}
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));

			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			Disjunction or2 = Restrictions.disjunction();
			or2.add(Restrictions.between(value, fromDate, toDate));
			if (fromDate != null && toDate == null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
					 criteria .add(Restrictions.eq(value, fromDate));
			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2);

			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && !searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2).add(or).add(Restrictions.eq(value, fromDate));

			}else{
				 criteria.add(or);
			}
			List<SCFTrade>	results = (List<SCFTrade>) criteria.list();
			_log.debug("getAdminTradeListWithSearch successful, result size: " + results.size());
			return results;

		}
		catch (RuntimeException re) {
			_log.error("getAdminTradeListWithSearch failed", re);
			throw re;
		}

	}

	public Long getScfAdminTradeListWithSearchCount(long companyId, String searchtxt, Date fromDate, Date toDate, String value) {

		_log.debug("Inside getScfAdminTradeListWithSearchCount ");
		List<SCFTrade> scftrades = new ArrayList<SCFTrade>();
		try {

			Criteria criteria =  (Criteria) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyId)).setFetchMode(
				"invoices", FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(searchtxt)) {
				or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
			}
			or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));

			or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
			
			Disjunction or2 = Restrictions.disjunction();
			or2.add(Restrictions.between(value, fromDate, toDate));
			
			if (fromDate != null && toDate == null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
					 criteria .add(Restrictions.eq(value, fromDate));
			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2);

			}else if(fromDate != null && toDate != null && !value.equalsIgnoreCase("") && !searchtxt.equalsIgnoreCase("")) {
				 criteria.add(or2).add(or).add(Restrictions.eq(value, fromDate));

			}else{
				 criteria.add(or);
			}
				Long resultCount = (Long)criteria.setProjection(Projections.rowCount()).uniqueResult();

			_log.debug("getScfAdminTradeListWithSearchCount successful, result size: " + scftrades.size());

			return resultCount;

		}
		catch (RuntimeException re) {
			_log.error("getScfAdminTradeListWithSearchCount failed", re);
			throw re;
		}

	}

	public Collection<Long> getIDListForPagination(int startIndex, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(SCFTrade.class).setProjection(Projections.id());
		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		Collection<Long> ids = criteria.list();
		return ids;
	}
	public Collection<Long> getIDListForScfPagination(int startIndex, int pageSize,long companyId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyId)).setProjection(Projections.id());
		criteria.setFirstResult(startIndex);
		criteria.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		Collection<Long> ids = criteria.list();
		return ids;
	}
}
