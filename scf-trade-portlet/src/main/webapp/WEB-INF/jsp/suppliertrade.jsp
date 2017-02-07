<%@include file="init.jsp"%>

<div class="panel panel-blue mt0">

	<div class="panel-heading">
    	<h3 class="panel-title">TRADE INFORMATION </h3>
  	</div>
	<div class="panel-body">
    <form:form commandName="SupplierTradeModel" method="post" action=" "     id="SupplierTradeList">
        <!--  <div class="row-fluid">
            <div class="search-supplier">
                <input type="text" name="Search" placeholder="Search Here">

            </div>
        </div> -->
        
        <div class="customTableContainer mb15">
			<table class="table label-value">
				<tr>
					<td><b>Supplier Name</b></td>
					<td>${sellerName}</td>
					<td><b>SCF Company Name</b></td>
					<td>${trades.company.name}</td>
				</tr>
				<tr>
					<td><b>TRADE VALUE</b></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${trades.tradeAmount}"  pattern="#,###.00"/> </td>
					<td><b>Opening Date</b></td>
					<td><fmt:formatDate value="${trades.openingDate}" pattern="dd-MM-yyyy" /></td>
				</tr>
				<tr>
					<td><b>White Fixed Charges</b></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value=" ${trades.sellerTransFee}"  pattern="#,###.00"/>  </td>
					<td><b>Maturity Date</b></td>
					<td><fmt:formatDate value="${trades.closingDate}" pattern="dd-MM-yyyy" /></td>
				</tr>
				<tr>
					<td><b>White Variable Charges</b></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${trades.sellerFees}"  pattern="#,###.00"/></td>
					<td><b>Supplier Payment Date</b></td>
					<td> <fmt:formatDate value="${trades.sellerPaymentDate}" pattern="dd-MM-yyyy " /></td>
				</tr>
			</table>
		</div>   
        
        <div class="customTableContainer" id="${tradeID}_table">

            <table class="table  tablesorter table-bordered" id="tradeListTable">
                <thead>
                    <tr>
                        <th>Allotments</th>
                        <th>BPS( Per Year)</th>
                        <th>Duration</th>
                     <!--    <th>Whitehall Profit Share</th> -->
                        <th>Investors Fees ( TOTAL)</th>
                        <th>Allotment date</th>

                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(allotments) gt 0}">
                            <c:forEach items="${allotments}" var="allotment">
                                <tr>
                                    <td class="blue_normal"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.allotmentAmount}"  pattern="#,###.00"/> </td>
                                    <td>${allotment.marketDiscount}</td>
                                    <td>${allotment.noOfdays}</td>                                    
                                    <td class="blue_normal"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorGrossProfit}"  pattern="#,###.00"/></td>
                                    <td><fmt:formatDate value="${allotment.allotmentDate}"
                                            pattern="dd-MM-yyyy HH:mm" /></td>

                                </tr>
                            </c:forEach>
                        </c:when>

                    </c:choose>
                </tbody>
            </table>
        </div>
       
               <%@include file="invoicelisttable.jsp"%>
               
           <div class="actionContainer noBorder text-left">
			<!-- <button class="btn btnBgBuSm" type="button"> GO BACK </button> -->
			    <a href="#" class="btn btnBgBuSm" id="tradeback">Back</a>
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
<!-- <div class="back-actions">

</div> -->
