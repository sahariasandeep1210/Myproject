<%@include file="init.jsp"%>



<portlet:renderURL var="defaultRender">
</portlet:renderURL>


<div class="container-fluid">
	<form:form commandName="scfTradeModel" method="post"
		action="${updateTradeUrl}" id="updteTradeForm" autocomplete="off"
		name="TradeDetail" enctype="multipart/form-data">
		<input type="hidden" value="${invoiceIds}" name="invoiceIds"> 
		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4"></div>
				<div class="span4">
					<h4>
					<c:choose>
						<c:when test="${scfTradeModel.id !=null && scfTradeModel.id !=0}">
							Trade Information
						</c:when>
						<c:otherwise>
							Add Trade Information
						</c:otherwise>
					
					</c:choose>		
					
					
					</h4>
				</div>
			</div>
		</div>


		<div style="display:none" class="row-fluid">
			<div class="span6">
				<form:input path="scfId" readonly="true"  cssClass="span6"  id="scfId"/>
				<form:input path="id" readonly="true"  cssClass="span6"  id="scfId"/>
			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Duration:</label>
				<form:input path="duration" readonly="true"  cssClass="span6"  id="duration"/>

			</div>
			<div class="span6">
				<label class="span6">Closing Date:</label>
				<form:input path="closingDate"  disabled="true" cssClass="span5" id="closingDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Opening Date:</label>
				<form:input path="openingDate" disabled="true" cssClass="span5" id="openingDate" />

			</div>

			<div class="span6">
				<label class="span6">Investor Payment Date:</label>
				<form:input path="investorPaymentDate" disabled="true" cssClass="span5"
					id="investorPaymentDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Payment Date:</label>
				<form:input path="SellerPaymentDate" disabled="true" readonly="true" cssClass="span5"
					id="SellerPaymentDate" />

			</div>
			<div class="span6">
				<label class="span6">Trade Amount:</label>
				<form:input path="tradeAmount" readonly="true" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Company Name:</label>
				<label class="span6">${scfTradeModel.company.name}</label>
				<input type="hidden" value="${scfTradeModel.company.id}" name="companyID">
				<%-- <form:select path="companyId" items="${companyIdMap}"
					class="dropdown span6" id="companyId" placeholder="Company Name" /> --%>
			</div>


			<div class="span6">
				<label class="span6">Trade Notes:</label>
				<form:input path="tradeNotes" readonly="true" cssClass="span6" />

			</div>



		</div>
		
		<div class="table-responsive" >

            <table class="table  tablesorter table-bordered" id="tradeListTable">
                <thead>
                    <tr>
                        <th>Allotments</th>
                        <th>BPS( Per Year)</th>
                        <th>Duration</th>
                        <th>Whitehall Profit Share</th>
                        <th>Investors Fees ( TOTAL)</th>
                        <th>Allotment date</th>

                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(allotments) gt 0}">
                            <c:forEach items="${allotments}" var="allotment">
                                <tr>
                                    <td>${allotment.allotmentAmount}</td>
                                    <td>${allotment.marketDiscount}</td>
                                    <td>${allotment.noOfdays}</td>
                                    <td>${allotment.whitehallProfitShare }</td>
                                    <td>${allotment.investorNetProfit }</td>
                                    <td><fmt:formatDate value="${allotment.allotmentDate}"
                                            pattern="dd-MM-yyyy HH:mm" /></td>

                                </tr>
                            </c:forEach>
                        </c:when>

                    </c:choose>
                </tbody>
            </table>
        </div>

		<div class="row-fluid">
			<div class="faqflip"><div class="fa fa-chevron-down"></div>Invoices within Trade</div>
			<div class="faqpanel">
				  <%@include file="invoicelisttable.jsp"%>
			</div>
		</div>
		<br>


		<div class="row-fluid">
			<div class="span6">
							
					<input type="button"
					value="Go Back" class="btn btn-primary"
					data-url="${defaultRender}" id="tradeback" />
					<input type="button" style="display:none" value="Update" id="updateTrade" class="btn btn-primary"/>
			</div>
		</div>

	</form:form>

</div>





