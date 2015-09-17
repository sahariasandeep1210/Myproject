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

<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>


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
				<label class="span6">Address Registered:<span class="requiredStar">*</span></label>
				<form:input path="company.addRegistered" cssClass="span6" id="cmpAddress" />
			</div>

			<div class="span6">
				<label class="span6">Address Trading:</label>
				<form:input path="company.addTrading" cssClass="span6" />
			</div>

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

			<div class="span6" style="display: none;">
				<label class="span6">Company Type:</label>
				<form:input path="company.companyType" cssClass="span6" />
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
				<form:input path="company.jurisdiction" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Business type:</label>
				<form:input path="company.bustype" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Company Reference :</label>
				<form:input path="company.companyreference" cssClass="span6" />
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



