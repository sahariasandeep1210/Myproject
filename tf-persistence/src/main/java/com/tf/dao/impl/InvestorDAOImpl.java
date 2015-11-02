package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorDAO;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

@Repository
@Transactional
public class InvestorDAOImpl extends BaseDAOImpl<InvestorPortfolio, Long>   implements InvestorDAO {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		InvestorPortfolio investor=null;
		try {
			if(id!=0){
				
				investor = (InvestorPortfolio) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio investor where investor.company.id = :id").setLong("id",id).uniqueResult();
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
	
	public DashboardModel  getDashBoardInformation() {
		try {
			DashboardModel dasboardModel =new DashboardModel();
				
				Query query =sessionFactory.getCurrentSession().createQuery("SELECT SUM(investmentCap) AS totalcap,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio ");
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

}
