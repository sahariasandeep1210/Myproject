package com.tf.dao.impl;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.SCFTrade;
import com.tf.util.PaginationUtil;
import com.tf.util.ValidationUtil;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.loader.custom.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tf.util.*;

@Repository
@Transactional
public class SCFTradeDAOImpl extends BaseDAOImpl<SCFTrade, Serializable> implements SCFTradeDAO {	
	
	public SCFTradeDAOImpl() {
		super(SCFTrade.class);
	}

	@Autowired
	protected ValidationUtil validationUtil;
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade>  getScfTrades(int startIndex,int pageSize){
		_log.debug("Inside getScfTrades  ");
		try {
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).setFirstResult(startIndex).setMaxResults(pageSize).setFetchMode("invoices",FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN)
					.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}
	
	public Long getScfTradesCount() {
		_log.debug("Inside getScfTradesCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCount Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradesCount Count failed", re);
			throw re;
		}
	}
	
	public SCFTrade save(SCFTrade scfTrade) {
		try {
			Long id=(Long)sessionFactory.getCurrentSession().save(scfTrade);
			scfTrade.setId(id);
			_log.debug("persist successful"+scfTrade);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
		return scfTrade;
	}
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).setFetchMode("invoices",FetchMode.JOIN).
					setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
		return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	public SCFTrade findById(long id) {
		_log.debug("getting Trade instance with id: " + id);
		try {
			SCFTrade instance = (SCFTrade) sessionFactory.getCurrentSession().get(
					"com.tf.model.SCFTrade", id);
			Hibernate.initialize(instance.getInvoices());
			
			if (instance == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeList(String RegNum,int startIndex,int pageSize){		
		_log.debug("Inside getScfTrades ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			ProjectionList prList = Projections.projectionList();
            prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
            criteria.setProjection(prList);
            
 			List<SCFTrade> scftrades=(List<SCFTrade>)criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", RegNum))
					.setFirstResult(startIndex)
					.setMaxResults(pageSize).list();
			_log.debug("getScfTrades successful, result size: "
					
					+ scftrades.size());
			return scftrades;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeListWithSearch(String searchtxt, String RegNum,int startIndex,int pageSize){		
		_log.debug("Inside getScfTradeListWithSearch ");
		List<SCFTrade> scftrades = new ArrayList<SCFTrade>();
		SCFTrade scfTrade = null;
		List<Object[]> resultscheck = new ArrayList<Object[]>();
		try {
			//String query = "select trd.id,trd.scf_id,trd.status,trd.duration,trd.opening_date,trd.closing_date,trd.Seller_Payment_date,trd.seller_transaction_fee,trd.seller_fees,trd.investor_total_gross_profit,trd.seller_net_allotment  as trades from scf_trade trd, tf_company cmp, scf_invoice inv  where inv.seller_company_registration_number = "+RegNum+" and trd.id like (:searchtxt) or trd.trade_amount like (:searchtxt) or trd.status like (:searchtxt) or cmp.NAME like (:searchtxt) group by trd.id LIMIT " + startIndex + "," + pageSize;
			String query = "select trd.id,trd.scf_id,trd.status,trd.duration,trd.opening_date,trd.closing_date,trd.Seller_Payment_date,trd.seller_transaction_fee,trd.seller_fees,trd.investor_total_gross_profit,trd.seller_net_allotment as trdid from scf_trade trd, tf_company cmp, scf_invoice inv  where inv.seller_company_registration_number = "+RegNum+" and trd.id like (:searchtxt) or trd.trade_amount like (:searchtxt) or trd.status like (:searchtxt) or cmp.NAME like (:searchtxt) group by trd.id LIMIT " + startIndex + "," + pageSize;
			Query qrys = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
			qrys.setParameter("searchtxt", "%"+searchtxt+"%");
			resultscheck = (List<Object[]>) qrys.list();
			System.out.println("resultscheck:"+resultscheck);
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				for(Object[] row:resultscheck){
					scfTrade = new SCFTrade();
					scfTrade.setId(Long.valueOf(row[0].toString()));
					scfTrade.setScfId(row[1].toString());
					scfTrade.setStatus(row[2].toString());
					scfTrade.setDuration(Integer.valueOf(row[3].toString()));
					scfTrade.setOpeningDate(formatter.parse(row[4].toString()));
					scfTrade.setClosingDate(formatter.parse(row[5].toString()));
					scfTrade.setSellerPaymentDate(formatter.parse(row[6].toString()));
					scfTrade.setSellerTransFee(new BigDecimal (row[7].toString()));
					scfTrade.setSellerFees(new BigDecimal (row[8].toString()));
					scfTrade.setInvestorTotalGross(new BigDecimal (row[9].toString()));
					scfTrade.setSellerNetAllotment(new BigDecimal (row[10].toString()));
					scftrades.add(scfTrade);
				}

			_log.debug("getScfTradeListWithSearch successful, result size: "					
					+ scftrades.size());
		} catch (RuntimeException re) {
			_log.error("getScfTradeListWithSearch failed", re);
			throw re;
		}
		catch (ParseException pe ) {
			_log.error("getScfTradeListWithSearch failed" +pe.getMessage());
			
		}
		return scftrades;


	}
	
	@SuppressWarnings("unchecked")
	public Long getScfTradeListWithSearchCount(String searchtxt, String RegNum) {
		_log.debug("Inside getScfTradeListWithSearch ");
		List<Object[]> resultscheck = new ArrayList<Object[]>();
		try {
			String query = "select trd.id,trd.scf_id,trd.status,trd.duration,trd.opening_date,trd.closing_date,trd.Seller_Payment_date,trd.seller_transaction_fee,trd.seller_fees,trd.investor_total_gross_profit,trd.seller_net_allotment  as trades from scf_trade trd, tf_company cmp, scf_invoice inv  where inv.seller_company_registration_number = "+RegNum+" and trd.id like (:searchtxt) or trd.trade_amount like (:searchtxt) or trd.status like (:searchtxt) or cmp.NAME like (:searchtxt) group by trd.id";
			Query qrys = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
			qrys.setParameter("searchtxt", "%"+searchtxt+"%");
			resultscheck = (List<Object[]>) qrys.list();
			Long count =Long.valueOf(qrys.list().size());
			return count;
		} catch (RuntimeException re) {
			_log.error("getScfTradesCountByCompanyId Count failed", re);
			throw re;
		}

	}

	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) {
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setFetchMode("invoices",FetchMode.JOIN).
					setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}
	public Long getScfTradesCountByCompanyId(Long companyID) {
		_log.debug("Inside getScfTradesCountByCompanyId ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCountByCompanyId Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradesCountByCompanyId Count failed", re);
			throw re;
		}
	}
	
	public Long getScfTradesCount(Long companyID) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	public Long getScfTradeCount(Long tradeId) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	
	
	public Long getScfTradeCounts(String regNum) {
		_log.debug("Inside getScfTradeCounts ");
		try {
			Criteria criteria  = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			Long resultCount = (Long) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", regNum))
					            .setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY)
					            .setProjection(Projections.rowCount()).uniqueResult();
				
			_log.debug("getScfTradeCounts Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradeCounts Count failed", re);
			throw re;
		}
	}
	
	public String findByQueryId(String tradeId) {
		_log.debug("Inside findByQueryId ");
        try{
        	String scfTrade=null;
          String sql="select scf_id from scf_trade where scf_id = (select max(scf_id) from scf_trade where scf_id like'%" + tradeId +"%\')";
		  Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		  scfTrade = (String) query.uniqueResult();
		  _log.debug("findByQueryId: " + scfTrade);

		  return scfTrade;
	} catch (RuntimeException re) {
		_log.error("findByQueryId  failed", re);
		throw re;
	}
		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId,int startIndex,int pageSize){
		_log.debug("Inside getTradeHistoryByComapnyId ");
		List<SCFTrade>  scfTrades=new ArrayList<SCFTrade>();
	    SCFTrade scfTrade;
		try {
			String query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+companyId+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number LIMIT " + startIndex + "," + pageSize; 
			List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(query).list();
			 for(Object[] row:resultscheck){
					scfTrade = new SCFTrade();
					scfTrade.setId(Long.valueOf((row[0].toString())));
					scfTrade.setInsuranceDocId(Long.valueOf(row[1].toString()));
					scfTrade.setTradeNotes(row[2].toString());
                    scfTrade.setStatus(row[3].toString());
					scfTrade.setTradeAmount(new BigDecimal (row[4].toString()));
					scfTrade.setDuration(Integer.valueOf(row[5].toString()));
					scfTrade.setInsuranceDocName(row[6].toString());
					scfTrades.add(scfTrade);
				}
			
			_log.debug("getTradeHistoryByComapnyId successful, result size: "
					+ scfTrades.size());
			return scfTrades;

		} catch (RuntimeException re) {
			_log.error("getTradeHistoryByComapnyId failed", re);
			throw re;
		}
		
		
	}
	 @SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryList(int startIndex,int pageSize){
		 _log.debug("Inside getTradeHistoryList ");

		    List<SCFTrade>  scfTrades=new ArrayList<SCFTrade>();
		    SCFTrade scfTrade;
		 try{
		 String qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id LIMIT " + startIndex + "," + pageSize;
/*		 Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createSQLQuery(qry);
*/		 
		 List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(qry).list();
			for(Object[] row:resultscheck){
				scfTrade = new SCFTrade();
				scfTrade.setTradeNotes(row[0].toString());
				scfTrade.setTradeAmount(new BigDecimal (row[1].toString()));
				scfTrade.setDuration(Integer.valueOf(row[2].toString()));
				scfTrade.setInsuranceDocId(Long.valueOf(row[3].toString()));
				scfTrades.add(scfTrade);
			}

	     _log.debug("getTradeHistoryList successful, result size: "
					+ scfTrades.size());
	     return scfTrades;
		 }catch(RuntimeException re){
			 _log.error("getTradeHistoryList failed", re);
				throw re;
		 }
	 }
	 public Long getScfTradesHistoryCount() {
			_log.debug("Inside getScfTradesHistoryCount ");
			try {
				
				String qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id;";
				Long resultscheck = Long.valueOf(( sessionFactory.getCurrentSession().createSQLQuery(qry)).list().size());
				_log.info("getScfTradesHistoryCount Count:: "	+ resultscheck);
				return resultscheck;
			} catch (RuntimeException re) {
				_log.error("getScfTradesHistoryCount Count failed", re);
				throw re;
			}
		}
	 public Long getHistoryCount(long companyId) {
			_log.debug("Inside getScfTradesHistoryCount ");
			try {
				
				String query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+companyId+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number "; 
				Long resultscheck = Long.valueOf((sessionFactory.getCurrentSession().createSQLQuery(query)).list().size());
				_log.info("getScfTradesHistoryCount Count:: "	+ resultscheck);
				return resultscheck;
			} catch (RuntimeException re) {
				_log.error("getScfTradesHistoryCount Count failed", re);
				throw re;
			}
		}
	 
	 
	 @SuppressWarnings("unchecked")
		public List<SCFTrade> getScfTradeByScfCompany(String scfCompany,Date frmDate,Date toDate,int startIndex,int pageSize){
			_log.debug("Inside getScfTradeByScfCompany  ");
			List<SCFTrade> scfTrades=new ArrayList<SCFTrade>();
			SCFTrade scfTrade = null;
			List<Object[]> resultscheck = new ArrayList<Object[]>();
  
			
			try {
				String qry = "";
				if(!StringUtils.isEmpty(scfCompany)  && frmDate != null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (:company_id)) as trades, "
					 		+"company_id from scf_trade where  opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id having company like (:company_id) LIMIT " + startIndex + "," + pageSize;
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate != null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id LIMIT " + startIndex + "," + pageSize;
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate != null && toDate == null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:fromDate)  group by company_id LIMIT " + startIndex + "," + pageSize;
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate == null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:toDate) group by company_id LIMIT " + startIndex + "," + pageSize;
				}
				else if(!StringUtils.isEmpty(scfCompany)&& (frmDate == null || toDate == null)){
					qry="select (select name from tf_company where idcompany = company_id) as company, "
                         +"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades," +"company_id from tradedb.scf_trade group by company_id having company like (:company_id) LIMIT " + startIndex + "," + pageSize;
				}else{
					qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id LIMIT " + startIndex + "," + pageSize;
				}
				System.out.println("query:::1"+qry);
				 
			    Query   resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(qry);
					if(!StringUtils.isEmpty(scfCompany))	{
						_log.info("Scf company" + scfCompany);
						resultscheck1.setParameter("company_id", "%"+scfCompany+"%");

					}
				if(frmDate !=null ){
					_log.info("From Date " + frmDate);
					resultscheck1 .setParameter("fromDate", frmDate);
		         }
				if(toDate != null){
					_log.info("To Date"+toDate);
					resultscheck1.setParameter("toDate",toDate);
				}
				resultscheck=resultscheck1.list();
				for(Object[] row:resultscheck){
					scfTrade = new SCFTrade();
					scfTrade.setTradeNotes(row[0].toString());
					scfTrade.setTradeAmount(new BigDecimal (row[1].toString()));
					scfTrade.setDuration(Integer.valueOf(row[2].toString()));
					scfTrade.setInsuranceDocId(Long.valueOf(row[3].toString()));
					scfTrades.add(scfTrade);
				}
		     _log.debug("getScfTradeByScfCompany, result size: "
						+ scfTrades);
		     
	       } catch (RuntimeException re) {
				_log.error("getScfTradeByScfCompany failed", re);
				throw re;
			}
			
			return scfTrades;
		
		}
	 
	 
	 @SuppressWarnings("unchecked")
		public List<SCFTrade> getScfTradeSellerCompany(String scfCompany,Date frmDate,Date toDate,long compID,int startIndex,int pageSize){
			_log.debug("Inside getScfTradeSellerCompany  ");
			List<SCFTrade> scfTrades=new ArrayList<SCFTrade>();
			SCFTrade scfTrade = null;
			List<Object[]> resultscheck = new ArrayList<Object[]>();
			System.out.println("DDDD"+scfCompany);
			System.out.println("YYY:"+frmDate);
			System.out.println("XXX:"+toDate);
			try {
              
				String query="";
				if(!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null){

				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and opening_date IN (:fromDate) and opening_date IN (:toDate) LIMIT " + startIndex + "," + pageSize;
					
				}else if(scfCompany.isEmpty() && frmDate != null && toDate != null){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate) and opening_date IN (:toDate) LIMIT " + startIndex + "," + pageSize;

					
				}else if(scfCompany.isEmpty()  && frmDate != null && toDate==null ){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate)  LIMIT " + startIndex + "," + pageSize;

					
				}else if(scfCompany.isEmpty()  && frmDate==null &&  toDate != null){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and  opening_date IN (:toDate) LIMIT " + startIndex + "," + pageSize;

					
				}else if(!StringUtils.isEmpty(scfCompany) && (frmDate == null || toDate == null)){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) LIMIT " + startIndex + "," + pageSize;

					
				}else{
					 query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number LIMIT " + startIndex + "," + pageSize;

				}
             System.out.println("query:::"+query);
			    Query   resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
					if(!StringUtils.isEmpty(scfCompany))	{
						_log.info("Scf company" + scfCompany);
						
						resultscheck1.setParameter("scfCompany", "%"+scfCompany+"%");
						resultscheck1.setParameter("status", "%"+scfCompany+"%");
					}
					
					if(frmDate != null ){
						_log.info("From Date " + frmDate);
						resultscheck1 .setParameter("fromDate", frmDate);
			         }
					if(toDate != null){
						_log.info("To Date"+toDate);
						resultscheck1.setParameter("toDate",toDate);
					}
					
					
				resultscheck=resultscheck1.list();
				for(Object[] row:resultscheck){
					scfTrade = new SCFTrade();
					scfTrade.setId(Long.valueOf((row[0].toString())));
					scfTrade.setInsuranceDocId(Long.valueOf(row[0].toString()));
					scfTrade.setTradeNotes(row[2].toString());
                    scfTrade.setStatus(row[3].toString());
					scfTrade.setTradeAmount(new BigDecimal (row[4].toString()));
					scfTrade.setDuration(Integer.valueOf(row[5].toString()));
					scfTrade.setInsuranceDocName(row[6].toString());
					scfTrades.add(scfTrade);
				}
		     _log.debug("getScfTradeSellerCompany, result size: "
						+ scfTrades.size());
		     
	       } catch (RuntimeException re) {
				_log.error("getScfTradeSellerCompany failed", re);
				throw re;
			}
			
			return scfTrades;
	 }

		public Long getScfTradeSellerCompanyCount(String scfCompany,Date frmDate,Date toDate,long compID){
			_log.debug("Inside getScfTradeSellerCompanyCount  ");
			
			try {
	              
				String query="";
				if(!StringUtils.isEmpty(scfCompany) && frmDate != null && toDate != null){

				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status) and opening_date IN (:fromDate) and opening_date IN (:toDate)";
					
				}else if(scfCompany.isEmpty() && frmDate != null && toDate != null){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate) and opening_date IN (:toDate)";

					
				}else if(scfCompany.isEmpty()  && frmDate != null && toDate==null ){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and opening_date IN (:fromDate)";

					
				}else if(scfCompany.isEmpty()  && frmDate==null &&  toDate != null){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and  opening_date IN (:toDate)";

					
				}else if(!StringUtils.isEmpty(scfCompany) && (frmDate == null || toDate == null)){
				    query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number and cmp.NAME like (:scfCompany) or trd.status like (:status)";

					
				}else{
					 query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+compID+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number";

				}
             System.out.println("query:::"+query);
			    Query   resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
					if(!StringUtils.isEmpty(scfCompany))	{
						_log.info("Scf company" + scfCompany);
						
						resultscheck1.setParameter("scfCompany", "%"+scfCompany+"%");
						resultscheck1.setParameter("status", "%"+scfCompany+"%");
					}
					
					if(frmDate != null ){
						_log.info("From Date " + frmDate);
						resultscheck1 .setParameter("fromDate", frmDate);
			         }
					if(toDate != null){
						_log.info("To Date"+toDate);
						resultscheck1.setParameter("toDate",toDate);
					}
					
					
					Long resultscheck =Long.valueOf(resultscheck1.list().size());
				
		     _log.debug("getScfTradeSellerCompanyCount, result size: "
						+ resultscheck);
				return resultscheck;

	       } catch (RuntimeException re) {
				_log.error("getScfTradeSellerCompanyCount failed", re);
				throw re;
			}
			
	 }
		
	
		public Long getScfTradeByScfCompanyCount(String scfCompany,Date frmDate,Date toDate){
			_log.debug("Inside getScfTradeByScfCompanyCount  ");
  
			try {
				String qry = "";
				if(!StringUtils.isEmpty(scfCompany)  && frmDate != null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (:company_id)) as trades, "
					 		+"company_id from scf_trade where  opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id having company like (:company_id)";
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate != null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:fromDate) and opening_date IN (:toDate) group by company_id";
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate != null && toDate == null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:fromDate)  group by company_id";
				}else if(StringUtils.isEmpty(scfCompany)&& frmDate == null && toDate != null){
					qry = "select (select name from tf_company where idcompany IN (company_id)) as company, "
					 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company IN (company_id)) as trades, "
					 		+"company_id from scf_trade where opening_date IN (:toDate) group by company_id";
				}
				else if(!StringUtils.isEmpty(scfCompany)&& (frmDate == null || toDate == null)){
					qry="select (select name from tf_company where idcompany = company_id) as company, "
                         +"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades," +"company_id from tradedb.scf_trade group by company_id having company like (:company_id)";
				}else{
					qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id";
				}
				System.out.println("query:::1"+qry);
				 
			    Query   resultscheck1 = (Query) sessionFactory.getCurrentSession().createSQLQuery(qry);
					if(!StringUtils.isEmpty(scfCompany))	{
						_log.info("Scf company" + scfCompany);
						resultscheck1.setParameter("company_id", "%"+scfCompany+"%");

					}
				if(frmDate !=null ){
					_log.info("From Date " + frmDate);
					resultscheck1 .setParameter("fromDate", frmDate);
		         }
				if(toDate != null){
					_log.info("To Date"+toDate);
					resultscheck1.setParameter("toDate",toDate);
				}
				Long resultscheck =Long.valueOf(resultscheck1.list().size());

		     _log.debug("getScfTradeByScfCompanyCount, result size: "
						+ resultscheck);
				return resultscheck;

	       } catch (RuntimeException re) {
				_log.error("getScfTradeByScfCompanyCount failed", re);
				throw re;
			}
			
		}
		
		@SuppressWarnings("unchecked")
		public List<SCFTrade> getAdminTradeListWithSearch(String searchtxt,Date fromDate, Date toDate, String value, int startIndex,int pageSize){
			_log.debug("Inside getAdminTradeListWithSearch ");
			List<SCFTrade> scftrades = new ArrayList<SCFTrade>();
			SCFTrade scfTrade = null;
			List<Object[]> resultscheck = new ArrayList<Object[]>();
			try {
				
				String query = "select trd.id from scf_trade trd, tf_company cmp, scf_invoice inv, tf_allotments almt, tf_investor_portfolio tfip where trd.id like (:searchtxt) or trd.trade_amount like (:searchtxt) or trd.status like (:searchtxt) or cmp.NAME like (:searchtxt) group by trd.id LIMIT " + startIndex + "," + pageSize;
				Query qrys = (Query) sessionFactory.getCurrentSession().createSQLQuery(query);
				qrys.setParameter("searchtxt", "%"+searchtxt+"%");
				resultscheck = (List<Object[]>) qrys.list();
				System.out.println("\n resultscheck - "+resultscheck);				
				
				Disjunction or = Restrictions.disjunction();
			
				if(validationUtil.isNumeric(searchtxt)){
					or.add(Restrictions.eq("tradeAmount", BigDecimal.valueOf(Long.valueOf(searchtxt))));
				}				
				or.add(Restrictions.like("status", searchtxt, MatchMode.ANYWHERE));
				or.add(Restrictions.like("scfId", searchtxt, MatchMode.ANYWHERE));
				or.add(Restrictions.like("company.name", searchtxt, MatchMode.ANYWHERE));
				
				Disjunction or2 = Restrictions.disjunction();
				if(fromDate != null && fromDate != toDate && value != null && value.equalsIgnoreCase("")){
					or2.add(Restrictions.ge(value, fromDate));
					or2.add(Restrictions.ge(value, toDate));
				}				
				
				List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession()
						.createCriteria(SCFTrade.class)	
						.createAlias("company", "company")
						.setFirstResult(startIndex).setMaxResults(pageSize)
						.setFetchMode("invoices",FetchMode.JOIN)
						.setFetchMode("allotments", FetchMode.JOIN)
						.setFetchMode("company", FetchMode.JOIN)
						.add(or)			
						.add(or2)						
						.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
				
				
				scftrades = results;
				System.out.println("\n results - "+results.size());
				_log.debug("getAdminTradeListWithSearch successful, result size: "					
						+ scftrades.size());
			} catch (RuntimeException re) {
				_log.error("getAdminTradeListWithSearch failed", re);
				throw re;
			}
			
			return scftrades;
		}
		 
}
