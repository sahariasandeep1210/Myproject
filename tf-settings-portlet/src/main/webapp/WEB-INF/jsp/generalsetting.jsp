<%@ include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveGeneralSettings">
	<portlet:param name="action" value="saveGeneralSettings" />
</portlet:actionURL>
<div class="container-fluid">
      <div class="row-fluid">
				<div class="span12" >
					 <div class="span4"><h4>Manage General Settings</h4></div>	
				</div>
      </div>

<form:form method="post" commandName="generalSettingModel"
		class="form-horizontal" name="generalSettingForm">
		<input type="hidden" value="${saveGeneralSettings}" id="saveSettingURL" />
		<input type="hidden" value="${generalSettingModel.id}" name="id" />
		
		<div class="row-fluid">
			<div class="span6">




				<div class="table-responsive" id="generalTable">
					<table class="table  tablesorter table-bordered">
						<thead>
							<tr>
								<!-- <th width="5%"></th> -->
								<th>Settings</th>
								<th width="25%"></th>
							</tr>
						</thead>
						<tbody>
						 <c:choose>
						   <c:when test="">
						    <c:forEach items="" var="test"> 
							<tr>
							     <td>Whitehall Profit Share %</td>
							      <td>
							       <form:input path="whitehalShare"  id="profit" />
							    </td> 
							</tr>
							<tr>
							     <td>VAT</td>
							      <td>
							        <form:input path="vat"  id="vat" />
							      
							      </td>
							</tr>
							<tr>
							     <td>Seller Transaction Fee</td>
							      <td>
							         <form:input path="sellerTransFee"  id="transaction" />
							       
							      </td>
							</tr>
							<tr>
							     <td>Seller Finance Fee</td>
							      <td>
							         <form:input path="sellerFinFee"  id="finance" />
							         
							      </td>
							</tr>
						 </c:forEach>
							</c:when> 
						<c:otherwise>
 								<tr>
										<td colspan="3" align="center" style="text-align: center;">
											<liferay-ui:message key='investor.not.found' />
										</td>
									</tr>						</c:otherwise>		
  								</c:choose>
					</tbody>
					</table>
				</div>


			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Update Settings" id="updateGeneralSettings" class="btn btn-primary" />
			</div>
		</div>
	</form:form>
	</div>
	