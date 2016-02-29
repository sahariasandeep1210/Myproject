<%@include file="init.jsp"%>


<portlet:actionURL var="regCompanyURL">
	<portlet:param name="action" value="registerCompany" />
</portlet:actionURL>

<portlet:actionURL var="continueURL">
	<portlet:param name="action" value="regCompanyInfo" />
</portlet:actionURL>

<portlet:actionURL var="homePageURL">
	<portlet:param name="action" value="homePage" />
</portlet:actionURL>

<portlet:resourceURL id="fetchCompanyDetails" var="fetchCompanyDetails" ></portlet:resourceURL> 

<div class="" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>

<liferay-ui:error 	key="error-user-email">
	<liferay-ui:message key="user.email.error"  arguments="${registration.user.email}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-user-screenname">
	<liferay-ui:message key="user.screenname.error"  arguments="${registration.user.username}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-company-registration">
	<liferay-ui:message key="company.duplicate.registration.no"  arguments="${registration.company.regNumber}"></liferay-ui:message>
</liferay-ui:error> 			
<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 


<div class="container-fluid">
	<form:form commandName="registration" method="post"
		action="${regCompanyURL}" id="createCompany" name="companyDetail">
		<input type="hidden" value="${currentScreen}" name="currentScreen" id="currScreen"> 
		
		  <div class="span6 guide">
            <div class="page" id="Company"><span class="number">1</span><span class="name"></span></div>
            <div class="page" id="User"><span class="number">2</span><span class="name"></span></div>
        </div>
        <div class="row nocol">         
			<div class="requiredNote" id="requiredFieldsNote"><span class="requiredStar">*</span>Required Fields</div>
		</div>
<div id="companyDiv">
		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4">
					<h5>Company Information</h5>
				</div>
			</div>
		</div>
			<div class="row-fluid" id="fetchCmpInfo">
			<div class="span6">
				<label class="span6">Company Number:</label>
				<%-- <form:input path="name" name="" cssClass="span6" id="companyName" /> --%>
				<input type="text" id="companyNumber" name="companyNumber"
					class="span6" />
	
			</div>
			<div class="span4">
				<input type="hidden" value="${fetchCompanyDetails}" id="fetchURL" />
				<input type="button" value="Find Company Details"
					class="span6 btn btn-primary" id="findCompany" />
	
			</div>
	
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Name:<span class="requiredStar">*</span></label> <input type="hidden" name="id"
					value="${registration.company.id}" />
				<form:input path="company.name" name="" cssClass="span6"  id="companyName"/>

			</div>
			<div class="span6">
				<label class="span6">Alternate Name:</label>
				<form:input path="company.altname" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Registration Number:<span class="requiredStar">*</span></label>
				<form:input path="company.regNumber" cssClass="span6" id="registrationNo" />

			</div>
			<div class="span6">
				<label class="span6">Date Established:<span class="requiredStar">*</span></label>
				<form:input path="company.dateestablished" cssClass="span5"
					id="dateestablished" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Address Information</label>
				<%-- <form:input path="addRegistered" cssClass="span6" id="cmpAddress"/> --%>
			</div>

			<%-- <div class="span6">
				<label class="span6">Address Trading:</label>
				<form:input path="addTrading" cssClass="span6" />
			</div> --%>

		</div>
		<%-- <div class="row-fluid">
			<div class="span6">
				<label class="span6">Address Registered:<span class="requiredStar">*</span></label>
				<form:input path="company.addRegistered" cssClass="span6" id="cmpAddress" />
			</div>

			<div class="span6">
				<label class="span6">Address Trading:</label>
				<form:input path="company.addTrading" cssClass="span6" />
			</div>

		</div> --%>
		<div class="row-fluid">
			<div class="span6">
				<div class="span6">
					<form:input path="company.address.addressLine1" cssClass="span9"
						id="address1" placeholder="Address Line 1*" />
				</div>
				<div class="span6">
					<form:input path="company.address.addressLine2" cssClass="span9"
						id="address2" placeholder="Address Line 2" />
				</div>
			</div>
			<div class="span6">
				<form:input path="company.address.locality" cssClass="span4" id="locality"
					placeholder="Locality" />
			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="span6">
					<form:input path="company.address.region" cssClass="span9" id="region"
						placeholder="Region*" />
				</div>
				<div class="span6">
					<form:input path="company.address.country" cssClass="span9" id="country"
						placeholder="country*" />
				</div>
			</div>

			<div class="span6">
				<form:input path="company.address.postalCode" cssClass="span4"
					id="postalCode" placeholder="Postal Code*" />
			</div>

		</div>
		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Telephone No:<span class="requiredStar">*</span></label>
				<form:input path="company.telnumber" cssClass="span6"  id="telNo"/>

			</div>
			<div class="span6">
				<label class="span6">URL:</label>
				<form:input path="company.website" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Organisation Type:</label>
				<form:select path="company.orgType" items="${orgTypeMap}"
					class="dropdown" id="orgType" placeholder="Organisation Type" />
			</div>

			<div class="span6">
				<label class="span6">Company Type:</label>
				<form:select path="company.companyType" items="${companyTypeMap}"
					class="span6" id="companyType" placeholder="CompanyType Type"/>
				
			</div>



		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Directors:</label>
				<form:input path="company.directors" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Shareholders:</label>
				<form:input path="company.shareholders" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Customers:</label>
				<form:input path="company.customers" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Jurisdiction:</label>
				<form:input path="company.jurisdiction" cssClass="span6" id="jurisdiction" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Business type:</label>
				<form:input path="company.bustype" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Company Reference :</label>
				<form:input path="company.companyreference" cssClass="span6"  id="companyreference"/>
			</div>
		</div>
