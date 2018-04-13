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
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter" width="20px"></th>
					</c:if>
					<th>Invoice Number<br><img id="invoiceNumbeAscr" column-name="scf.invoice_number" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					<img id="invoiceNumberDesc" column-name="scf.invoice_number" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>PaymentDate<br><img id="paymentDateAsc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                   <img id="paymentDateDesc" column-name="scf.payment_date" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>Amount<br><img id="invoiceAmoutAsc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					              <img id="invoiceAmoutDesc" column-name="scf.invoice_amout" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<th>Duration<br><img id="DurationAmoutAsc" column-name="scf.duration" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                 <img id="DurationAmoutDesc" column-name="scf.duration" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					
					<c:if test="${userType =='SCF Company Admin'}">
					<th>Supplier Company<br><img id="scfCompanyAsc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					                        <img id="scfCompanyDesc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					</c:if>
					<c:if test="${userType !='SCF Company Admin'}">
					<th>SCF Company<br><img id="scfCompanyAsc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					        <img id="scfCompanyDesc" column-name="scf.scf_company" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
					</c:if>
					
					<th>Status<br><img id="statusAsc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/up.png" alt="asc" order="asc"/>
					          <img id="statusDesc" column-name="scf.status" class="sortColumn" src="<%= themeDisp.getPathThemeImages() %>/down.png" alt="desc" order="desc"/>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(invoicesList) gt 0}">
						<c:forEach items="${invoicesList}" var="invoice">
							<tr>
								<c:if test="${defaultRender}">
									<td><c:choose>
											<c:when
												test="${ userType eq 'Seller Admin' && invoice.status eq 'New'}">
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class="green_bold"><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${invoice.invoiceAmount}"  pattern="#,##0.00"/></td>
								<td class="text-center">${invoice.duration}</td>
								
								<c:if test="${userType !='SCF Company Admin'}">
									<c:if test="${invoice.scfCompany.name eq null}">
									
									<td class="co" id="co">${invoice.sellerCompanyRegistrationNumber}</td>	
									</c:if>
									<c:if test="${invoice.scfCompany.name ne null}">
									<td>${invoice.scfCompany.name}</td>	
									</c:if>
								</c:if>
								<c:if test="${userType =='SCF Company Admin'}">
									<c:if test="${invoice.scfCompany.name ne null}">
									<td>${invoice.scfCompany.name}</td>		
									</c:if>	
									<c:if test="${invoice.scfCompany.name eq null}">
									<td>${invoice.scfCompany.name}</td>	
									</c:if>
								</c:if>							
								<td>
								${invoice.status}
								<c:if test="${invoice.status ne 'New'}">
								 (<a  href ="${tradeURL}&tradeID=${invoice.scfTrade.id}">${invoice.scfTrade.scfId} </a>)
								</c:if>
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

