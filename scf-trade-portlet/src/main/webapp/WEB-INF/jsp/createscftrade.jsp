<%@include file="init.jsp"%>




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
			<%--  <div id="sampleFileUpload" class="customFileUpload">
				
				<div class="control-group">
					<label class="control-label" for="promisoryDocument" > Promisory Note -
						<c:if test="${not empty scfTradeModel.promisoryDocURL}">
							<a href="${scfTradeModel.promisoryDocURL}"  class="span6">Download</a> 
						</c:if>			 
					 </label>
					<div class="input-append">
							<input type="file" id="promisoryDocument" name="PromisoryDocument"  class="field  fakeFileUploader"/>
							<span class="add-on">BROWSE</span>
					</div>
				</div>

				
			</div>  --%>
			<div id="sampleFileUpload" class="customFileUpload">
					<div class="control-group">
						<label class="control-label"	for="fileUploadBtn">file-upload-btn </label> 
						<!-- input class="field fileUploadManager"	id="fileUploadBtn" 		name="fileUploadBtn" type="file" value=""> -->
						<input class="field fileUploadManager" type="file" id="promisoryDocument" name="PromisoryDocument"  class=""/>
					</div>
					<div class="control-group">
					<label class="control-label"	for="fileUploadFakeBtn">Promisory Note 
					
						<c:if test="${not empty scfTradeModel.promisoryDocURL}">
							- <a href="${scfTradeModel.promisoryDocURL}" >Download</a> 
						</c:if>	
					</label> 
						<div class="input-append">
							<input class="field disabled fakeFileUploader" disabled=""	id="fileUploadFakeBtn"	name="fileUploadFakeBtn"
								placeholder="Upload File" type="text" > 
								<span class="add-on">BROWSE</span>
						</div>
					</div>
				</div>
				 <%-- <div id="sampleFileUpload" class="customFileUpload">
				<aui:input name="fileUploadBtn" cssClass="fileUploadManager" type="file"/>
				<aui:input disabled="true" cssClass="fakeFileUploader" name="fileUploadFakeBtn" label="Promisory Note" type="text" value="" placeholder="Upload File" suffix="BROWSE" ></aui:input>
				</div> --%>
		</div>
	</div>
	
	<aui:field-wrapper name="roundingDetailsSection" label="Insurance Document"></aui:field-wrapper>
        
    
	<div class="row-fluid">
		<div class="span3">
			<aui:input name="Option-1" type="checkbox" label="Want to Insure?" checked="true"></aui:input>
		</div>
		<div class="span3">
			<div id="sampleFileUpload1" class="customFileUpload">
				<aui:input name="fileUploadBtn" cssClass="fileUploadManager" type="file"/>
				<aui:input disabled="true" cssClass="fakeFileUploader" name="fileUploadFakeBtn1" label="" type="text" value="" placeholder="Upload File" suffix="BROWSE" ></aui:input>
			</div>
		</div>
	</div>
	
</form:form>

<div id="myToggler" class="customToggler">
  <div class="toggleHeader toggler-header-collapsed">
  	<div class="toggle-title pull-left">Invoice within Trade</div>
  	<div class="toggle-icon-container text-right">
  		<i class="icomoon-accordian-arrow-down"></i>
  	</div>
  	
  </div>
  <div class="toggleContent toggler-content-collapsed">
  	<div class="row-fluid">
  		<div class="span12 text-right">
  			<div class="actionContainer noBorder pt0">
  				<aui:button cssClass="btnBgGreenSm" value="Export"></aui:button>
  			</div>
  			
  		</div>
  	</div>
  	
  	<div class="customTableContainer">
	  	<table id="tablesorter-demo" class="tablesorter table">
			<thead>
				<tr>
					<th>Trade#</th>
					<th>SCF Company</th>
					<th>Allotment</th>
					<th>BPS</th>
					<th>Profit</th>
					<th>Share</th>
					<th>Net Profit</th>
					<th>Fees</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>TES1603</td>
					<td><b>TESCO</b></td>
					<td class="blue_normal">110,000</td>
					<td>420</td>
					<td>1,277.78</td>
					<td>102.31</td>
					<td>1,125.46</td>
					<td><b>2,159</b></td>
				</tr>
				<tr>
					<td>TES1603</td>
					<td><b>TESCO</b></td>
					<td class="blue_normal">110,000</td>
					<td>420</td>
					<td>1,277.78</td>
					<td>102.31</td>
					<td>1,125.46</td>
					<td>2,159</td>
				</tr>
				<tr>
					<td>TES1603</td>
					<td><b>TESCO</b></td>
					<td class="blue_normal">110,000</td>
					<td>420</td>
					<td>1,277.78</td>
					<td>102.31</td>
					<td>1,125.46</td>
					<td>2,159</td>
				</tr>
			</tbody>
		</table>
	  </div>
  </div>

  

</div>

<div class="actionContainer noBorder text-left">
	<aui:button cssClass="btnBgBuSm" value="GO BACK"></aui:button>
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

$(function() {		
	$("#tablesorter-demo").tablesorter();
});	
</aui:script>