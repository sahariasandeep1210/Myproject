<%@include file="init.jsp"%>

<portlet:actionURL var="createTradeURL">
	<portlet:param name="action" value="saveTrade" />
</portlet:actionURL>


<portlet:actionURL var="updateTradeUrl">
	<portlet:param name="action" value="updateTrade" />
</portlet:actionURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>


<div class="container-fluid">
	<form:form commandName="scfTradeModel" method="post"
		action="${updateTradeUrl}" id="updteTradeForm" autocomplete="off"
		name="TradeDetail" enctype="multipart/form-data">
		<input type="hidden" value="${deleteTradeURL}" id="deleteURL"> 
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



		<%-- <div class="row-fluid">
			<div class="span6">
				<label class="span6">SCF Trade:</label>
				<label class="checkbox span6"> <form:checkbox path="scfTrade" value="Yes" /> 
				</label>

			</div>

		</div> --%>
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
		<div class="row-fluid">
		<c:choose>
		<c:when test="${scfTradeModel.id !=null && scfTradeModel.id !=0}">
			<div class="span6">
				<label class="span6">Insurance Document:</label>
				<c:choose>
				    <c:when test="${not empty scfTradeModel.insuranceDocURL}">
				       <input type="file" name="insuranceDocument" id="insuranceDocument" class=""/> 
				       <a  id="insuranceDocumentLink" href="${scfTradeModel.insuranceDocURL}"  class="span6">${scfTradeModel.insuranceDocName}</a> 
				       <div style="display:none" class="span6">
							<label class="checkbox span6"> <input checked="true" id="wantToInsure" type="checkbox"></label>
			 		   </div>
				   </c:when>
				   <c:otherwise>
				       	<div class="span6">
							<label class="span6">Want to Insure?</label>
							<label class="checkbox span6"> <input id="wantToInsure" type="checkbox"></label>
			 		   </div>
			 		    <div class="pull-right" style="display:none; margin-right: 11%" id="insuranceDocDiv">
					        <div class="span6">
					             <input type="file" name="insuranceDocument" id="insuranceDocument" class=""/>
					         </div>
			            </div>
				   </c:otherwise>
				</c:choose>
				
				
		  	</div>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
		</div>
		<br>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Promisory Note:</label>
				<c:choose>
				    <c:when test="${not empty scfTradeModel.insuranceDocURL}">
				      <input type="file" id="promisoryDocument" name="PromisoryDocument"  class=""/>
				       <a href="${scfTradeModel.promisoryDocURL}"  class="span6">${scfTradeModel.promisoryDocName}</a> 
				   </c:when>
				   <c:otherwise>
				      <input type="file" id="promisoryDocument" name="PromisoryDocument"  class=""/>
				   </c:otherwise>
				</c:choose>
			</div>
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
			<c:if test="${scfTradeModel.id == null && scfTradeModel.id == 0}">
							<input type="button" value="Add Trade" class="btn btn-primary"
					data-url="${createTradeURL}" id="tradeAdd" /> 
			</c:if>
				
					
					<input type="button"
					value="Go Back" class="btn btn-primary"
					data-url="${defaultRender}" id="tradeback" />
					<input type="button" style="display:none" value="Update" id="updateTrade" class="btn btn-primary"/>
			</div>
		</div>

	</form:form>

</div>
<script>
$(function(){
	if($("#wantToInsure").is(":checked")){
		  $("#updateTrade").show();
	}
	$("#updateTrade").on("click",function(){
		if($("#insuranceDocument").val()=="" && $("#insuranceDocumentLink").length<=0){
			$("#insuranceDocument").css("border","1px solid red");
		}else if($("#insuranceDocument").val()=="" && $("#promisoryDocument").val()==""){
			$("#insuranceDocument").css("border","1px solid red");
		}else{
			$("#updteTradeForm").submit();
		}
	});
	
	$("#wantToInsure").on("click",function(){
		  if(this.checked){
			  $("#insuranceDocDiv").show();
		      $("#updateTrade").show();
		  }else{
			  $("#updateTrade").hide();
		      $("#insuranceDocDiv").hide();
		  }

	});
});

</script>




