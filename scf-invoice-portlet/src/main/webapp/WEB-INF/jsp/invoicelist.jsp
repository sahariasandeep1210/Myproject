<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@page import="com.liferay.portal.model.Portlet"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.service.PortletLocalServiceUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="javax.portlet.WindowState"%>
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@include file="init.jsp"%>
<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>


<portlet:actionURL var="getInvoiceReportURL">
	<portlet:param name="invoice" value="getInvoiceReport" />
</portlet:actionURL>

<portlet:actionURL var="requestFinanceURL">
	<portlet:param name="action" value="requestFinance" />
</portlet:actionURL>

<portlet:renderURL var="createInvoiceURL">
	<portlet:param name="render" value="createInvoice" />
</portlet:renderURL>
<portlet:renderURL var="defaultRenderURL">
</portlet:renderURL>

<liferay-ui:error key="default-error-message"
	message="default.error.message" />

<liferay-ui:success key="invoice.success.trade"
	message="${successMessage}" />
	
<liferay-ui:success key="invoice.success.delete"
	message="${successMessage}" />
	

<liferay-ui:error key="invoice.allotment.error">
	<liferay-ui:message key="invoice.allotment.error"
		arguments="${scfCompany}"></liferay-ui:message>
</liferay-ui:error>

<%
	List<Portlet> portletList = PortletLocalServiceUtil.getPortlets();
	String portletId = null;
	ThemeDisplay themeDisplay = (ThemeDisplay) request
			.getAttribute(WebKeys.THEME_DISPLAY);

	for (Portlet portlet : portletList) {
		if (portlet.getPortletName().equalsIgnoreCase(
				"scf-trade-portlet")) {
			portletId = portlet.getPortletId();
			break;
		}
	}

	long plid = PortalUtil.getPlidFromPortletId(
			themeDisplay.getScopeGroupId(), true, portletId);
%>

<liferay-portlet:renderURL portletName="<%=portletId%>"
	var="createTradeURL" plid="<%=plid%>"
	windowState="<%=WindowState.NORMAL.toString()%>">
	<liferay-portlet:param name="render" value="createTrade" />
</liferay-portlet:renderURL>

<%@include file="tabview.jsp"%>



	<div class="tab-content">
	<div class="alert alert-error" id="errormsg" style="display: none;">
	</div>
	
		<form name="invoicelist" method="post" action="${invoiceDocumentsURL}" id="invoicelist">
		<input 	type="hidden" name="invoices" 				id="invoices"> 
		<input	type="hidden" name="companyId" 				id="companyId"> 
		<input	type="hidden" name="currentPage" 			id="currentPage"			value="${paginationModel.currentPage}" /> 
		<input 	type="hidden" name="currPageSize" 			id="currPageSize"			value="${paginationModel.pageSize}" /> 
		<input 	type="hidden" name="noOfRecords" 			id="noOfRecords"			value="${paginationModel.noOfRecords}" /> 
		<input  type="hidden" name="defaultURL" 			id="defaultURL" 			value="${defaultRenderURL}" /> 
		<input	type="hidden" name="getInvoiceReportURL"	id="getInvoiceReportURL"	value="${defaultRenderURL}" />
		<input 	type="hidden" name="pageSize"        		id="pageSize"      			value="${paginationModel.pageSize}" />
		
		<div id="scf-tab" class="tab-pane">
			  <div class="title-container clearfix">
			  	
			  		<div class="main-title">Manage Invoices</div>
			  	
			  	<div class="btn-wrapper">
			  			<aui:button cssClass="btnBrGrSm btnIconSm filter-btn active"  icon="icomoon-filter"></aui:button>
			  			<input type="button" class="btnBgGreenSm" value="Export" />
			  	</div>
			  </div>
		  	
		</div>

 <div class="customWell filter-container">
		  	<div class="row-fluid">
			<div class="span3 spanSm6">
				<div class="control-group">
					<div class="input-append">
						<input name="Search" type="text" placeholder="Search" id="search"	value="${search}" /> 
						<span class="add-on"><i	class="icomoon-search"></i></span>
					</div>
				</div>
			</div>

			<div class="span3 spanSm6 mtXs10">
		  			<div class="control-group">
					 	<select id="dateList" name="dateList">
								<option value="" selected="selected" >Select Date</option>
								<option value="invoiceDate" <c:if test="${ value 	eq 'invoiceDate'}">selected="selected" </c:if>>Invoice Date</option>
								<option value="payment_date" <c:if test="${ value 	eq 'payment_date'}">selected="selected" </c:if>>Payment Date</option>
								<option value="financeDate" <c:if test="${ value 	eq 'financeDate'}">selected="selected" </c:if>>Finance Date</option>
						</select>  
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
				  	<div class="control-group">
						<div class="input-append">
							<input name="fromDate" type="text" id="fromDate" placeholder="From"  value="${from}"  />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<div class="control-group">
						<div class="input-append">
							<input name="toDate" type="text" id="toDate" placeholder="To" value="${to}" />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  	</div>
		  	<div class="row-fluid">
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">
		  				 <input type="button" value="Search" id="invoiceReport" class="btnBgBuSm" />
		  			</div>
		  			
		  		</div>
		  	</div>
	</div>
		
  		
  			<%@include file="invoicelisttable.jsp"%>
  		
			<div class="actionContainer text-left">
				<c:if
					test="${userType eq 'SCF Company Admin' || userType eq 'Admin'}">
					<input type="button" 	value="Create Invoice" class="btn btnBgBuSm"		id="createInvoice" data-url="${createInvoiceURL}"  />
				</c:if>
				<c:choose>
					<c:when test="${userType eq 'Seller Admin' }">
						<input type="button" value="Request Finance" class="btn btnBgBuSm" id="requestFinance" data-url="${requestFinanceURL}" />
					</c:when>
					<c:otherwise>
						<input type="button" value="Create Trade" class="btn btn-primary"	id="createTrade" data-url="${createTradeURL}" />
					</c:otherwise>
				</c:choose>
			</div>
		  
		  
		
			 <div class="lfr-pagination">			
				<p:paginate  paginationModel="${paginationModel}"/>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">${paginationModel.pageSize} items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
					  	  <li role="presentation" pageSize="2"><a role="menuitem" href="#">2 items per page</a></li>
		                  <li role="presentation" pageSize="5"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation" pageSize="10"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation" pageSize="20"><a role="menuitem" href="#">20 items per page</a></li>
		                  <li role="presentation" pageSize="30"><a role="menuitem" href="#">30 items per page</a></li>
		                  <li role="presentation" pageSize="45"><a role="menuitem" href="#">45 items per page</a></li>
		                  <li role="presentation" pageSize="60"><a role="menuitem" href="#">60 items per page</a></li>
		                  <li role="presentation"  pageSize="75"><a role="menuitem" href="#">75 items per page</a></li>
		                </ul> 		              
					</div>
					
					<small class="search-results">Showing ${(paginationModel.currentPage-1)*paginationModel.pageSize+1} - 
					<c:choose>
							<c:when test="${paginationModel.currentPage*paginationModel.pageSize >= paginationModel.noOfRecords}">${paginationModel.noOfRecords}</c:when>
							<c:otherwise>${paginationModel.currentPage*paginationModel.pageSize}</c:otherwise>
					</c:choose>
					 of ${paginationModel.noOfRecords} Results.</small>				
					
				</div>
		  </div>
		  </form>
		  
		</div>
		
