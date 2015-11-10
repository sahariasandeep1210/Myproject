package com.tf.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

@Repository
@Transactional
public class InvestorDAOImpl extends BaseDAOImpl<InvestorPortfolio, Long>   implements InvestorDAO {
	
	@Autowired
	private UserDAO userDAO;
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		InvestorPortfolio investor=null;
		try {
			if(id!=0){
				
				investor = (InvestorPortfolio) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio investorprot where investorprot.company.id = :id").setLong("id",id).uniqueResult();
				if (investor == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return investor;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id) {
		_log.debug("getting User instance with id: " + id);
		Map<Long,List<InvestorPortfolio>>  map=new HashMap<Long,List<InvestorPortfolio>>();
		long companyId= userDAO.getCompanyIDbyUserID(id);
		long investorID=getInvestorID(companyId);
		try {
			if(id!=0){
				
				List<InvestorPortfolio> list = (List<InvestorPortfolio>) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio investorprot where investorprot.investor.investorId = :id").setLong("id",investorID).list();
				map.put(investorID, list);
				
			}
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	private Long getInvestorID(long companyId) {
		Long investorID=null;
		try {
			if(companyId!=0){
				
				investorID = (Long) sessionFactory.getCurrentSession().createQuery("select investor.investorId from Investor investor where investor.company.id = :id").setLong("id",companyId).uniqueResult();
				if (investorID == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return investorID;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}


	public DashboardModel  getDashBoardInformation() {
		try {
			DashboardModel dasboardModel =new DashboardModel();
				
				Query query =sessionFactory.getCurrentSession().createQuery("SELECT SUM(currentCreditLine) AS totalcap,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio ");
				 List<Object[]> list = query.list();
			        for(Object[] arr : list){
			        	dasboardModel.setInvestmentCap(arr[0]!=null?Long.valueOf(arr[0].toString()):0);
			        	dasboardModel.setAvailToInvest(arr[1]!=null?Long.valueOf(arr[1].toString()):0);
			        	dasboardModel.setAmountInvested(arr[2]!=null?Long.valueOf(arr[2].toString()):0);
			        } 
			return dasboardModel;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}





	public void addInvestorPortfolios(List<InvestorPortfolio> investors,
			long investorId) {
		Investor investor=findByInvestorId(investorId);
		try {
			Session session=sessionFactory.getCurrentSession();
			for(InvestorPortfolio investorPortfolio: investors){
				investorPortfolio.setInvestor(investor);
				session.save(investorPortfolio);
			}
			_log.debug("Invoices persisted successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
	}
	
	private Investor findByInvestorId(long id) {
		_log.debug("getting Investor instance with id: " + id);
		try {
			Investor instance = (Investor) sessionFactory.getCurrentSession().get(
					"com.tf.model.Investor", id);
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

}
