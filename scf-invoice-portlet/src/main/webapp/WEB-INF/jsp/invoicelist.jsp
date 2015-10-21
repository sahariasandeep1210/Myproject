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

<portlet:actionURL var="requestFinanceURL">
	<portlet:param name="action" value="requestFinance" />
</portlet:actionURL>

<portlet:renderURL var="createInvoice">
	<portlet:param name="render" value="createInvoice" />
</portlet:renderURL>

<%-- <portlet:renderURL var="invoiceDocumentsURL">
	<portlet:param name="render" value="invoiceDocuments" />
</portlet:renderURL> --%>



<%
List<Portlet> portletList = PortletLocalServiceUtil.getPortlets();
String portletId = null;
ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);

for(Portlet portlet : portletList){
	if(portlet.getPortletName().equalsIgnoreCase("scf-trade-portlet")){
		portletId =  portlet.getPortletId();     
		break;
	}                     
}

long plid= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),true, portletId);
%>

<liferay-portlet:renderURL portletName="<%=portletId %>" var="createTradeURL" plid="<%=plid%>"  windowState="<%=WindowState.NORMAL.toString()%>">
<liferay-portlet:param name="render" value="createTrade"/>
</liferay-portlet:renderURL>
<%@include file="tabview.jsp"%>
<div class="container-fluid" style=" padding: 0px;">

<div class="alert alert-error" id="errormsg" style="display: none;"> 
</div>
<div class="row-fluid">
				<div class="span12" >
					<div class="span4"><h4>Manage Invoices</h4></div>		
								
				</div>
</div>
<div class="row-fluid">
				<div class="span12">
					<div class="span12"><h6>Conveniently manage  your invoices.Please select one or more invoices to create trade.Alternatively you can upload invoices to create new trade </h6></div>		
								
				</div>
</div>

	<form name="invoicelist" method="post" action="${invoiceDocumentsURL}" id="invoicelist">
	<input type="hidden" name="invoices" id="invoices">
	<input type="hidden" name="companyId" id="companyId">
		  <%@include file="invoicelisttable.jsp"%>

		<div class="row-fluid">
		<!-- 	<input type="submit" value="Upload Invoice Document" class="btn btn-primary"
				id="uploadInvoice" /> -->
				<div class="span6">
				<input type="submit" value="Create Invoice" class="btn btn-primary" id=requestFinance  data-url="${requestFinanceURL}"  class="span6"/>
				<c:choose>
					<c:when test="${userType eq 'Seller Admin'}">
						<input type="button" value="Request Finance" class="btn btn-primary" id=requestFinance  data-url="${requestFinanceURL}" class="span6"/>
					</c:when>
					<c:otherwise>
						<input type="button" value="Create Trade" class="btn btn-primary" id="createTrade"  data-url="${createTradeURL}" class="span6"/>
					</c:otherwise>				
				</c:choose>
				</div>
				
				
		</div>

		
	
	</form>



</div>




