<%@include file="init.jsp"%>


<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>
<portlet:actionURL var="createUserURL">
	<portlet:param name="action" value="createUser" />
</portlet:actionURL>

<portlet:actionURL var="deleteUserURL">
	<portlet:param name="action" value="deleteCompany" />
</portlet:actionURL>
<portlet:renderURL var="companyListURL">
</portlet:renderURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>



<portlet:resourceURL id="fetchOfficerInfo" var="fetchOfficerInfoURL" ></portlet:resourceURL> 

<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>
<liferay-ui:error 	key="error-user-email">
	<liferay-ui:message key="user.email.error"  arguments="${userModel.email}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-user-screenname">
	<liferay-ui:message key="user.screenname.error"  arguments="${userModel.username}"></liferay-ui:message>
</liferay-ui:error>

<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 

<div class="container-fluid">
	<form:form commandName="userModel" method="post"
		action="${createUserURL}" id="createUser"  name="userDetail">
		<input type="hidden" value="${deleteUserURL}" id="deleteURL"> 
		<input type="hidden" value="${companyID}" id="companyID" name="companyID">
		<input type="hidden" value="${userModel.liferayUserId}" id="liferayUserId" name="liferayUserId">
		<div class="row-fluid">
			<div class="span12">
				<div class="span4">
					<h4>Add User Information</h4>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12"
				style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
				<div class="span12">
				<h6>Create new user by entering all the details below or alternatively  you can select officer to make him/her user within a company  </h6>
				</div>
			</div>
		</div>
		
		<c:if test="${userModel.id ==null || userModel.id ==0}">
			<div class="row-fluid">
				<div class="span6">
					<label class="span6">Officer:</label> <select id="officer"
						name="officer" data-url="${fetchOfficerInfoURL}">
						<option value="">--- Select ---</option>
						<c:forEach var="officer" items="${officers}">
							<option value="${officer.id}" <c:if test="${officer.iduser !=null && officer.iduser !=0}">disabled style="background-color: #4786BC;color: white;" </c:if>>${officer.name}</option>
						</c:forEach>

					</select>
				</div>
			</div>
		</c:if>


		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Title:<span class="requiredStar">*</span></label>
				<input type="hidden" name="id" value="${userModel.id}"/>
				<form:input path="title"  cssClass="span6" id="title"/>

			</div>
			<div class="span6">
				<label class="span6">Username:<span class="requiredStar">*</span></label>
				<form:input path="username" cssClass="span6"  id="username" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">First Name:<span class="requiredStar">*</span></label>
				<form:input path="firstName" cssClass="span6" id="firstname"/>

			</div>
			<div class="span6">
				<label class="span6">Middle Name:</label>
				<form:input path="middleName" cssClass="span6" id="middleName" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Last Name:<span class="requiredStar">*</span></label>
				<form:input path="lastName" cssClass="span6"  id="lastname"/>
			</div>
			
			<div class="span6">
				<label class="span6">Email:<span class="requiredStar">*</span></label>
				<form:input path="email" cssClass="span6"  id="email" />
			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Telephone No:<span class="requiredStar">*</span></label>
				<form:input path="mobile" cssClass="span6" id="userTelNo" />

			</div>
			<div class="span6">
				<label class="span6">Occupation:</label>
				<form:input path="level" cssClass="span6" id="occupation"/>
			</div>			
		</div>

		<div class="row-fluid">
			
			<div class="span6">
				<label class="span6">Officer Role</label>
				<!-- <div class="span6"> -->
					<select id="companyDirector" name="companyDirector" class="span6" >
						<option value="other">Other</option>
						<option value="director">Director</option>
						<option value="secretary">Secretary</option>												
					</select>
					<%-- <label class="span3"> 
						<form:radiobutton path="companyDirector" value="Yes" id="yesOption" />Yes
					</label> 
					<label class="span3"> 
						<form:radiobutton  path="companyDirector" value="No" id="noOption" />No
					</label> --%>
			<!-- 	</div> -->
			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span6">			
				<label class="span6">User Type:</label>
				<form:select path="type" items="${userTypesMap}" class="dropdown"  id="type"  placeholder="User Type"  />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
			<c:choose>
				<c:when test="${userModel.id !=null && userModel.id !=0}">
					<input type="button" value="Update"		 			 class="btn btn-primary"  data-url="${createUserURL}" id="userUpdate" />
					<input type="button" value="Delete"		 class="btn btn-danger"   onclick="deleteCompany()" />
					<input type="button" value="Go Back" 			 class="btn btn-primary"  data-url="${createURL}&companyID=${userModel.company.id}"	id="cmpbackBtn"  />
				</c:when>
				<c:otherwise>
					<input type="button" value="Add User" 			 class="btn btn-primary"  data-url="${createUserURL}" id="userAdd" />
					<input type="button" value="Go Back" 			 class="btn btn-primary"  data-url="${createURL}&companyID=${companyID}"	id="cmpbackBtn"  />
				</c:otherwise>
			
			</c:choose>
				
				
				
				
				<%-- <button formaction="${defaultRender}" class="btn btn-primary"><i class="fa fa-reply fa-1"></i>  Go Back</button>  --%>
			</div>
		</div>


	</form:form>
</div>