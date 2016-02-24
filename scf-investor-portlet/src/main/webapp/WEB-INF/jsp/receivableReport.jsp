<%@include file="init.jsp"%>

<div class="container-fluid">

<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="balanceListTable">
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
                            <td>${allotment.noOfdays}</td>
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
	</div>	
	