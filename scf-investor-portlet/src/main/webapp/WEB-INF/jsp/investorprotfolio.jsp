<%@ include file="init.jsp"%>
<%@include file="tabview1.jsp"%>

<portlet:actionURL var="updateProtfolioURL">
	<portlet:param name="action" value="updateProtfolio"/>
</portlet:actionURL>

<portlet:actionURL var="editProtfolioURL">
	<portlet:param name="action" value="editProtfolio"/>
</portlet:actionURL>

<portlet:resourceURL id="editProtfolio" var="editProtfolio" ></portlet:resourceURL> 
<portlet:resourceURL id="deleteProtfolio" var="deleteProtfolio" ></portlet:resourceURL> 
<portlet:resourceURL id="historyURL" var="historyURL" ></portlet:resourceURL> 
<portlet:resourceURL id="crtLinebreakdownURL" var="crtLinebreakdownURL" ></portlet:resourceURL> 

<div class="alert alert-danger" id="errorMsg"> </div>


<div class="tab-content">
<form:form   method="post" commandName="investorDTO"
	action="${updateProtfolioURL}" id="investorModel" name="investorModel" class="form-horizontal">
	<input type="hidden" name="investorID" value="${investorID}" />

<div class="title-container clearfix">
					
					
					<div class="btn-wrapper">						
						<button type="button" class="btnBgGreenSm addButton" id="addProtfolioBtn"><i class="fa fa-plus"></i> Add Protfolio</button>
					</div>
			  </div>


	
		<div class="customTableContainer">
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
								<td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.creditLine}" /> </td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.myCreditLine}" /></td>
								<td></td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.amountInvested}" /></td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.availToInvest}" /></td>
								<td>
								</td>	
							</tr>
						<c:forEach items="${investorHistoryList}" var="investorProt" varStatus="loop">
							<tr class="${loop.index % 2 == 0 ? 'evenrow' : 'oddrow'}">
								<td id="${investorProt.investorProtId}_cmpname">${investorProt.company.name} </td>
								<td id="${investorProt.investorProtId}_currcreditLine"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.currentCreditLine}" /> <a href="javascript:void(0);"  data-url="${crtLinebreakdownURL}" class="breakdown"   style=" float: right; vertical-align: middle; font-size: 20px" scfcompany="${investorProt.company.id}" investorID="${investorProt.investor.investorId}"><i class="fa fa-plus-square-o"></i> </a></td>
								<td id="${investorProt.investorProtId}_mycreditLine"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.myCreditLine}" /></td>
								<td id="${investorProt.investorProtId}_dicountRate">${investorProt.discountRate}</td>
								<td id="${investorProt.investorProtId}_utilised"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.amountInvested}" /></td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.availToInvest}" /></td>
								<td><button title="Edit" class="editInvestor btnBgGreenSm btnIconSm" id="${investorProt.investorProtId}_"><i class="icomoon-edit"></i></button>  
									<button title="History" class="historybtn btnBgBuSm btnIconSm" data-url="${historyURL}" protID="${investorProt.investorProtId}"><i class="icomoon-history"></i></button>  
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
		<!-- <div class="row-fluid">
			<div class="span6">
				 <button type="button" class="btn btn-primary addButton" id="addProtfolioBtn"><i class="fa fa-plus"></i> Add Protfolio</button>
				 <input type="button" value="Go Back"	class="btn btn-primary" />
			</div>
			
		</div> -->
		
			<div class="row-fluid">
				<div class="span12">
					
				</div>
			</div>
		
		<div id="protfolioTemplate" class="parentclass hide customWell filter-container">
		
			<div class="row-fluid" >
				<div class="span3">
					
						<select id="scfCompany" name="investorModel.company.id"   class="scfDropDown aui-field-select">
								 <option value="" disabled selected>Select SCF Company*</option>
								<c:forEach var="company" items="${companyList}">
									<option value="${company.id}">${company.name}</option>
								</c:forEach>			
							</select>
					
				</div>
				
					<div class="span3 mtXs10">
						<input  	type="text" name="investorModel.myCreditLine" 	class="span9" 	id="myCreditLne" placeholder="My Credit Line*" />
					</div>
					<div class="span3 mtXs10">
						<select id="discountRate" name="investorModel.discountRate"   class="aui-field-select">
								 <option value="" disabled selected>Offered BPS*</option>
								<c:forEach var="discount" items="${discountList}">
									<option value="${discount}">${discount}</option>
								</c:forEach>			
							</select>
					</div>
					<div class="span3 mtXs10">
						 <button type="button" class="btnBgRedSm btnIconSm removeButton"><i class="icomoon-delete"></i></button>
					</div>
			
	
			</div>
			<div class="row-fluid">
				<div class="span12"></div>
			
			</div>
		
			<hr>
		</div>
		
		<div id="editTemplate" class="hide customWell filter-container">
	
		
		
			<div class="row-fluid" >
					<div class="span3">
						<div class="control-group">
							<label class="control-label">SCF Company</label>
							<input type="hidden" name="profolioId" id="profolioId"/>
							<label class="scfCompany control-label" id="scfCompantName"  >Alternate Name:</label>
						</div>
					</div>				
					<div class="span3 mtXs10">
						<div class="control-group">
							<label  class="control-label">My Credit Line</label>
							<input  	type="text" name="myCreditLine" 	class="field" 	id="editmyCreditLne" placeholder="My Credit Line*" />
							<input type="hidden" id="editutilised" name="editutilised" />
						</div>
					</div>
					<div class="span3 mtXs10">
							<div class="control-group">
							<label class="control-label">Discount Rate</label>
							<select id="editDiscountRate" name="discountRate"   class="aui-field-select">
									 <option value="" disabled selected>Offered BPS*</option>
									<c:forEach var="discount" items="${discountList}">
										<option value="${discount}">${discount}</option>
									</c:forEach>			
								</select>
								</div>
					</div>
						 <div class="span3 mtXs10">
						 	<div class="actionContainer text-left">
						 <button type="button" class="btn btnBgGreenSm" id="updatebtn" data-url="${editProtfolioURL}"><i class="fa fa fa-pencil-square-o fa-3"></i> Update</button>
						 <button type="button" class="btn  btnBgBuSm" id="editCancel">Cancel</button>
						 </div>
						 </div>
					
				</div>
	
			</div>
	

		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		

		<div class="row-fluid" id="butonClass">
			<div class="span6">

				<input type="button" value="Update Protfolio"	class="btn btnBgGreenSm" id="saveProtfolios" /> 
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
		
		<div id="breakdownModel" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="breakdownModelLabel"
			aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="first"
					aria-hidden="true">×</button>
				<h4 id="breakdownLabel">Credit Line breakdown</h4>
			</div>
			<div class="modal-body" id="breakdownBody">
				
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>				
			</div>
		</div>