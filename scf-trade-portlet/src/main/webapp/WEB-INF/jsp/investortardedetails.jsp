<%@include file="init.jsp"%>



<portlet:renderURL var="defaultRender">
</portlet:renderURL>


<div class="panel panel-blue mt0">

	<div class="panel-heading">
    	<h3 class="panel-title">TRADE INFORMATION</h3>
  	</div>
  	<div class="panel-body">

	<form:form commandName="scfTradeModel" method="post"
		action="${updateTradeUrl}" id="updteTradeForm" autocomplete="off"
		name="TradeDetail" enctype="multipart/form-data">
		<input type="hidden" value="${invoiceIds}" name="invoiceIds">
		


		<div style="display:none" class="row-fluid">
			<div class="span6">
				<form:input path="scfId" readonly="true"  cssClass="span6"  id="scfId"/>
				<form:input path="id" readonly="true"  cssClass="span6"  id="scfId"/>
				<input type="hidden" value="${scfTradeModel.company.id}" name="companyID">
			</div>

		</div>
		
		<div class="customTableContainer mb15">
			<table class="table label-value">
				<tr>
					<td><b>Duration</b></td>
					<td class="text-center">${scfTradeModel.duration}</td>
					<td><b>Investor Payment Date</b></td>
					<td class="text-center">${scfTradeModel.investorPaymentDateString}</td>
				</tr>
				<tr>
					<td><b>Seller Payment Date</b></td>
					<td class="text-center">${scfTradeModel.sellerPaymentDateString}</td>
					<td><b>Trade Amount</b></td>
					<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${scfTradeModel.tradeAmount}" pattern="#,##0.00"/></td>
				</tr>
				<tr>
					<td><b>Company Name</b></td>
					<td>${scfTradeModel.company.name}</td>
					<td><b>Trade Notes</b></td>
					<td>${scfTradeModel.tradeNotes}</td>
				</tr>				
			</table>
		</div>
		
		
		

		
		<div class="customTableContainer" >

            <table class="table  tablesorter table-bordered" id="tradeListTable">
                <thead>
                    <tr>
                        <th>Allotments</th>
                        <th>BPS( Per Year)</th>
                        <th>Duration</th>
                        <th>Whitehall Profit Share</th>
                         <th>Investors Gross Profit</th>
                        <th>Investors Net profit( TOTAL)</th>
                        <th>Allotment date</th>

                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(allotments) gt 0}">
                            <c:forEach items="${allotments}" var="allotment">
                                <tr>
                                    <td class="rightalign blue_normal"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.allotmentAmount}" pattern="#,##0.00"/></td>
                                    <td class="rightalign">${allotment.marketDiscount}</td>
                                    <td class="text-center">${allotment.noOfdays}</td>
                                    <td class="rightalign red_bold">${allotment.whitehallProfitShare }</td>
                                    <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorGrossProfit}" pattern="#,##0.00"/></td>
                                    <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorNetProfit}" pattern="#,##0.00"/></td>
                                    <td class="text-center"><fmt:formatDate value="${allotment.allotmentDate}"
                                            pattern="dd-MM-yyyy HH:mm" /></td>

                                </tr>
                            </c:forEach>
                        </c:when>

                    </c:choose>
                </tbody>
            </table>
        </div>

		 
		<br>
		 <%@include file="invoicelisttable.jsp"%>
		 
		  <div class="actionContainer noBorder text-left">
			<input type="button"
					value="Go Back" class="btn btnBgBuSm"
					data-url="${defaultRender}" id="tradeback" />
					<input type="button" style="display:none" value="Update" id="updateTrade" class="btn btn-primary"/>
		  </div>



	</form:form>
	</div>

</div>

<aui:script>
AUI().ready(function() {	

	
	AUI().use('aui-toggler', function(A) {
        new A.TogglerDelegate({
            animated: true,
            closeAllOnExpand: true,
            container: '#myToggler',
            content: '.toggleContent',
            expanded: false,
            header: '.toggleHeader',
            transition: {
              duration: 0.2,
              easing: 'cubic-bezier(0, 0.1, 0, 1)'
            }
          });
    });
});
</aui:script>