</div>
<div id="userDiv">
			<div class="row-fluid">
				<div class="span12" style="padding-bottom: 30px;">
					<div class="span4">
						<h5>User Information</h5>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Title:<span class="requiredStar">*</span></label>
					<form:input path="user.title" cssClass="span6"  id="title"/>

				</div>
				<div class="span6">
					<label class="span6">Username:<span class="requiredStar">*</span></label>
					<form:input path="user.username" cssClass="span6"  id="username"/>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">First Name:<span class="requiredStar">*</span></label>
					<form:input path="user.firstName" cssClass="span6"  id="firstname"/>

				</div>
				<div class="span6">
					<label class="span6">Middle Name:</label>
					<form:input path="user.middleName" cssClass="span6"  />

				</div>

			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Last Name:<span class="requiredStar">*</span></label>
					<form:input path="user.lastName" cssClass="span6" id="lastname"/>
				</div>

				<div class="span6">
					<label class="span6">Email:<span class="requiredStar">*</span></label>
					<form:input path="user.email" cssClass="span6" id="email"/>
				</div>

			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Telephone No:<span class="requiredStar">*</span></label>
					<form:input path="user.mobile" cssClass="span6"  id="userTelNo"/>

				</div>
				<div class="span6">
					<label class="span6">Level:</label>
					<form:input path="user.level" cssClass="span6" />
				</div>
			</div>

			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Company Director:</label>
					<div class="span6">
						<label class="span3"> <form:radiobutton
								path="user.companyDirector" value="Yes" id="yesOption" />Yes
						</label> <label class="span3"> <form:radiobutton
								path="user.companyDirector" value="No" id="noOption" />No
						</label>

					</div>

				</div>

			</div>
			<div class="row-fluid" style="display:none;">
				<div class="span6">
					<label class="span6">User Type:</label>
					<form:input path="user.type" cssClass="span6" />					
				</div>
			</div>
</div>
		<div class="row-fluid">
			<div class="span6">
				<c:choose>
					<c:when
						test="${currentScreen =='Company'}">
							<input type="button" value="Continue" class="btn btn-primary" data-url="${continueURL}" id="continue" />							
					</c:when>
					<%-- <c:when test="${currentUser.emailAddress == 'default@liferay.com'}">
						<input type="button" value="Register" class="btn btn-primary"
							data-url="${regCompanyURL}" id="cmpAdd" />
					</c:when> --%>
					<c:otherwise>
						<input type="button" value="Register" class="btn btn-primary" data-url="${regCompanyURL}" id="registerSeller" />
					</c:otherwise>
				</c:choose>
				<input type="button" value="Go Back" class="btn btn-primary" data-url="${homePageURL}" id="homePage" />

			</div>
		</div>


	</form:form>

</div>



