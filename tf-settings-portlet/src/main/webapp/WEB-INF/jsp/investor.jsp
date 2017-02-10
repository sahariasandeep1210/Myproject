<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveInvestorSettings">
	<portlet:param name="action" value="saveInvestorSettings" />
</portlet:actionURL>
<div class="tab-content">

	
		<div id="scf-tab" class="tab-pane">
			  <div class="title-container clearfix">			  	
			  		<div class="main-title"><liferay-ui:message key='manage.investor.information' /></div>		  	
			  </div>		  	
		</div>
		
		<div id="scf-tab" class="tab-pane">
			  <div class="title-container clearfix">			  	
			  		<div ><h6><liferay-ui:message key='manage.investor.message' /></h6></div>		  	
			  </div>		  	
		</div>
		

	
	<form:form method="post" commandName="investorModel"
		class="form-horizontal" name="settingForm">
		<input type="hidden" value="${saveInvestorSettings}" id="saveURL" />
		




				<div class="customTableContainer" id="investorTable" style="width: 50%;">
					<table class="table  tablesorter table-bordered">
						<thead>
							<tr>
								<!-- <th width="5%"></th> -->
								<th>Investor Name</th>
								<th width="25%">Whitehall Profit Share %</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(investorList) gt 0}">
									<c:forEach items="${investorList}" var="investor"
										varStatus="indexattr">
										<tr>
									<%-- 		<td><input type="checkbox" name="investorDTO[${indexattr.index}].investorID"
												value="${investor.investorID}" /></td> --%>
											<td>${investor.name}</td>
											<td><input type="hidden" name="investorDTO[${indexattr.index}].investorID"
												value="${investor.investorID}" class="text-right"/><input type="text"
												value="${investor.whitehallShare}"
												name="investorDTO[${indexattr.index}].whitehallShare" class="text-right"></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3" align="center" style="text-align: center;">
											<liferay-ui:message key='investor.not.found' />
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>


		
		<div class="text-left">
				<input type="button" value="Update Settings" id="updateSettings" class="btn btnBgBuSm" />
		</div>
	</form:form>
</div>
