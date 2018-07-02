<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.model.Portlet"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.service.PortletLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@include file="init.jsp"%>
<portlet:renderURL var="invoiceURL">
	<portlet:param name="render" value="updateInvoices" />
</portlet:renderURL>
<%
	ThemeDisplay themeDisp = (ThemeDisplay) request
			.getAttribute(WebKeys.THEME_DISPLAY);

%>

	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="invoiceListTable">
			<thead>
				<tr>
					
						<th>SCF Company<br><img id="scfCompanyAsc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					        <img id="scfCompanyDesc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				
					<th>Supplier Company<br><img id="scfCompanyAsc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                        <img id="scfCompanyDesc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>InvoiceDate<br><img id="paymentDateAsc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                   <img id="paymentDateDesc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				
					
					<th>PaymentDate<br><img id="paymentDateAsc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                   <img id="paymentDateDesc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>Amount<br><img id="invoiceAmoutAsc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					              <img id="invoiceAmoutDesc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					
					<th>Status<br><img id="statusAsc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					          <img id="statusDesc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(invoicesNotTradedList) gt 0}">
						<c:forEach items="${invoicesNotTradedList}" var="invoice">
							<tr>
								
								<td class="text-center">${invoice.scf_company_name}</td>
								<td class="text-center" >${invoice.seller_company_name}</td>	
								<td class="text-center">${invoice.invoice_date} </td>
								<td class="text-center">${invoice.finance_date} </td>
										
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${invoice.amount}"  pattern="#,##0.00"/></td>
							
								
													
								<td class="text-center">
								    ${invoice.status}
								
								</td>
							</tr>
						</c:forEach>
					</c:when>					
					<c:otherwise>
						<tr>
							<td colspan="6" align="center">No records found!</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

