<%@include file="init.jsp"%>

<portlet:actionURL var="updateProtfolioURL">
	<portlet:param name="action" value="updateProtfolio"/>
</portlet:actionURL>


<div class="container-fluid">

<div class="row-fluid">
				<div class="span12" >
					<div class="span4"><h4>Manage Portfolio</h4></div>		
								
				</div>
</div>
<div class="row-fluid">
				<div class="span12" style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
					<div class="span12"><h6>Conveniently manage your Portfolio.</h6></div>		
								
				</div>
</div>

<form:form   method="post" commandName="investorModel"
	action="${updateProtfolioURL}" id="investorModel" name="investorModel" class="form-horizontal">
	
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered"  id="companyListTable">
				<thead>
					<tr>
						<th>SCF Company</th>
						<th>Credit Line</th>
						<th>My Credit Line</th>
						<th>BPS</th>
						<th>Utilised</th>
						<th>Available</th>										
					</tr>
				</thead>
				<tbody>
				 <c:choose>
					<c:when test="${fn:length(investorHistoryList) gt 0}">
						<c:forEach items="${allProtfolies}" var="investorProt">
							<tr>
								<td>${investorProt.company.name} </td>
								<td>${investorProt.currentCreditLine}</td>
								<td>${investorProt.myCreditLine}</td>
								<td>${investorProt.discountRate}</td>
								<td>${investorProt.amountInvested}</td>
								<td>${investorProt.availToInvest}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								<td colspan="6" align="center" style="text-align: center;">Protfolio information not found!</td>
							</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span6">
				 <button type="button" class="btn btn-primary addButton span3"><i class="fa fa-plus"></i> Add Protfolio</button>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		<div id="protfolioTemplate" class="parentclass hide">
		
			<div class="row-fluid" >
				<div class="span6">
					<div class="span6">
						<select id="scfCompany" name="investorModel.company.id"   class="span9">
								 <option value="" disabled selected>Select SCF Company*</option>
								<c:forEach var="company" items="${companyList}">
									<option value="${company.id}">${company.name}</option>
								</c:forEach>			
							</select>
					</div>
					<div class="span6">
						<input  type="text" name="investorModel.currentCreditLine" class="span9" id="creditLine" placeholder="Current Credit Line" />
					</div>
				</div>
				<div class="span6">
					<div class="span6">
						<input  	type="text" name="investorModel.myCreditLine" 	class="span9" 	id="myCreditLne" placeholder="My Credit Line*" />
					</div>
				</div>
	
			</div>
			<div class="row-fluid">
				<div class="span12"></div>
			
			</div>
			<div class="row-fluid" >
				<div class="span6">
					<div class="span6">
						<input type="text" name="investorModel.discountRate" class="span9" id="discountRate" placeholder="Offered BPS*" />
					</div>
					<div class="span6">
						<input  type="text" name="investorModel.amountInvested" class="span9" id="amountInvested" placeholder="Utilized" />
					</div>
				</div>
				<div class="span6">
					<div class="span6">
						<input type="text" name="investorModel.availToInvest" class="span9" id="availToInvest" placeholder="Available" />
					</div>
					<div class="span6">
						  <button type="button" class="btn btn-primary removeButton"><i class="fa fa-minus"></i> Remove</button>
					</div>
				</div>
	
			</div>
			<hr>
		</div>

		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		

		<div class="row-fluid">
			<div class="span6">

				<input type="submit" value="Update Protfolio"
					class="btn btn-primary" /> <input type="button" value="Go Back"
					class="btn btn-primary" />
			</div>
			<div class="span6"></div>
		</div>

	</form:form>
<%-- <div class="table-responsive">
	<table class="table table-hover tablesorter table-bordered">
		<thead>
			<tr>
				<th>Discount Rate</th>
				<th>Investment Cap</th>
				<th>Start End</th>
				<th>End Date</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(investorHistoryList) gt 0}">
					<c:forEach items="${investorHistoryList}" var="investorHis">
						<tr>
							<td>${investorHis.discountRate}</td>
							<td>${investorHis.investmentCap}</td>
							<td>${investorHis.startDate}</td>
							<td>${investorHis.endDate}</td>
												
						</tr>
					</c:forEach>
			</c:when>
			<c:otherwise>
							<tr>
								<td colspan="4" align="center" style="text-align: center;"> No History found!</td>
							</tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
 --%>


</div>




