<%@include file="init.jsp"%>
<portlet:renderURL var="renderURL"/>

<div class="container-fluid">

<form:form method="post" commandName="receivableReportModel"
		class="form-horizontal" name="receivableReportForm" id="receivableReportForm" autocomplete="off"> 
                <input type="hidden" name="currentPages"  id="curentPages"   value="${paginationModel.currentPage}" />
                <input type="hidden" name="noOfRecords"  id="noOfRecords"   value="${paginationModel.noOfRecords}" />
                <input type="hidden" name="defaultRenderURL"   id="defaultRenderURL" 	  value="${renderURL}" />
                 
 
	<div class="row-fluid">
		<div class="span6">
			<div class="span6">
				<h4>Investor Receivable Report</h4>
			</div>
		</div>
	</div>
	

	<div class="table-responsive">
			
			
			<table class="addtextCenter" id="receivableReportTable">
				<colgroup>
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
            	</colgroup>
				<thead>
				</thead>
				<tbody>      
						<tr>
							<td><span class="total">TOTAL ALL</span></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${totalAllotAmount}</td>
                            <td>${totalMajurity}</td>
                            <td>${totalFinance}</td>
                            <td>${totalNet}</td>
                            <td>${totalAmount}</td>
                            <td></td>
						</tr>
						<tr>
						    <td>
						        <h5>
                                 <a href="#" style="color: #295780; font-weight: bold;" id="exportReceivable"> Export</a>
                                </h5>
						      </td>
						</tr>
						
						
					</tbody>
				</table>
	
                    
			<table class="table  tablesorter table-bordered" id="receivableReportTable">
				<colgroup>
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
                <col style="width: 9.09%;">
            	</colgroup>
				<thead>
					<tr>
					   
						<th>SCF Company</th>
						<th>Date Invested </th>
						<th>Date for Maturity</th>
						<th> Number of Days</th>	
						<th>Amount Invested</th>	
						<th>Amount at Maturity Gross</th>
						<th>Whitehall Finance Fee</th>
						<th>Amount at Maturity Net</th>
						<th>Return Amount</th>
						<th>Return %</th>
						<th>Status</th>
						
					</tr>
				</thead>
				<tbody>
				<c:choose>
                        <c:when test="${fn:length(dtos) gt 0}">
                             <c:forEach items="${dtos}" var="allotment">
				            
						<tr>
							<td>${allotment.name}</td>
                            <td><fmt:formatDate value="${allotment.allotmentDate}"
                                            pattern="dd-MM-yyyy" /></td>
                            <td><fmt:formatDate pattern="dd-MM-yyyy"
                                value="${allotment.closingDate}" /></td>							
                            <td width="7%">${allotment.noOfdays}</td>
							<td>${allotment.allotmentAmount}</td>
							<td>${allotment.majurityGross}</td>
							<td>${allotment.financeFee}</td>
							<td>${allotment.majurityNet}</td>
							<td>${allotment.returnAmount}</td>
							<td>${allotment.returns}</td>
							<td>${allotment.status}</td>
							
						</tr>
						</c:forEach>
                                </c:when>
 					       <c:otherwise>
 					       <tr>							
 					          <td colspan="9" align="center">No records found!</td>
 							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				</table>
			
	</div>
	</form:form>
	</div>	
	        <p:paginate  paginationModel="${paginationModel}"/>
	