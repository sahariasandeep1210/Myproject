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
			id="investorSCFListTable">
			<thead>
				<tr>
					
						<th>Investor<br><img id="investorNameAsc" column-name="y.investorName" class="sortColumn" src="<%=themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					        <img id="investorNameDesc" column-name="y.investorName" class="sortColumn" src="<%=themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
				
					<th>SCF company<br><img id="invoicesNotTradedAsc" column-name="xy.scfName" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                        <img id="invoicesNotTradedDesc" column-name="xy.scfName" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
					<th>Allocated<br><img id="invoiceDateAsc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                   <img id="invoiceDateDesc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
				
					
					<th>Receivable<br><img id="paymentDateAsc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                   <img id="paymentDateDesc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
					<th>Remaining<br><img id="invoiceAmoutAsc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					              <img id="invoiceAmoutDesc" column-name="pqr.my_credit_line" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
					
					<th>Cash<br><img id="statusAsc" column-name="pqr.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					          <img id="statusDesc" column-name="pqr.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					<th>Total Balance sheet<br><img id="statusAsc" column-name="pqr.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					          <img id="statusDesc" column-name="pqr.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					<th>Cash Less Committed<br><img id="statusAsc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					          <img id="statusDesc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
				</tr>
			</thead>
			<tbody>    
			                     <tr>
									<td style="background-color:#189a80;color:white" >Total</td>
									<td style="background-color:#189a80;color:white" ></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAllocatedAmount}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalReceivabbles}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalRemaingAmount}"  pattern="#,##0.00"/></td>
									
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalCashAmount}"  pattern="#,##0.00"/></td>
									
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalBalanceSheetAmount}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value=""  pattern="#,##0.00"/></td>
									
									</tr>
				<c:choose>
					<c:when test="${fn:length(balanceSummary) gt 0}">
						<c:forEach items="${balanceSummary}" var="balanceSummary">
						     
							    <tr>
							    	
								
								<td class="text-left">${balanceSummary.investorName}</td>
								<td class="text-left">${balanceSummary.scfName}</td>
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balanceSummary.allocatedAmount}"  pattern="#,##0.00"/></td>
							
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balanceSummary.receivableAmount == null ? 0:balanceSummary.receivableAmount}"  pattern="#,##0.00"/></td>	
										
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balanceSummary.receivableAmount == null ?balanceSummary.allocatedAmount:balanceSummary.remainingAmount}"  pattern="#,##0.00"/></td>
							   <td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balanceSummary.cashPostion}"  pattern="#,##0.00"/></td>
							
	                        	<td class="rightalign red_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${balanceSummary.receivableAmount== null ?balanceSummary.allocatedAmount:balanceSummary.totalBalanceSheet}"  pattern="#,##0.00"/></td>
								<td class="rightalign red_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value=""  pattern="#,##0.00"/></td>
								
													
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

