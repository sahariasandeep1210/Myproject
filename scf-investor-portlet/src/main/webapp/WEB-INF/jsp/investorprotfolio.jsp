<%@include file="init.jsp"%>

<portlet:actionURL var="updateProtfolioURL">
	<portlet:param name="action" value="updateProtfolio"/>
</portlet:actionURL>

<portlet:actionURL var="editProtfolioURL">
	<portlet:param name="action" value="editProtfolio"/>
</portlet:actionURL>

<portlet:resourceURL id="editProtfolio" var="editProtfolio" ></portlet:resourceURL> 
<portlet:resourceURL id="deleteProtfolio" var="deleteProtfolio" ></portlet:resourceURL> 
<portlet:resourceURL id="historyURL" var="historyURL" ></portlet:resourceURL> 

<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>
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

<form:form   method="post" commandName="investorDTO"
	action="${updateProtfolioURL}" id="investorModel" name="investorModel" class="form-horizontal">
	<input type="hidden" name="investorID" value="${investorID}" />
	
		<div class="table-responsive">
			<table class="table tablesorter table-bordered"  id="companyListTable">
				<thead>
					<tr>
						<th>SCF Company</th>
						<th>Total Credit Line</th>
						<th>My Credit Line</th>
						<th>BPS</th>
						<th>Utilised</th>
						<th>Available</th>	
						<th>My Transactions</th>										
					</tr>
				</thead>
				<tbody>
				 <c:choose>
					<c:when test="${fn:length(investorHistoryList) gt 0}">
							<tr class="totalstr">
								<td>Totals</td>
								<td> <c:out default="None" escapeXml="true" value="${totalsMap.creditLine eq 0 ?'':totalsMap.creditLine}"/> </td>
								<td><c:out default="None" escapeXml="true" value="${totalsMap.myCreditLine eq 0 ?'':totalsMap.myCreditLine}"/></td>
								<td></td>
								<td><c:out default="None" escapeXml="true" value="${totalsMap.amountInvested eq 0 ?'':totalsMap.amountInvested}"/></td>
								<td><c:out default="None" escapeXml="true" value="${totalsMap.availToInvest eq 0 ?'':totalsMap.availToInvest}"/></td>
								<td>
								</td>	
							</tr>
						<c:forEach items="${investorHistoryList}" var="investorProt" varStatus="loop">
							<tr class="${loop.index % 2 == 0 ? 'evenrow' : 'oddrow'}">
								<td id="${investorProt.investorProtId}_cmpname">${investorProt.company.name} </td>
								<td id="${investorProt.investorProtId}_currcreditLine">${investorProt.currentCreditLine}</td>
								<td id="${investorProt.investorProtId}_mycreditLine">${investorProt.myCreditLine}</td>
								<td id="${investorProt.investorProtId}_dicountRate">${investorProt.discountRate}</td>
								<td id="${investorProt.investorProtId}_utilised">${investorProt.amountInvested}</td>
								<td>${investorProt.availToInvest}</td>
								<td><a href="javascript:void(0);" title="Edit" class="editInvestor btn" id="${investorProt.investorProtId}_"><i class="fa fa fa-pencil-square-o fa-3"></i> Edit</a>  
									<a href="javascript:void(0);" title="History" class="historybtn btn" data-url="${historyURL}" protID="${investorProt.investorProtId}"><i class="fa fa-history"></i> History</a>  
								</td>	
							</tr>
							<tr class="historyRow"  id="${investorProt.investorProtId}_row">
								
							  <td colspan=7>
							   
							  </td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								
								<td colspan="7" align="center" style="text-align: center;">Protfolio information not found!</td>
							</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span6">
				 <button type="button" class="btn btn-primary addButton" id="addProtfolioBtn"><i class="fa fa-plus"></i> Add Protfolio</button>
				 <input type="button" value="Go Back"	class="btn btn-primary" />
			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		<div id="protfolioTemplate" class="parentclass hide">
		
			<div class="row-fluid" >
				<div class="span6">
					<div class="span6">
						<select id="scfCompany" name="investorModel.company.id"   class="span9 scfDropDown">
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
					<!-- 	<input type="text" name="investorModel.discountRate" class="span9" id="discountRate" placeholder="Offered BPS*" /> -->
						<select id="discountRate" name="investorModel.discountRate"   class="span9">
								 <option value="" disabled selected>Offered BPS*</option>
								<c:forEach var="discount" items="${discountList}">
									<option value="${discount}">${discount}</option>
								</c:forEach>			
							</select>
					</div>
					<div class="span6">
							<!-- <input  type="text" name="investorModel.amountInvested" class="span9" id="amountInvested" placeholder="Utilized" /> -->
						 <button type="button" class="btn btn-primary removeButton"><i class="fa fa-minus"></i> Remove</button>
					</div>
				</div>
			<!-- 	<div class="span6">
					<div class="span6">
						<input type="text" name="investorModel.availToInvest" class="span9" id="availToInvest" placeholder="Available" />
					</div>
					<div class="span6">
						  <button type="button" class="btn btn-primary removeButton"><i class="fa fa-minus"></i> Remove</button>
					</div>
				</div> -->
	
			</div>
			<hr>
		</div>
		
		<div id="editTemplate" class="hide">
		
			<div class="row-fluid" >
				<div class="span6">
					<div class="span6">
						<input type="hidden" name="profolioId" id="profolioId"/>
						<label class="span6 scfCompany" id="scfCompantName" >Alternate Name:</label>
					</div>
					<!-- <div class="span6">
						<input  type="text" name="currentCreditLine" class="span9" id="editcurrCreditLine" placeholder="Current Credit Line*" />
					</div> -->
					<div class="span6">
						<input  	type="text" name="myCreditLine" 	class="span9" 	id="editmyCreditLne" placeholder="My Credit Line*" />
						<input type="hidden" id="editutilised" name="editutilised" />
					</div>
				</div>
				<!-- <div class="span6">
					<div class="span6">
						<input  	type="text" name="myCreditLine" 	class="span9" 	id="editmyCreditLne" placeholder="My Credit Line*" />
					</div>
				</div> -->
					<div class="span6">
						<div class="span6">
						<input type="text" name="discountRate" class="span9" id="editDiscountRate" placeholder="Offered BPS*" />
					
						</div>
							<!-- <input  type="text" name="investorModel.amountInvested" class="span9" id="amountInvested" placeholder="Utilized" /> -->
						 <div class="span6">
						 <button type="button" class="btn btn-primary" id="updatebtn" data-url="${editProtfolioURL}"><i class="fa fa fa-pencil-square-o fa-3"></i> Update</button>
						 <button type="button" class="btn btn-primary" id="editCancel">Cancel</button>
						 </div>
					</div>
				</div>
	
			</div>
		<!-- 	<div class="row-fluid">
				<div class="span12"></div>
			
			</div> -->
		<%-- 	<div class="row-fluid" >
				<div class="span6">
					<div class="span6">
						<input type="text" name="discountRate" class="span9" id="editDiscountRate" placeholder="Offered BPS*" />
					</div>
					<div class="span6">
							<!-- <input  type="text" name="investorModel.amountInvested" class="span9" id="amountInvested" placeholder="Utilized" /> -->
						 <button type="button" class="btn btn-primary" id="updatebtn" data-url="${editProtfolioURL}"><i class="fa fa fa-pencil-square-o fa-3"></i> Update</button>
						 <button type="button" class="btn btn-primary" id="editCancel">Cancel</button>
					</div>
				</div>
			
			</div> --%>
			<!-- <hr> -->
		</div>

		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		

		<div class="row-fluid" id="butonClass">
			<div class="span6">

				<input type="button" value="Update Protfolio"
					class="btn btn-primary" id="saveProtfolios"/> 
			</div>
			<div class="span6"></div>
		</div>

	</form:form>




</div>

		<div id="editConfirmationModel" class=" modal fade" tabindex="-1"
			role="dialog" aria-labelledby="editConfirmationModelLabel"
			aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="first"
					aria-hidden="true">×</button>
				<h4 id="myModalLabel">Edit Confirmation</h4>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to continue? All unsaved information would be lost.</p>
				<input type="hidden" id="invProtID"  value=""/>
			</div>
			<div class="modal-footer">
				<input type="button" value="Edit Protfolio" class="btn btn-primary" id="last" onclick="confirmEdit()"/>
				<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
				
			</div>
		</div>




