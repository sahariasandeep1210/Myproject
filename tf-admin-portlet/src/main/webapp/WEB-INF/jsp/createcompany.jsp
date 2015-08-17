<%@include file="init.jsp"%>
<portlet:actionURL var="createCompanyURL">
	<portlet:param name="action" value="createCompany" />
</portlet:actionURL>

<portlet:actionURL var="regCompanyURL">
	<portlet:param name="action" value="registerCompany" />
</portlet:actionURL>

<portlet:renderURL var="createUserURL">
	<portlet:param name="render" value="createUser" />
</portlet:renderURL>

<portlet:actionURL var="deleteCompanyURL">
	<portlet:param name="action" value="deleteCompany" />
</portlet:actionURL>
<portlet:renderURL var="companyListURL">
</portlet:renderURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>


<div class="container-fluid">
	<form:form commandName="registration" method="post"
		action="${createCompanyURL}" id="createCompany" autocomplete="off"
		name="companyDetail">
		<input type="hidden" value="${deleteCompanyURL}" id="deleteURL">
	<c:choose>
		<c:when test="${currentUser.emailAddress == 'default@liferay.com'}">
			<div class="row-fluid">
				<div class="span12" style="padding-bottom: 30px;">
					<div class="span4"><h5>Company Information</h5></div>					
				</div>
			</div>
			
		</c:when>
		<c:otherwise>
			<div class="row-fluid">
				<div class="span12" style="padding-bottom: 30px;">
					<div class="span4"></div>
					<div class="span4">
						<h4>Add Company Information</h4>
					</div>
				</div>
			</div>
		</c:otherwise>	
	</c:choose>
	
		

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Name:</label> <input type="hidden" name="id" value="${registration.company.id}" />
				<form:input path="company.name" name="" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Alternate Name:</label>
				<form:input path="company.altname" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Registration Number:</label>
				<form:input path="company.regNumber" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Date Established:</label>
				<form:input path="company.dateestablished" cssClass="span5"
					id="dateestablished" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Address Registered:</label>
				<form:input path="company.addRegistered" cssClass="span6" />
			</div>

			<div class="span6">
				<label class="span6">Address Trading:</label>
				<form:input path="company.addTrading" cssClass="span6" />
			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Telephone No:</label>
				<form:input path="company.telnumber" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">URL:</label>
				<form:input path="company.website" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Organisation Type:</label>
				<form:select path="company.orgType" items="${orgTypeMap}" class="dropdown"
					id="orgType" placeholder="Organisation Type" />
			</div>

			<c:choose>
				<c:when test="${currentUser.emailAddress == 'default@liferay.com'}">
					<div class="span6">
						<label class="span6">Company Type:</label>
						<form:input path="company.companyType" cssClass="span6"   readonly="true"/>
					</div>
				</c:when>
				<c:otherwise>
					<div class="span6">
						<label class="span6">Company Type:</label>
						<form:select path="company.companyType" items="${companyTypeMap}"
							class="dropdown" id="companyType" placeholder="CompanyType Type" />

					</div>
				</c:otherwise>
			</c:choose>


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
		<c:if test="${currentUser.emailAddress == 'default@liferay.com'}">
			<hr>
			<div class="row-fluid">
				<div class="span12" style="padding-bottom: 30px;">
					<div class="span4"><h5>User Information</h5></div>					
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Title:</label> 
					<form:input path="user.title" cssClass="span6" />

				</div>
				<div class="span6">
					<label class="span6">Username:</label>
					<form:input path="user.username" cssClass="span6" />
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">First Name:</label>
					<form:input path="user.firstName" cssClass="span6" />

				</div>
				<div class="span6">
					<label class="span6">Middle Name:</label>
					<form:input path="user.middleName" cssClass="span6" />

				</div>

			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Last Name:</label>
					<form:input path="user.lastName" cssClass="span6" />
				</div>

				<div class="span6">
					<label class="span6">Email:</label>
					<form:input path="user.email" cssClass="span6" />
				</div>

			</div>
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Telephone No:</label>
					<form:input path="user.mobile" cssClass="span6" />

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
			<div class="row-fluid" <c:if test="${currentUser.emailAddress == 'default@liferay.com'}"> style="display:none;"</c:if>>
				<div class="span6">
					<label class="span6">User Type:</label>
					<form:select path="user.type" items="${userTypesMap}" class="dropdown"
						id="type" placeholder="User Type" />
				</div>
			</div>
		</c:if>
		<div class="row-fluid">
			<div class="span6">
				<c:choose>
					<c:when test="${registration.company.id !=null && registration.company.id !=0}">
						<input type="button" value="Update" class="btn btn-primary"
							data-url="${createCompanyURL}" id="cmpUpdate" />
						<input type="button" value="Delete" class="btn btn-danger"
							onclick="deleteCompany()" />
					</c:when>
					<c:when test="${currentUser.emailAddress == 'default@liferay.com'}">
						<input type="button" value="Register" class="btn btn-primary"
							data-url="${regCompanyURL}" id="cmpAdd" />
					</c:when>
					<c:otherwise>
						<input type="button" value="Add Company" class="btn btn-primary"
							data-url="${createCompanyURL}" id="cmpAdd" />
					</c:otherwise>

				</c:choose>



				<input type="button" value="Go Back" class="btn btn-primary"
					data-url="${companyListURL}" id="cmpback" />
				<%-- <button formaction="${defaultRender}" class="btn btn-primary"><i class="fa fa-reply fa-1"></i>  Go Back</button>  --%>
			</div>
		</div>


	</form:form>
	<c:if test="${registration.company.id !=null && registration.company.id !=0}">
		<div class="row-fluid">
			<div class="span6">
				<h4>Manage Users</h4>
			</div>
			<div class="span6">
				<div class="span12">
					<h4 style="float: right !important;">
						<a href="${createUserURL}&companyID=${registration.company.id}"
							style="color: #295780; font-weight: bold;"><i
							class="fa fa fa-plus"></i> Add User</a>
					</h4>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Username</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Level</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr
							onclick="window.location.href='${createUserURL}&userID=${user.id}'">
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.username}</td>
							<td>${user.email}</td>
							<td>${user.mobile}</td>
							<td>${user.level}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
</div>

<div id="deleteCompany" title="Are you sure you want to delete?">
	<div class="message">
		Are you sure you want to delete this Company? <br /> Press 'Continue'
		to delete or 'Cancel' to go back
	</div>
</div>

