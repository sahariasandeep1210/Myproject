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
					
						<th>SCF Company<br><img id="scfCompanyAsc" column-name="x.NAME" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					        <img id="scfCompanyDesc" column-name="x.NAME" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				
					<th>Invoices Not Traded <br><img id="invoicesNotTradedAsc" column-name="y.amount" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                        <img id="invoicesNotTradedDesc" column-name="y.amount" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>Investor Credit Line<br><img id="invoiceDateAsc" column-name="scf.invoice_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                   <img id="invoiceDateDesc" column-name="scf.invoice_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				
					
					<th>Investor Amount Utilised<br><img id="paymentDateAsc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                   <img id="paymentDateDesc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>Remaining<br><img id="invoiceAmoutAsc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					              <img id="invoiceAmoutDesc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					
					<th>Potential Shortfall<br><img id="statusAsc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					          <img id="statusDesc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				</tr>
			</thead>
			<tbody>
			            <tr>
									<td style="background-color:#189a80;color:white" >Total</td>
									 <td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmounts}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white"></td>
									</tr>
				<c:choose>
					<c:when test="${fn:length(investorShorFallList) gt 0}">
						<c:forEach items="${investorShorFallList}" var="shortfall">
						     
							    <tr>
								
								<td class="text-center">${shortfall.scfName}</td>
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shortfall.invoiceAmount}"  pattern="#,##0.00"/></td>
							
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shortfall.credit}"  pattern="#,##0.00"/></td>
							
								
								
										
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shortfall.invested}"  pattern="#,##0.00"/></td>
							   <td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shortfall.avail}"  pattern="#,##0.00"/></td>
							
	                        	<td class="rightalign red_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${shortfall.shortFallAmount}"  pattern="#,##0.00"/></td>
								
													
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

