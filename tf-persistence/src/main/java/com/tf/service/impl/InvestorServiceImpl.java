package com.tf.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorHistoryDAO;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorPortfolioHistory;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.InvestorService;

@Service
@Transactional
public class InvestorServiceImpl implements InvestorService {
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private InvestorHistoryDAO investorHistoryDAO;
	
	public void save(InvestorPortfolio investor){
		investorDAO.saveEntity(investor);
	}
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) {
		return investorDAO.getInvestorByCompanyId(id);
	}
	
	public InvestorPortfolio findById(long id){
		return investorDAO.findById(id);
	}

	public void updatePortfiloDetails(InvestorPortfolio investor,InvestorPortfolio investorModel,String userName) {
		
		Date currentDate =new Date();
		System.out.println("Current Date"+currentDate);
		//adding history
		InvestorPortfolioHistory investorHistory =new InvestorPortfolioHistory();
		investorHistory.setInvestorPortfolio(investor);
		investorHistory.setDiscountRate(investor.getDiscountRate());
		investorHistory.setMyCreditLine(investor.getMyCreditLine());
		investorHistory.setCurrentCreditLine(investor.getCurrentCreditLine());
		investorHistory.setStartDate(investor.getStartDate());
		investorHistory.setEndDate(currentDate);
		investorHistory.setUpdatedBy(userName);
		investorHistoryDAO.saveEntity(investorHistory);
		
		//updating investor Portfolio
		investor.setDiscountRate(investorModel.getDiscountRate());
		investor.setCurrentCreditLine(investorModel.getCurrentCreditLine());
		investor.setMyCreditLine(investorModel.getMyCreditLine());
		investor.setAvailToInvest(investorModel.getAvailToInvest());
		investor.setStartDate(currentDate);
		investorDAO.update(investor);
		
	}	
	


	public Map<Long, List<InvestorPortfolio>> getInvestorPortfolioByUserId(
			long id) {
		
		return investorDAO.getInvestorPortfolioByUserId(id);
	}

	public void addInvestorPortfolios(List<InvestorPortfolio> investors,
			long investorId) {
		List<Long> scfCmpList=investorDAO.getInvestorsScfCompanies(investorId);		
		if(scfCmpList!=null && scfCmpList.size()>0){
			List<InvestorPortfolio> addList=new ArrayList<InvestorPortfolio>();
			List<InvestorPortfolio> updateList=new ArrayList<InvestorPortfolio>();
			for(InvestorPortfolio investorPortfolio : investors){
				if(scfCmpList.contains(investorPortfolio.getCompany().getId())){
					//investorPortfolio=investorDAO.findById(id);
					InvestorPortfolio investorPort =investorDAO.getInvestorProtfolio(investorId,investorPortfolio.getCompany().getId());
					investorPort.setMyCreditLine(investorPortfolio.getMyCreditLine());
					investorPort.setAvailToInvest(investorPortfolio.getAvailToInvest());
					investorPort.setDiscountRate(investorPortfolio.getDiscountRate());
					updateList.add(investorPort);
				}else{
					addList.add(investorPortfolio);
				}			
			}
			investorDAO.updateInvestorPortfolios(updateList, investorId);
			investorDAO.addInvestorPortfolios(addList,investorId);	
		}else{
			investorDAO.addInvestorPortfolios(investors,investorId);	
		}		
	}
	
	public void updateInvestorPortfolios(List<InvestorPortfolio> investors,long investorId){
		investorDAO.updateInvestorPortfolios(investors,investorId);
	}
	public Map<String,BigDecimal>  getProtfolioTotals(long id) {
		return investorDAO.getProtfolioTotals(id);
	}
	
	public Map<Long,BigDecimal>  findTotalCreditLine(long investorID){
		return investorDAO.findTotalCreditLine(investorID);
	}
	
	public 	List<InvestorPortfolio>  findTotalCreditLineBreakDown(long scfCompany){
		return investorDAO.findTotalCreditLineBreakDown(scfCompany);
	}

	public 	List<InvestorPortfolio>  findAllInvestorProtFolios(){
		return investorDAO.findAllInvestorProtFolios();
	}

	public List<InvestorDTO> getInvestorDetails() {
		return investorDAO.getInvestorDetails();
	}

	public void updateInvestorDetails(List<InvestorDTO> investors) {
		 investorDAO.updateInvestorDetails(investors);		
	}
	
	public BigDecimal  getWhiteHallShare(long id){
		return investorDAO.getWhiteHallShare(id);		
	}
	
	public Map<String,BigDecimal>  getProtfolioTotals(){
		return investorDAO.getProtfolioTotals();	
	}
	public Long getInvestorIDByCompanyId(long companyId) {
		return investorDAO.getInvestorIDByCompanyId(companyId);
	}
	public Investor findByInvestorId(long id){
		return investorDAO.findByInvestorId(id);
	}

	public List<Investor> getCashPoition() {
		return investorDAO.getCashPoition();
	}

	public List<Object[]> getInvestorPortfolioDataForGraph(
			Long scfCompanyId) {
		return investorDAO.getInvestorPortfolioDataForGraph(scfCompanyId);
	}
	
	public BigDecimal getTotalCreditAvailForGraph(long scfCompanyId){
		return investorDAO.getTotalCreditAvailForGraph(scfCompanyId);
	}
	
	public List<Object[]> getInvestorPortfolioDataForInvestorGraph(Long investorID){
		return investorDAO.getInvestorPortfolioDataForInvestorGraph(investorID);
	}
	
	public BigDecimal getTotalCreditAvailForInvestorGraph(Long investorID){
		return investorDAO.getTotalCreditAvailForInvestorGraph(investorID);
	}
}
