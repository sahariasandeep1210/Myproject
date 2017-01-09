<%@include file="init.jsp"%>

<portlet:actionURL var="createTradeURL">
	<portlet:param name="action" value="saveTrade" />
</portlet:actionURL>


<portlet:actionURL var="updateTradeUrl">
	<portlet:param name="action" value="updateTrade" />
</portlet:actionURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>



  
  



<!-- <div id="myToggler" class="panel panel-blue quick-stat-panel customToggler" > 
 -->
 
<!-- <div class="toggleHeader">
  	<div class="toggle-title pull-left"><h3 class="panel-title">TRADE INFORMATION </h3></div>
  	<div class="toggle-icon-container text-right">
  		<i class="icomoon-accordian-arrow-down"></i>
  	</div>
  	
  </div>
 -->
<div class="panel panel-blue mt0">

	<div class="panel-heading">
    	<h3 class="panel-title">TRADE INFORMATION</h3>
  	</div>


<div class="panel-body" >


<form:form commandName="scfTradeModel" method="post"	action="${updateTradeUrl}" id="updteTradeForm" autocomplete="off"
		 name="TradeDetail" enctype="multipart/form-data">
		 
		<input type="hidden" value="${deleteTradeURL}" id="deleteURL"> 
		<input type="hidden" value="${invoiceIds}" name="invoiceIds"> 
		
	<div class="row-fluid">
		<div class="span12">
			<div class="title-container">
				<div class="main-title">
					${scfTradeModel.company.name}
				</div>
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
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="duration"> Duration </label> 
				<form:input path="duration" readonly="true"  cssClass="field"  id="duration"/>
			</div>
		</div>
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="closingDate"> Closing Date </label> 
				<form:input path="closingDate"  disabled="true" cssClass="field" id="closingDate" />
			</div>
		</div>
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="openingDate"> Opening Date </label> 
				<form:input path="openingDate" disabled="true" cssClass="field" id="openingDate" />
			</div>
		</div>
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="investorPaymentDate"> Investor Payment Date </label> 
				<form:input path="investorPaymentDate" disabled="true" cssClass="field" 	id="investorPaymentDate" />
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="SellerPaymentDate"> Seller Payment Date </label> 
				<form:input path="SellerPaymentDate" disabled="true" readonly="true" cssClass="field"		id="SellerPaymentDate" />
			</div>
		</div>
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="tradeAmount"> Trade Amount </label> 
				<form:input path="tradeAmount" readonly="true" cssClass="field" />
			</div>
		</div>
		<div class="span3 spanSm6">
			<div class="control-group">
				<label class="control-label" 	for="tradeNotes"> Trade Notes </label> 
				<form:input path="tradeNotes" readonly="true" cssClass="field" />
			</div>
		</div>
		<div class="span3 spanSm6">
		
			<div id="sampleFileUpload" class="customFileUpload">
					<div class="control-group">
						<label class="control-label"	for="fileUploadBtn">file-upload-btn </label> 
						<input class="field fileUploadManager" type="file" id="promisoryDocument" name="PromisoryDocument"  />
					</div>
					<div class="control-group">
					<label class="control-label"	for="fileUploadFakeBtn">Promisory Note 
					
						<c:if test="${not empty scfTradeModel.promisoryDocURL}">
							- <a href="${scfTradeModel.promisoryDocURL}" target="_blank" >Download</a> 
						</c:if>	
					</label> 
						<div class="input-append">
							<input class="field disabled fakeFileUploader" disabled=""	id="fileUploadFakeBtn"	name="fileUploadFakeBtn"
								placeholder="Upload File" type="text" > 
								<span class="add-on">BROWSE</span>
						</div>
					</div>
				</div>
				
		</div>
	</div>
	
			<div class="control-group field-wrapper">

				<label class="control-label"
					for="roundingDetailsSection">
					 Insurance Document  
					 	<c:if test="${not empty scfTradeModel.insuranceDocURL}">
							<c:set value="true" var="docPresent"></c:set>
						</c:if>	
					
					</label>
			</div>


			<div class="row-fluid" i>
				<div class="span3" >
					<div class="control-group form-inline">
						<label class="checkbox" 	for="wantToInsure">
							 <input 	class="field" 		id="wantToInsure"	name="wantToInsure" type="checkbox"  checked="${docPresent}">
							<span class="checkBoxIcon"></span> 
							<c:choose>
								<c:when test="${docPresent}">
									<a href="${scfTradeModel.insuranceDocURL}" target="_blank" >Insurance Document</a> 
								</c:when>
								<c:otherwise>
									Want to Insure?
								</c:otherwise>							
							</c:choose>
							
							
						</label>
					</div>
				</div>
				<div class="span3" >
					<div id="sampleFileUpload1" class="customFileUpload">
						<div class="control-group">
							<label class="control-label"	for="fileUploadBtn">file-upload-btn </label> 
							<input class="field fileUploadManager" type="file" id="insuranceDocument" name="insuranceDocument"  />
						</div>
						<div class="control-group">
							<div class="input-append">
								<input class="field disabled fakeFileUploader" disabled=""
									id="fileUploadFakeBtn1"
									name="fileUploadFakeBtn1"
									placeholder="Upload File" type="text" value=""> <span
									class="add-on" >BROWSE</span>
							</div>
						</div>
					</div>
				</div>
			</div>



			<%@include file="invoicelisttable.jsp"%>



	
	<div class="actionContainer text-left">
  			<input type="button" 	value="Update" class="btn btnBgBuSm" id="updateTrade" />			
  			<input type="button"	value="Go Back" class="btn btnBgBuSm" data-url="${defaultRender}" id="tradeback" />
  		</div>
	</form:form>
</div>
</div>

<aui:script>
AUI().ready(function() {
	
	fileUploadmanagerObj = new fileUploadmanager("#sampleFileUpload",function(obj){
		//file upload change event
	});
	
	fileUploadmanagerObj1 = new fileUploadmanager("#sampleFileUpload1",function(obj){
		//file upload change event
	});
	
	
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