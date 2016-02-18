<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@include file="init.jsp"%>
 <%@include file="tabview.jsp"%> 

<portlet:actionURL var="addInvtranscationURL">
	<portlet:param name="action" value="addInvtranscation"/>
</portlet:actionURL>

<portlet:renderURL var="cashReportURL">
    <portlet:param name="render" value="cashReport" />
</portlet:renderURL>

<portlet:actionURL var="getInvestorDetailsURL">
  <portlet:param name="getBy" value="getInvestorDetails"/>
</portlet:actionURL>
<portlet:renderURL var="defaultRenderURL" />


<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>

<div class="container-fluid">
 <form:form method="post" commandName="investorBalanceModel"
		class="form-horizontal" name="investorBalanceForm" id="investorBalanceForm" action="${getInvestorDetailsURL}">
		      <input type="hidden" value="${investorBalanceModel.id}" name="id" />
		     <input type="hidden" value="${addInvtranscationURL}" id="getInvBalanceDetails" />
 		     <input type="hidden" name="currentPage"  id="currentPage"   value="${paginationModel.currentPage}" />
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"  value="${paginationModel.noOfRecords}" />
		      	<input type="hidden" name="defaultURL" 	id="defaultURL" value="${getInvestorDetailsURL}" />
		      
		     
		      
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Investor Name :</label>
			<select id="investorName " name="investorName"  onchange="this.form.submit()" >
				<option value="0">---Select---</option>
			<c:forEach var="company" items="${companies}">
			     <option value="${company.id}" <c:if test="${ company.id eq investorName}">selected="selected" </c:if>>${company.name}</option>
			</c:forEach>
			</select>
           </div>
       </div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Cash Position:</label>
				   
	         </div>
	         
	         <div class="span6">
	             <a href="javascript:void(0);" onclick="window.location.href='${cashReportURL}&investorID=${investorName}'">Cash Report</a>
	         
	         </div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Receivables Position:</label>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Total Asset Value:</label>
			</div>
		</div>
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Action :</label>
			<select id="transcationType " name="transcationType" >
				<option value=" ">---Select---</option>
					<option value="<%=TranscationStatus.DEPOSIT.getValue() %>" >Deposit </option>
					<option value="<%=TranscationStatus.WITHDRAWAL.getValue()%>">Withdrawl </option>
					
			</select>
           </div>
       </div>
       <div class="row-fluid">
			<div class="span6">
				<label class="span6">Transaction Amount :</label>
					<form:input path="amount" cssClass="span9" id="transactionAmount"/>
				
				
			</div>
		</div>
		 <div class="row-fluid">
			<div class="span6">
				<label class="span6">Date:</label>
				<form:input path="transcationDate" cssClass="span9" id="balanceDate"/>
				
	</div>
			</div> 
		<div class="row-fluid">
			<div class="span6" id="buttons">
				<input type="button" value="Submit"  data-url="${addInvtranscationURL}" id="updatebalance" class="btn btn-primary" />
				<input type="button" value="Cancel" id="cancelSetting" class="btn btn-primary" />
		 </div>
	</div>
	<br>
	
 <c:if test="${not empty investorList}">
 <div class="row-fluid">
       <div class="span6">
         <div class="span12">
          </div>
        </div>
         <div class="span6">
	
				<div class="span12">
					<h5 style="float: right !important;">
						<a href="javascript:;" style="color: #295780; font-weight: bold;" id="exportBalances"> Export</a>
					</h5>
				</div>
			</div>
</div>	

<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="balanceListTable">
				<thead>
					<tr>
					   
						<th>Date</th>
						<th>Transaction Type</th>
						<th>TRADE ID</th>
						<th> Amount</th>	
						<th>Reference</th>	
						
					</tr>
				</thead>
				<tbody>
				     <c:forEach items="${investorList}" var="investorTransaction">
				    
						<tr>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${investorTransaction.transcationDate}" /></td>
							<td>${investorTransaction.transcationType}</td>
							<td></td>
							<td>${investorTransaction.amount}</td>
							<td></td>
						</tr>
						</c:forEach>
				</tbody>
				</table>
			
	</div>
	      	<p:paginate  paginationModel="${paginationModel}"/>
	      
	 </c:if>
 </form:form>
</div>	
