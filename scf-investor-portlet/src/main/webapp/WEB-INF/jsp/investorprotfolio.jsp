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

<form:form commandName="investorModel" method="post"
	action="${updateProtfolioURL}" id="investorModel" name="investorModel">

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Investment Discount Rate:<span class="requiredStar">*</span></label>
				<input type="hidden" name="investorId" value="${investorModel.investorId}"		id="investorId" />
				<form:input path="discountRate"  cssClass="span6" id="discountRate" />


			</div>
		
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Min Discount Rate:</label>
				<form:input path="minDiscountRate" cssClass="span6" id="minDiscountRate" />
			</div>
			<div class="span6">
				<label class="span6">Max Discount Rate:</label>
				<form:input path="maxDiscountRate" cssClass="span6" id="maxDiscountRate" />
			</div>	
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Available To Invest:</label>
				<form:input path="availToInvest"  cssClass="span6" id="availToInvest" />
			</div>
			<div class="span6">
				<label class="span6">Amount Invested :</label>
				<form:input path="amountInvested"  cssClass="span6" id="amountInvested" readonly="true" />
			</div>	
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Investment Cap :</label>
				<form:input path="investmentCap" name="" cssClass="span6" id="investmentCap" />
			</div>			
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
<div class="table-responsive">
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



</div>




