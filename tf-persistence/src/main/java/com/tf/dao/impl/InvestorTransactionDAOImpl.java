package com.tf.dao.impl;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.impl.BaseDAOImpl;
import com.tf.model.Allotment;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.model.SellerSetting;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class InvestorTransactionDAOImpl extends BaseDAOImpl<InvestorTransaction, Long>   implements InvestorTransactionDAO {

	public InvestorTransactionDAOImpl(){
		super(InvestorTransaction.class);
	}
	public List<InvestorTransaction> getInvestorTransactions() {
		try{
			List<InvestorTransaction> list =(List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).list();
			_log.debug("getGeneralSettings successful, result size: "+ list);
			return list;
		}
		catch(RuntimeException re) {
			_log.error("getGeneralSettings failed", re);
			throw re;
		}
}
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel) {
		_log.debug("persisting InvestorBalance instance");
		try{
		Session session=sessionFactory.getCurrentSession();
		session.save(investorBalanceModel);
		_log.debug("persist successful"+investorBalanceModel);

		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}
	public List<InvestorTransaction> getInvestorTransaction(long investorId) {
		_log.debug("Inside getInvestorTransaction ");
		try {			
			List<InvestorTransaction>  investorTransaction = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId)).list();		
			return investorTransaction;
		} catch (RuntimeException re) {
			_log.error("getInvestorTransaction failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorTransaction> getInvestors(Long investorId,int startIndex,int pageSize) {
		_log.debug("Inside getInvestors ");
		try {
			
			List<InvestorTransaction> results = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.ne("investorID", investorId)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvestors successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvestors failed", re);
			throw re;
		}
	}
	public Long getInvestorsCount(Long investorId) {
		_log.debug("Inside getInvestorsCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.ne("investorID", investorId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvestorsCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvestorsCount failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorTransaction> getInvestorTransactionByTransactionType(long investorId,String transactionType,Date frmDate,Date toDate){
		_log.debug("Inside getInvestorTransactionByTransactionType  ");
		List<InvestorTransaction> investorTransactionList=new ArrayList<InvestorTransaction>();
		InvestorTransaction investorTransaction;
		List<Object[]> rows=new ArrayList<Object[]>();
		
		try {
		String sql="select inv.transcation_date,inv.transcation_type,inv.trade_id,inv.amount,inv.reference from tf_investor_transaction inv  where inv.transcation_type='deposit' and inv.transcation_date BETWEEN  '2016-02-12' AND '2016-02-14'";
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId));
		cr.add(Restrictions.eq("transcationType", transactionType));
		cr.add(Restrictions.ge("transcationDate", frmDate));
		cr.add(Restrictions.lt("transcationDate", toDate));
		cr.add(Restrictions.between("transcationDate", frmDate, toDate));
	    List<InvestorTransaction> dhanush= cr.list();
	    System.out.println("DDD00:"+dhanush);
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	     for(Object[]row:rows){
	    	 investorTransaction = new InvestorTransaction();
	    	 investorTransaction.setTranscationDate(formatter.parse(row[0].toString()));
             investorTransaction.setTranscationType(row[1].toString());
             investorTransaction.setTradeID(Long.valueOf(row[2].toString()));
             investorTransaction.setAmount(new BigDecimal(row[3].toString()));
             investorTransaction.setReference(row[4].toString());
             investorTransactionList.add(investorTransaction);
	     }
	     _log.debug("getInvestorTransactionByTransactionType, result size: "
					+ dhanush.size());
	     

		} catch (RuntimeException re) {
			_log.error("getInvestorTransactionByTransactionType failed", re);
			throw re;
		}
		catch (ParseException pe ) {
			_log.error("getInvestorTransactionByTransactionType failed" +pe.getMessage());
			
		}
		return investorTransactionList;
	
	}
	
}
