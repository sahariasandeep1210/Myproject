package com.tf.controller.investor;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.investor.util.InvestorDTO;
import com.tf.model.Allotment;
import com.tf.model.Company;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorPortfolioHistory;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.InvestorModelDTO;
import com.tf.service.AllotmentService;
import com.tf.service.CompanyService;
import com.tf.service.InvestorHistoryService;
import com.tf.service.InvestorService;
import com.tf.service.InvestorTransactionService;
import com.tf.service.SCFTradeService;
import com.tf.service.UserService;
import com.tf.util.PaginationUtil;
import com.tf.util.model.PaginationModel;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

/**
 * This controller is responsible for request/response handling on
 * Investor screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvestorController {
	
	protected Log _log = LogFactoryUtil.getLog(InvestorController.class);
	private static final int MINDISCOUNT=400;
	private static final int MAXDISCOUNT=600;
	private  final static String ACTIVETAB			 		="activetab";	
	private static final String Investor_Protfolios 		= "allinvestorprotfolios";
	private static final String Investor_Balance 			= "investorbalance";
	private static final String Cash_Report 				= "casReport";
	private static final BigDecimal mul_Value=new BigDecimal(1.025);
	private static final BigDecimal mul_minValue=new BigDecimal(1.025);
	private static final BigDecimal YEAR=new BigDecimal(365/45);




	@Autowired
	protected PaginationUtil paginationUtil;
	
	@Autowired
	protected  UserService userService; 
	
	@Autowired
	protected  InvestorService investorService;
	@Autowired
	protected  AllotmentService allotmentService;
	
	@Autowired
	protected  CompanyService companyService; 
	
	@Autowired
	protected  InvestorHistoryService investorHistoryService; 
	
	@Autowired
	protected InvestorTransactionService investorTransactionService;
	
	@Autowired
	protected SCFTradeService scfTradeService;
	
	@RenderMapping(params = "render=investorProtfolios")
	protected ModelAndView renderInvestorProtfolios(@ModelAttribute("investorDTO")InvestorDTO  investorDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render InvestorController ");
		model.put(ACTIVETAB, Investor_Protfolios);
		if(getPermissionChecker(request).isOmniadmin() ){
			List<InvestorPortfolio> list =investorService.findAllInvestorProtFolios();
			Map<String,BigDecimal> totalsMap=investorService.getProtfolioTotals();
			model.put("totalsMap", totalsMap);
			model.put("investorList", list);	
		}
		return new ModelAndView(Investor_Protfolios, model);		
	}
	
	@RenderMapping(params = "render=investorBalance")
	protected ModelAndView renderinvestorbalance(@ModelAttribute("investorBalanceModel")InvestorTransaction  investorBalanceModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render InvestorController");
		List<com.tf.persistance.util.InvestorDTO> investors = null;
		List<InvestorTransaction> investorsTransactions = null;
		investors=companyService.getInvestors();
		investorsTransactions=investorTransactionService.getInvestorTransactions();
		model.put("investorsTransactions",investorsTransactions );
	    model.put("investors", investors);
		model.put(ACTIVETAB, Investor_Balance);
	    return new ModelAndView(Investor_Balance, model);		
	}
	
	@RenderMapping(params = "report=casReport")
	protected ModelAndView rendercasReport(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
        long companyId=userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
        if(request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
		if(companyId > 0){

		Company company=companyService.findById(companyId);
		Long investor= investorService.getInvestorIDByCompanyId(companyId);
		Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
        investorList=investorTransactionService.getInvestors(investor, paginationModel.getStartIndex(), paginationModel.getPageSize());
 		noOfRecords=investorTransactionService.getInvestorsCount(investor);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
		model.put("paginationModel", paginationModel);
        model.put("companyname", company);
        model.put("investorList", investorList);
		model.put(ACTIVETAB, Cash_Report);

		}
       }	
		return new ModelAndView(Cash_Report,model);
	
	}
	
	@RenderMapping(params = "receivable=receivableReport")
	protected ModelAndView receivableReport(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		List<SCFTrade> scftrades=null;
		List<com.tf.persistance.util.InvestorModelDTO>  dtos = null;
		com.tf.persistance.util.InvestorModelDTO dto;
		SCFTrade scfTrade=null;
		Company company=null;
		BigDecimal totalAllotAmount = BigDecimal.ZERO; 
		BigDecimal totalMajurity = BigDecimal.ZERO; 
		BigDecimal majurityGross = BigDecimal.ZERO; 
		BigDecimal majurityNet = BigDecimal.ZERO; 
		BigDecimal returnAmount = BigDecimal.ZERO; 

		BigDecimal totalFinance= BigDecimal.ZERO; 
		BigDecimal totalNet = BigDecimal.ZERO; 
		BigDecimal totalAmount= BigDecimal.ZERO; 
		BigDecimal Finance = BigDecimal.ZERO; 

		Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		Long investorId = ParamUtil.getLong(request, "investorID"); 
		List<InvestorPortfolio> investors=investorTransactionService.getInvestorPortfolioId(investorId);
		Set<com.tf.persistance.util.InvestorModelDTO> dtos2 = new LinkedHashSet<com.tf.persistance.util.InvestorModelDTO>();
        for(InvestorPortfolio investor:investors){
		          List<Allotment> allotmentList=allotmentService.getALlotmentByPortId(investor.getInvestorProtId(), paginationModel.getStartIndex(), paginationModel.getPageSize());

			for(Allotment allots:allotmentList){
				  noOfRecords=allotmentService.getAllotsCount(allots.getAllotmentId());

				scfTrade=allots.getScfTrade();
				List<SCFTrade> scTrade=scfTradeService.getScfTradesByTradeId(scfTrade.getId());
				for(SCFTrade scf:scTrade){
					company=scf.getCompany();
					List<Company> comp=companyService.getCompaniesById(company.getId());
					for(Company com:comp){
				dto = new InvestorModelDTO();
                dto=getAllotments(dto, allots);
                dto.setClosingDate(scf.getClosingDate());
                dto.setName(com.getName());
                dtos2.add(dto);
					}
				}
		
			 majurityGross=allots.getAllotmentAmount().multiply(mul_Value).setScale(2, RoundingMode.CEILING);
			 Finance=majurityGross.subtract(allots.getAllotmentAmount()).multiply(mul_minValue).setScale(2, RoundingMode.CEILING);

			 majurityNet=majurityGross.subtract(Finance).setScale(2,RoundingMode.CEILING);
			  returnAmount=majurityNet.subtract(allots.getAllotmentAmount()).setScale(2, RoundingMode.CEILING);

             totalAllotAmount=totalAllotAmount.add(allots.getAllotmentAmount());
             totalMajurity=totalMajurity.add(allots.getAllotmentAmount().multiply(mul_Value).setScale(2,RoundingMode.CEILING));
             totalFinance=totalFinance.add(Finance);
             totalNet=totalNet.add(majurityNet);
             totalAmount=totalAmount.add(returnAmount);
			}
		}
        System.out.println("noof:"+noOfRecords);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);

        dtos=new ArrayList<com.tf.persistance.util.InvestorModelDTO>(dtos2);
        model.put("totalAllotAmount",totalAllotAmount);
        model.put("totalMajurity",totalMajurity);
        model.put("totalFinance",totalFinance);
        model.put("totalNet",totalNet);
        model.put("totalAmount",totalAmount);

		model.put("paginationModel", paginationModel);

		model.put("dtos", dtos);
		return new ModelAndView("receivableReport", model);		
	}

	@RenderMapping
	protected ModelAndView renderInvestorInfo(@ModelAttribute("investorDTO")InvestorDTO  investorDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Investor Protfolio");
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		long investorId=0l;
		 List<InvestorPortfolio> investorPortfolioList=null;		 
		 String viewName=prepareInvestorProtfolioInformation(request,investorDTO, model, themeDisplay,
				investorId, investorPortfolioList);		
		prepareDiscountList(model);

		return new ModelAndView(viewName, model);		
	}
	@ActionMapping(params="page=cashBack")
	protected void pageBack(ModelMap model,
			ActionRequest request, ActionResponse response){
		List<com.tf.persistance.util.InvestorDTO> investors = null;

		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();
        investors=companyService.getInvestors();
        Long investorID = ParamUtil.getLong(request, "investorID"); 
       
        if(investorID > 0){
    		Long noOfRecords=0l;
            PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
            investorList=investorTransactionService.getInvestors(investorID, paginationModel.getStartIndex(), paginationModel.getPageSize());
     		noOfRecords=investorTransactionService.getInvestorsCount(investorID);
            paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
    		model.put("paginationModel", paginationModel);
            model.put("investorList", investorList);
		    model.put("investorID", investorID);
		    model.put(ACTIVETAB, Investor_Balance);
		   
        }
        for(com.tf.persistance.util.InvestorDTO inv:investors){
        	if(inv.getInvestorID()==investorID){
                model.put("investorID", inv.getInvestorID());

        }
       } 	
        
        
        response.setRenderParameter("render", "investorBalance");
	}

	@RenderMapping(params="render=cashReport")
	protected ModelAndView renderSingleTrade(ModelMap model,
			RenderRequest request, RenderResponse response){
		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();
		List<com.tf.persistance.util.InvestorDTO> investors = null;
        investors=companyService.getInvestors();
        Long investorID = ParamUtil.getLong(request, "investorID"); 
		if(investorID > 0){		
		Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
        investorList=investorTransactionService.getInvestors(investorID, paginationModel.getStartIndex(), paginationModel.getPageSize());
 		noOfRecords=investorTransactionService.getInvestorsCount(investorID);
 		System.out.println("noOfRecordsss"+noOfRecords);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
		model.put("paginationModel", paginationModel);
        model.put("investorList", investorList);
	    model.put("investorID", investorID);
	    for(com.tf.persistance.util.InvestorDTO inv:investors){
        	if(inv.getInvestorID()==investorID){
                model.put("companyname", inv.getName());
                model.put("investorId", inv.getInvestorID());

        }
       } 	

		}
		return new ModelAndView("cashReport",model);
	}
	@RenderMapping(params="render=invesProt")
	protected ModelAndView renderInvesProt(InvestorDTO investorDTO,ModelMap model,
			RenderRequest request, RenderResponse response){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		long investorId=01;
		List<InvestorPortfolio> investorPortfolioList=null;
		String viewName="investorprotfolio";
		List<Company> companyList = new ArrayList<Company>();
		companyList = companyService.getCompanies("5");
		Map<Long,List<InvestorPortfolio>>  map=investorService.getInvestorPortfolioByUserId(themeDisplay.getUserId());
		for(Map.Entry<Long, List<InvestorPortfolio>> entry : map.entrySet()){
			investorId=entry.getKey();
			model.put("investorID", investorId);
			investorPortfolioList=entry.getValue();		
		}
		Map<String,BigDecimal> totalsMap=investorService.getProtfolioTotals(investorId);
		Map<Long,BigDecimal> totalCreditMap=investorService.findTotalCreditLine(investorId);
		setTotalCreditLine(totalCreditMap,investorPortfolioList);
		companyList=prepareCompanyList(companyList,investorPortfolioList);
		model.put("investorHistoryList", investorPortfolioList);	
		model.put(ACTIVETAB, viewName);

		model.put("totalsMap", totalsMap);	
		model.put("investorDTO", investorDTO);		
		model.put("companyList", companyList);
		
		return new ModelAndView(viewName,model);

	}

	private String prepareInvestorProtfolioInformation(RenderRequest request,InvestorDTO investorDTO,
			ModelMap model, ThemeDisplay themeDisplay, long investorId,
			List<InvestorPortfolio> investorPortfolioList) {
		String viewName="investorprotfolio";
		if(getPermissionChecker(request).isOmniadmin() ){
			List<InvestorPortfolio> list =investorService.findAllInvestorProtFolios();
			Map<String,BigDecimal> totalsMap=investorService.getProtfolioTotals();
			model.put("totalsMap", totalsMap);	
			model.put("investorList", list);	
			viewName="allinvestorprotfolios";
		}else{
			List<Company> companyList = new ArrayList<Company>();
			companyList = companyService.getCompanies("5");
			Map<Long,List<InvestorPortfolio>>  map=investorService.getInvestorPortfolioByUserId(themeDisplay.getUserId());
			for(Map.Entry<Long, List<InvestorPortfolio>> entry : map.entrySet()){
				investorId=entry.getKey();
				model.put("investorID", investorId);
				investorPortfolioList=entry.getValue();		
			}
			Map<String,BigDecimal> totalsMap=investorService.getProtfolioTotals(investorId);
			Map<Long,BigDecimal> totalCreditMap=investorService.findTotalCreditLine(investorId);
			setTotalCreditLine(totalCreditMap,investorPortfolioList);
			companyList=prepareCompanyList(companyList,investorPortfolioList);
			model.put("investorHistoryList", investorPortfolioList);	
			
			model.put("totalsMap", totalsMap);	
			model.put("investorDTO", investorDTO);		
			model.put("companyList", companyList);
		}
		return viewName;
		
	}	

	private void setTotalCreditLine(Map<Long, BigDecimal> totalCreditMap,
			List<InvestorPortfolio> investorPortfolioList) {
		for (InvestorPortfolio investorPortfolio :investorPortfolioList){
			investorPortfolio.setCurrentCreditLine(totalCreditMap.get(investorPortfolio.getCompany().getId()));
		}		
	}
	
	private List<Company> prepareCompanyList(List<Company> companyList,
			List<InvestorPortfolio> investorPortfolioList) {
		for(InvestorPortfolio investorPortfolio: investorPortfolioList){
			if(!(BigDecimal.ZERO.compareTo(investorPortfolio.getMyCreditLine()) == 0 )){
				companyList.remove(investorPortfolio.getCompany());	
			}					
		}
		return companyList;		
	}

	
	@ActionMapping(params="action=updateProtfolio")
	protected void add(@ModelAttribute("investorDTO")InvestorDTO  investorDTO, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);		
		long investorID=ParamUtil.get(request, "investorID", 0);
		investorDTO.setInvestorModel(filterNullValues(investorDTO.getInvestorModel(),themeDisplay));
		investorService.addInvestorPortfolios(investorDTO.getInvestorModel(), investorID);	
		
	}	
	
	@ActionMapping(params="action=addInvtranscation")
	protected void addInvestorBalance(@ModelAttribute("investorBalanceModel")InvestorTransaction  investorBalanceModel,
												 ModelMap model,
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();

		Long investorID=ParamUtil.getLong(request, "investorID",0l);
		
		if(investorID!=0 ){
        investorBalanceModel.setInvestorID(investorID);
	    investorTransactionService.saveInvestorBalance(investorBalanceModel);
	    Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
        investorList=investorTransactionService.getInvestors(investorID, paginationModel.getStartIndex(), paginationModel.getPageSize());
 		noOfRecords=investorTransactionService.getInvestorsCount(investorID);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
		model.put("paginationModel", paginationModel);
		model.put("investorList", investorList);
		}
	    model.put("investorID", investorID);

        response.setRenderParameter("render", "investorBalance");

	}
	@ActionMapping(params="getBy=getInvestorDetails")
	protected void getInvestorDetails(ModelMap model , ActionRequest request,ActionResponse response){
		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();        
		long investorID=ParamUtil.getLong(request, "investorID");
		if(investorID > 0){
			Long noOfRecords=0l;
	        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
	        investorList=investorTransactionService.getInvestors(investorID, paginationModel.getStartIndex(), paginationModel.getPageSize());
	 		noOfRecords=investorTransactionService.getInvestorsCount(investorID);
	        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
			model.put("paginationModel", paginationModel);
			model.put("investorList", investorList);
			model.put("investorID", investorID);			
         }
		
        response.setRenderParameter("render", "investorBalance");
	}
	
	@ActionMapping(params="cash=getCashReport")
	protected void getCashReport( ModelMap model,ActionRequest request,ActionResponse response) throws Exception {
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		List<com.tf.persistance.util.InvestorDTO> investors = null;
        investors=companyService.getInvestors();
		Date fromDate=formatter.parse("2/1/1970");
		Date toDate=new Date();
		long investorId=ParamUtil.getLong(request, "investorID");
		String transactionType=ParamUtil.getString(request, "transaction");
        String from=ParamUtil.getString(request, "fromDate");
        String to=ParamUtil.getString(request, "toDate");
        if(!StringUtils.isEmpty(from)){
        fromDate=formatter.parse(from);
        }
        if(!StringUtils.isEmpty(to)){
            toDate=formatter.parse(to);
       }
        
    
        Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
        List<InvestorTransaction> invList=investorTransactionService.getInvestorTransactionByTransactionType(investorId, transactionType, fromDate, toDate,paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords=investorTransactionService.getInvestorsCounts(investorId,transactionType, fromDate, toDate);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
		model.put("paginationModel", paginationModel);
        model.put("transactionType", transactionType);
        model.put("from", from);
        model.put("to", to);

        model.put("invList", invList);
        for(com.tf.persistance.util.InvestorDTO inv:investors){
        	if(inv.getInvestorID()==investorId){
                model.put("companyname", inv.getName());
                model.put("investorId", inv.getInvestorID());


        }
       } 	
        
        
        response.setRenderParameter("render", "cashReport");

	}
	@ActionMapping(params="fetch=fetchCashReport")
	protected void fetchCashReport( ModelMap model,ActionRequest request,ActionResponse response) throws Exception {
		List<InvestorTransaction> investorList = new ArrayList<InvestorTransaction>();
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate=formatter.parse("2/1/1970");
		Date toDate=new Date();
		long companyId=ParamUtil.getLong(request, "companyId");
/*        long companyId=userService.getCompanybyUserID(themeDisplay.getUserId()).getId();		
*/      Company company=companyService.findById(companyId);
		Long investorId=investorService.getInvestorIDByCompanyId(companyId);
        String transactionType=ParamUtil.getString(request, "transaction");
        String from=ParamUtil.getString(request, "fromDate");
        String to=ParamUtil.getString(request, "toDate");

        if(!StringUtils.isEmpty(from)){
        fromDate=formatter.parse(from);
        }
        if(!StringUtils.isEmpty(to)){
            toDate=formatter.parse(to);
       }
        
        Long noOfRecords=0l;
        PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
        investorList=investorTransactionService.getInvestors(investorId, paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords=investorTransactionService.getInvestorsCounts(investorId,transactionType, fromDate, toDate);
        paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
        List<InvestorTransaction> invList=investorTransactionService.getInvestorTransactionByTransactionType(investorId, transactionType, fromDate, toDate,paginationModel.getStartIndex(), paginationModel.getPageSize());
        System.out.println("DDD34:"+invList);
        model.put("invList", invList);
		model.put("paginationModel", paginationModel);
        model.put("companyname", company);
        if(invList.isEmpty()){
            model.put("investorList", investorList);
        }
        response.setRenderParameter("report", "casReport");
        

	}
	
	@ActionMapping(params="action=editProtfolio")
	protected void add(ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		InvestorPortfolio investorModel = new InvestorPortfolio();
		long profolioId= ParamUtil.getLong(request, "profolioId",0);
		BigDecimal currentCreditLine =new BigDecimal(ParamUtil.getString(request, "currentCreditLine","0"));
		BigDecimal myCreditLine =new BigDecimal(ParamUtil.getString(request, "myCreditLine","0"));
		int discountRate =ParamUtil.getInteger(request, "discountRate");
		investorModel.setCurrentCreditLine(currentCreditLine);
		investorModel.setMyCreditLine(myCreditLine);
		investorModel.setDiscountRate(discountRate);
		InvestorPortfolio investor=investorService.findById(profolioId);
		//if(discountRate !=investor.getDiscountRate().intValue() || currentCreditLine !=investor.getCurrentCreditLine() || myCreditLine!=investor.getMyCreditLine()){
		if(discountRate !=investor.getDiscountRate().intValue()  || myCreditLine.compareTo(investor.getMyCreditLine())!=0){	
			updateAvailtoInvest(investor,investorModel);
			investorService.updatePortfiloDetails(investor,investorModel, themeDisplay.getUser().getScreenName());		
		}		
	}
	
	private void updateAvailtoInvest(InvestorPortfolio investor,
			InvestorPortfolio investorModel) {
		if(investor.getAmountInvested()!=null){			
			investorModel.setAvailToInvest(investorModel.getMyCreditLine().subtract(investor.getAmountInvested()));
		}else{
			investorModel.setAvailToInvest(investorModel.getMyCreditLine());
		}
		
	}



	@ResourceMapping("historyURL")
	public ModelAndView fetchHistory(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		long protfolioID = ParamUtil.getLong(request, "protfolioID",0);
		List<InvestorPortfolioHistory>  investorHistoryList=investorHistoryService.getInvestorHistory(protfolioID);
		modelMap.put("investorHistoryList", investorHistoryList);
		modelMap.put("protfolioID", protfolioID);
		return new ModelAndView("investorprotfoliohistory");
	}
	
	
	@ResourceMapping("crtLinebreakdownURL")
	public ModelAndView crtLinebreakdown(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		long scfcompany = ParamUtil.getLong(request, "scfcompany",0); 
		long investorID = ParamUtil.getLong(request, "investorID",0);
		Company company=companyService.findById(scfcompany);
		List<InvestorPortfolio>  investorList=investorService.findTotalCreditLineBreakDown(scfcompany);
		modelMap.put("investorList", investorList);
		modelMap.put("scfCompany", company.getName());
		modelMap.put("investorID", investorID);
		return new ModelAndView("investorprotfoliobreak");
	}
	
	
	


	/**
	 * This method will discard InvestorPortfolio object which is having null Discount Rate.
	 * 
	 * @param 
	 * @return List<InvestorPortfolio>
	 */
	private List<InvestorPortfolio> filterNullValues(List<InvestorPortfolio> investorPortfolios,ThemeDisplay themeDisplay) {
		List<InvestorPortfolio> updatedInvestorPortfolios=new ArrayList<InvestorPortfolio>();
		for(InvestorPortfolio investorPortfolio :investorPortfolios){
			if(investorPortfolio!=null && investorPortfolio.getDiscountRate()!=null && investorPortfolio.getMyCreditLine()!=null){
				investorPortfolio.setMinDiscountRate(MINDISCOUNT);
				investorPortfolio.setMaxDiscountRate(MAXDISCOUNT);
				investorPortfolio.setAvailToInvest(investorPortfolio.getMyCreditLine());
				investorPortfolio.setStartDate(new Date());
				investorPortfolio.setUpdatedBy(themeDisplay.getUser().getScreenName());
				updatedInvestorPortfolios.add(investorPortfolio);
			}			
		}
		return updatedInvestorPortfolios;		
	}
	
	/**
	 * @param model
	 */
	private void prepareDiscountList(ModelMap model) {
		List<Integer> list=new ArrayList<Integer>();
		int i=MINDISCOUNT;
		while( i<=MAXDISCOUNT){
			list.add(i);
			i=i+10;
		}
		model.put("discountList", list);
	}
	
	
	private PermissionChecker getPermissionChecker(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		return permissionChecker;	
	}
	private com.tf.persistance.util.InvestorModelDTO getAllotments(
			com.tf.persistance.util.InvestorModelDTO dto, Allotment allots)
	{
		BigDecimal majurityGross = BigDecimal.ZERO; 
		BigDecimal Finance = BigDecimal.ZERO; 
		BigDecimal majurityNet = BigDecimal.ZERO; 
		BigDecimal returnAmount = BigDecimal.ZERO; 
		BigDecimal returns = BigDecimal.ZERO; 
        
		majurityGross=allots.getAllotmentAmount().multiply(mul_Value).setScale(2, RoundingMode.CEILING);
		Finance=majurityGross.subtract(allots.getAllotmentAmount()).multiply(mul_minValue).setScale(2, RoundingMode.CEILING);
		majurityNet=majurityGross.subtract(Finance).setScale(2,RoundingMode.CEILING);
		returnAmount=majurityNet.subtract(allots.getAllotmentAmount()).setScale(2, RoundingMode.CEILING);
		returns=majurityNet.subtract(allots.getAllotmentAmount()).multiply(YEAR).divide(allots.getAllotmentAmount()).setScale(2,RoundingMode.HALF_UP);
		dto.setAllotmentDate(allots.getAllotmentDate());
        dto.setNoOfdays(allots.getNoOfdays());		
        dto.setAllotmentAmount(allots.getAllotmentAmount());
        dto.setMajurityGross(majurityGross);
        dto.setFinanceFee(Finance);
        dto.setMajurityNet(majurityNet);
        dto.setReturnAmount(returnAmount);
        dto.setReturns(returns);
        return dto;
        

	}
	
}
