<%@include file="init.jsp"%>

<div class="container-fluid">

    <form:form commandName="SupplierTradeModel" method="post" action=" "
        id="SupplierTradeList">
         <div class="row-fluid">
            <div class="search-supplier">
                <input type="text" name="Search" placeholder="Search Here">

            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                    <label class="span6">Supplier Name:</label>
                    ${companyname.name} 
                    
            </div>
            <div class="span6">
                    <label class="span6">SCF company Name:</label>
                    ${trades.company.name} 
                    
            </div>
            
     </div>
      <div class="row-fluid">
            <div class="span6">
                    <label class="span6">TRADE VALUE:</label>
                    ${trades.tradeAmount} 
                    
            </div>
            <div class="span6">
                    <label class="span6">Opening Date:</label>
                    <fmt:formatDate value="${trades.openingDate}" pattern="dd-MM-yyyy" />
                    
            </div>
            
     </div>
     <div class="row-fluid">
            <div class="span6">
                    <label class="span6">Seller Fixed Charges:</label>
                    ${trades.sellerTransFee} 
                    
            </div>
            <div class="span6">
                    <label class="span6">Maturity Date:</label>
                    <fmt:formatDate value="${trades.closingDate}" pattern="dd-MM-yyyy" />
                    
            </div>
            
     </div>
            <div class="row-fluid">
                <div class="span6">
                            <label class="span6">Seller Varibale Charges:</label> 
                            ${trades.sellerFees}
                </div>
                
                <div class="span6">
                    <label class="span6">Supplier Payment Date:</label>
                    <fmt:formatDate value="${trades.sellerPaymentDate}" pattern="dd-MM-yyyy " />
                    
            </div>
                
            </div>
      
      
        
        <div class="table-responsive" id="${tradeID}_table">

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
                                    <td>${allotment.marketDiscount}</td>
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
    </form:form>
</div>

<div class="back-actions">
    <a href="/group/guest/scf-trade" class="btn btn-primary btn-lg">Back</a>
</div>
