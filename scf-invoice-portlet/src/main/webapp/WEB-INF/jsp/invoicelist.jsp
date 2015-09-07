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

<portlet:renderURL var="invoiceDocumentsURL">
	<portlet:param name="render" value="invoiceDocuments" />
</portlet:renderURL>



<%
List<Portlet> portletList = PortletLocalServiceUtil.getPortlets();
String portletId = null;
ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);

for(Portlet portlet : portletList){
	if(portlet.getPortletName().equalsIgnoreCase("scf-trade-portlet")){
		portletId =  portlet.getPortletId();     
		System.out.println("portletId:::::::::::::::::::::"+portletId);
		break;
	}                     
}

long plid= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),true, portletId);
%>

<liferay-portlet:renderURL portletName="<%=portletId %>" var="createTradeURL" plid="<%=plid%>"  windowState="<%=WindowState.NORMAL.toString()%>">
<liferay-portlet:param name="render" value="createTrade"/>
</liferay-portlet:renderURL>

<div class="container-fluid">
	<form name="invoicelist" method="post" action="${invoiceDocumentsURL}" id="invoicelist">
	<input type="hidden" name="invoices" id="invoices">
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>Invoice Number</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${invoiceList}" var="invoice">
						<tr>
							<td><input type="checkbox" value="${invoice.id}"
								name="invoiceId"></td>
							<td>${invoice.invoiceNumber}</td>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.invoiceDate}" /></td>
							<td>${invoice.invoiceAmount}</td>
							<td>${invoice.duration}</td>
							<td>${invoice.scfCompany}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row-fluid">
			<input type="submit" value="Upload Invoice Document" class="btn btn-primary"
				id="uploadInvoice" />
				<input type="button" value="Create Trade" class="btn btn-primary" id="createTrade"  data-url="${createTradeURL}" />
		</div>


	</form>



</div>




