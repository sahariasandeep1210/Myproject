package com.tf.dao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import com.tf.persistance.util.InvestorProtfolioDTO;

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
	
	public void updateInvestorPortfolios(List<InvestorPortfolio> investors,
			long investorId) {
		Investor investor=findByInvestorId(investorId);
		try {
			Session session=sessionFactory.getCurrentSession();
			for(InvestorPortfolio investorPortfolio: investors){
				investorPortfolio.setInvestor(investor);
				session.update(investorPortfolio);
			}
			_log.debug("Invoices updated successful");
		} catch (RuntimeException re) {
			_log.error("update failed", re);
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
	
	public Map<String,BigDecimal>  getProtfolioTotals(long id) {
		try {
			Map<String,BigDecimal> map =new HashMap<String,BigDecimal>();
				
				Query query =sessionFactory.getCurrentSession().createQuery("SELECT SUM(currentCreditLine) AS totalCreditLine,SUM(myCreditLine) AS totalMyCreditLine,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio "
						+ " where investor.investorId = :id").setLong("id",id);
				 List<Object[]> list = query.list();
			        for(Object[] arr : list){
			        	map.put("creditLine",arr[0]!=null?new BigDecimal(arr[0].toString()):BigDecimal.ZERO);
			        	map.put("myCreditLine",arr[1]!=null?new BigDecimal(arr[1].toString()):BigDecimal.ZERO);
			        	map.put("availToInvest",arr[2]!=null?new BigDecimal(arr[2].toString()):BigDecimal.ZERO);
			        	map.put("amountInvested",arr[3]!=null?new BigDecimal(arr[3].toString()):BigDecimal.ZERO);
			        } 
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public List<Long> getInvestorsScfCompanies(long investorID) {
		List<Long> list = new ArrayList<Long>();
		try {
			if (investorID != 0) {

				list = (List<Long>) sessionFactory
						.getCurrentSession()
						.createQuery(" select investorprot.company.id	from InvestorPortfolio investorprot where investorprot.investor.investorId = :id")
						.setLong("id", investorID).list();

			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public InvestorPortfolio getInvestorProtfolio(long investorID,long scfCompany) {
		try {				
			InvestorPortfolio investorPortfolio = (InvestorPortfolio) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio protfolio where protfolio.company.id = :companyid and protfolio.investor.investorId = :id").setLong("companyid",scfCompany).setLong("id", investorID).uniqueResult();
				
			return investorPortfolio;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public Map<Long,BigDecimal>  findTotalCreditLine(long investorID) {		
		try {		
			Map<Long,BigDecimal> map=new HashMap<Long, BigDecimal>();
			List<Object[]> protfolioObjArray= sessionFactory.getCurrentSession().createSQLQuery("SELECT company_id,SUM(my_credit_line) FROM tf_investor_portfolio GROUP BY  company_id").list();				
			for(Object[] row : protfolioObjArray){
				map.put(Long.valueOf(row[0].toString()), new BigDecimal(row[1].toString()));
	            
	        }
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public 	List<InvestorPortfolio>  findTotalCreditLineBreakDown(long scfCompany) {
		try {		
			List<InvestorPortfolio> list= (List<InvestorPortfolio>)sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio where company.id = :companyid").setLong("companyid",scfCompany).list();				
			
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public List<InvestorProtfolioDTO> findInvestorByRate(long comapanyId) {
		try {
			List<InvestorProtfolioDTO>  list = new ArrayList<InvestorProtfolioDTO>();
			InvestorProtfolioDTO investorProtfolioDTO ;
			List<Object[]> protfolioObjArray = sessionFactory
					.getCurrentSession()
					.createSQLQuery(
							"SELECT  investor_id,my_credit_line,amount_invested,available_to_invest,investment_discount_rate,company_id FROM tf_investor_portfolio WHERE company_id=:companyID ORDER BY investment_discount_rate,my_credit_line")
					.setLong("companyID", comapanyId).list();
			for (Object[] row : protfolioObjArray) {
				investorProtfolioDTO=new InvestorProtfolioDTO();
				investorProtfolioDTO.setInvestorId(Long.valueOf(row[0].toString()));
				investorProtfolioDTO.setMycreditLine(new BigDecimal(row[1].toString()));
				investorProtfolioDTO.setAmountInvested(row[2]!=null?new BigDecimal(row[2].toString()):null);
				investorProtfolioDTO.setAvailToInvest(row[3]!=null?new BigDecimal(row[3].toString()):null);
				investorProtfolioDTO.setDiscountRate(Integer.valueOf(row[4].toString()));
				list.add(investorProtfolioDTO);

			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}

	}


}
