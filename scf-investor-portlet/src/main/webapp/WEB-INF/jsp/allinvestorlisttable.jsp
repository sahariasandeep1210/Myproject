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
					
						<th>Investors <br><img id="investorsAsc" column-name="y.NAME" class="sortColumn" src="<%=  themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					        <img id="investorsDesc" column-name="y.NAME" class="sortColumn" src="<%=  themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
				
					<th>Cash <br><img id="cashAsc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                        <img id="cashDesc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
					<th>Receivables<br><img id="receivablesAsc" column-name="x.netProfit" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                   <img id="receivablesDesc" column-name="x.netProfit" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
				
					
					<th>Total Balance Sheet<br><img id="totalBalanceSheetAsc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					                   <img id="totalBalanceSheetDesc" column-name="y.cash_position" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
				<!--  	<th>Remaining<br><img id="invoiceAmoutAsc" column-name="x.avail" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					              <img id="invoiceAmoutDesc" column-name="x.avail" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					
					
					<th>Potential Shortfall<br><img id="statusAsc" column-name="y.amount" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="ASC" order="ASC"/>
					          <img id="statusDesc" column-name="y.amount" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="DESC" order="DESC"/>
					</th>
					-->
				</tr>
			</thead>
			<tbody>    <!--  
			                     <tr>
									<td style="background-color:#189a80;color:white" >Total</td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalInvoiceNotTraded}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalCredit}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalInvested}"  pattern="#,##0.00"/></td>
									
						
									</tr>
									-->
				<c:choose>
					<c:when test="${fn:length(balanceSummary) gt 0}">
						<c:forEach items="${balanceSummary}" var="summary">
						     
							    <tr>
								
								<td class="text-left">${summary.investorName}</td>
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${summary.cashPostion}"  pattern="#,##0.00"/></td>
							
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${summary.receivableAmount}"  pattern="#,##0.00"/></td>	
										
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${summary.totalBalanceSheet}"  pattern="#,##0.00"/></td>
							   
							  
													
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

