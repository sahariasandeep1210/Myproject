<%@include file="init.jsp"%>

<form:form commandName="companyModel" method="post"
	action="${createCompanyURL}" id="createCompany" name="companyDetail">
	<input type="hidden" value="${deleteCompanyURL}" id="deleteURL">
	
 <c:if test="${userType == 'Primary Investor Admin'}"> 
  <c:set var = "readValue" scope = "session" value = "true"/>
  </c:if>
   <c:if test="${companyModel.id ==null ||  companyModel.id ==0}"> 
		
			<div class="row-fluid"  id="fetchCmpInfo">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="CompanyNumber"> Company Number </label>
					<input type="text" id="companyNumber" name="companyNumber"	class="field" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
  					<!-- <label class="control-label" for="CompanyNumber" > Company Number </label> -->
					<input type="hidden" value="${fetchCompanyDetails}" id="fetchURL" />
					<input type="button" value="Find Company Details"		class="btn btnBgBuSm" id="findCompany" />
				</div>
  			</div>
  		</div>
	 </c:if> 


	<div id="companyDetails">		
		
		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="name"> Name * </label>
					<input type="hidden" name="id" value="${companyModel.id}"	id="compId" />
					<form:input path="name"   id="companyName"  cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>  			
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="alname"> Alternate Name </label>
					<form:input path="altname"   cssClass="field"   readonly="${readValue}"/>
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="regNum"> Registration Number * </label>
					<form:input path="regNumber"  id="registrationNo"   cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="dateEs"> Date Established *</label>
					<div class="input-append">						
						<form:input path="dateestablished" cssClass="field"	id="dateEst"  readonly="${readValue}" />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
					</div>
				</div>
  			</div>
  		</div>
  		
  		<div class="divider mb15"></div>
  		
	  		<div class="row-fluid">
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="add1"> Address Line 1 * </label>
						<form:input path="address.addressLine1"  id="address1" placeholder="Address Line 1*"  cssClass="field"  readonly="${readValue}" />
					</div>
	  			</div>
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="add2"> Address Line 2 </label>
						<form:input path="address.addressLine2"	id="address2" placeholder="Address Line 2" cssClass="field"   readonly="${readValue}" />
					</div>
	  			</div>
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="loc"> Locality </label>
						<form:input path="address.locality"  id="locality"		placeholder="Locality" cssClass="field"  readonly="${readValue}"  />
					</div>
	  			</div>
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="region"> Region  </label>
						<form:input path="address.region" id="region"		placeholder="Region" cssClass="field"   readonly="${readValue}" />
					</div>
	  			</div>
	  		</div>	
	  		
		  	<div class="row-fluid">
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="country"> Country * </label>
						<form:input path="address.country"  id="country" value="United Kingdom"	placeholder="country*" cssClass="field"   readonly="${readValue}" />
					</div>
	  			</div>
	  			<div class="span3">
	  				<div class="control-group">
						<label class="control-label" for="postal"> Postal Code * </label>
						<form:input path="address.postalCode" 	id="postalCode" placeholder="Postal Code*"  cssClass="field"  readonly="${readValue}"  />
					</div>
	  			</div>
	  		</div>

		<div class="divider mb15"></div>		
		
		
		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="telNo"> Telephone No * <i class="icon-info-sign tooltipPhone" data-toggle="tooltip" title="Ex. For UK 44 1234512345" ></i> </label>
					<form:input path="telnumber"  id="telNo"  cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="url"> URL </label>
					<form:input path="website"  cssClass="field"   readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
				<div class="control-group">
					<label class="control-label" for="orgType"> Organization Type</label>				
					<form:select path="orgType" items="${orgTypeMap}" class="aui-field-select"
					id="orgType" placeholder="Organisation Type"   readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
				<div class="control-group">
					<label class="control-label" for="comType"> Company Type *</label>
					
					<c:choose>
						<c:when test="${permissionChecker.isOmniadmin()}">


							<c:if test="${createInvestor == 'createInvestor'}">
								<form:select path="companyType" class="aui-field-select"
									id="companyType1" readonly="readonly">
									<option value="1">Primary Investor</option>
								</form:select>
							</c:if>
							<c:if test="${createInvestor != 'createInvestor'}">
								<form:select path="companyType" items="${companyTypeMap}"
									class="aui-field-select" id="companyType"
									placeholder="CompanyType Type" />
							</c:if>

						</c:when>
						<c:otherwise>	
							${cmpType}					
						</c:otherwise>
					</c:choose>					
				</div>
  			</div>
  		</div>
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="directors"> Directors </label>
					<form:input path="directors" cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="shareholders"> Shareholders </label>
					<form:input path="shareholders" cssClass="field"   readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="customers"> Customers </label>
					<form:input path="customers" cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="juridiction"> Jurisdiction </label>
					<form:input path="jurisdiction" cssClass="field" id="jurisdiction"  readonly="${readValue}" />
				</div>
  			</div>
  		</div>	
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="businessType"> Business Type </label>
					<form:input path="bustype" cssClass="field"  readonly="${readValue}" />
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="comRef"> Company Referance </label>
					<form:input path="companyreference" cssClass="field" id="companyreference"  readonly="${readValue}" />
				</div>
  			</div>
  		</div>
		<div class="divider mb15"></div>
  
  <div class="row-fluid">
  <div class="span3">
      <div class="control-group">
     <label class="control-label" for="accountNumber"> Account Number *</label>
     <form:input path="companyAccountDetail.accountNumber" cssClass="field" id="accountNumber"  readonly="${readValue}"/>
    </div>
     </div>
     <div class="span3">
      <div class="control-group">
     <label class="control-label" for="accountName"> Account Name *</label>
     <form:input path="companyAccountDetail.accountName" cssClass="field" id="accountName"  readonly="${readValue}"/>
    </div>
     </div>
     <div class="span3">
      <div class="control-group">
     <label class="control-label" for="sortCode"> Sort Code *</label>
     <form:input path="companyAccountDetail.sortCode" cssClass="field" id="sortCode"  readonly="${readValue}"/>
    </div>
     </div>
     
     
    </div>
  <div class="row-fluid">
     <div class="span3">
      <div class="control-group">
     <label class="control-label" for="iban"> IBAN *</label>
     <form:input path="companyAccountDetail.iban" cssClass="field" id="iban"  readonly="${readValue}" />
    </div>
     </div>
     <div class="span3">
      <div class="control-group">
     <label class="control-label" for="bankName"> Bank Name *</label>
     <form:input path="companyAccountDetail.bankName" cssClass="field" id="bankName"  readonly="${readValue}" />
    </div>
     </div>
    </div>
	 

			<div class="actionContainer text-left">
				<c:choose>
					<c:when test="${companyModel.id !=null && companyModel.id !=0}">
			        	<c:if test="${userType != 'Primary Investor Admin' }">
						<input type="button" value="Update" class="btn btnBgBuSm"
							data-url="${createCompanyURL}" id="cmpUpdate" />
							
						<input type="button" value="Delete" class="btn btnBgRedSm"
							onclick="deleteCompany()" />
							</c:if>
					</c:when>
					<c:otherwise>
						<input type="button" value="Add Company" class="btn btnBgBuSm"
							data-url="${createCompanyURL}" id="cmpAdd" />
							<input type="button" value="Go Back" class="btn btnBgBuSm"
						data-url="${companyListURL}" id="cmpback" />
					</c:otherwise>

				</c:choose>


				

				
			</div>
	</div>

</form:form>