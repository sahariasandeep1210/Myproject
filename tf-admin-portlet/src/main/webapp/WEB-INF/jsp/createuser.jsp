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

<div  id="errorMsg"> </div>
<liferay-ui:error 	key="error-user-email">
	<liferay-ui:message key="user.email.error"  arguments="${userModel.email}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-user-screenname">
	<liferay-ui:message key="user.screenname.error"  arguments="${userModel.username}"></liferay-ui:message>
</liferay-ui:error>

<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 

<div class="tab-content">
	<form:form commandName="userModel" method="post"
		action="${createUserURL}" id="createUser"  name="userDetail">
		<input type="hidden" value="${deleteUserURL}" id="deleteURL"> 
		<input type="hidden" value="${companyID}" id="companyID" name="companyID">
		<input type="hidden" value="${userModel.liferayUserId}" id="liferayUserId" name="liferayUserId">
		<div class="row-fluid">
			<div class="span12">
					<h2>
						<c:choose>
							<c:when test="${userModel.id ==null || userModel.id ==0}">
								Add
							</c:when>
							<c:otherwise>
								Update
							</c:otherwise>						
						</c:choose>					
					 User Information</h2>
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
				<div class="span3">
					<div class="control-group">
					<label class="control-label" for="orgType">Officer:</label>	
					<select id="officer" name="officer" data-url="${fetchOfficerInfoURL}" class="aui-field-select">
						<option value="">--- Select ---</option>
						<c:forEach var="officer" items="${officers}">
							<option value="${officer.id}" <c:if test="${officer.iduser !=null && officer.iduser !=0}">disabled style="background-color: #4786BC;color: white;" </c:if>>${officer.name}</option>
						</c:forEach>

					</select>
					</div>
				</div>
			</div>
		</c:if>


		<div class="row-fluid">
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Title* </label>
					<input type="hidden" name="id" value="${userModel.id}"/>
					<form:input path="title"  cssClass="field" id="title"/>
				</div>

			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Username:<span class="requiredStar">*</span></label>
					<form:input path="username" cssClass="field"  id="username" />
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Email:<span class="requiredStar">*</span></label>
					<form:input path="email" cssClass="field"  id="email" />
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3">
				<div class="control-group">
					<label class="control-label">First Name:<span class="requiredStar">*</span></label>
					<form:input path="firstName" cssClass="field" id="firstname"/>
				</div>

			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Middle Name:</label>
					<form:input path="middleName" cssClass="field" id="middleName" />
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Last Name:<span class="requiredStar">*</span></label>
					<form:input path="lastName" cssClass="field"  id="lastname"/>
				</div>
			</div>
		</div>
	
		<div class="row-fluid">
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Telephone No:<span class="requiredStar">*</span> <i class="icon-info-sign tooltipPhone" data-toggle="tooltip" title="Ex. For UK 44 12345-12345" ></i></label>
					<form:input path="mobile" cssClass="field" id="userTelNo" />
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Occupation:</label>
					<form:input path="level" cssClass="field" id="occupation"/>
				</div>
			</div>
			
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Officer Role</label>
					<select id="companyDirector" name="companyDirector" class="aui-field-select" >
						<option value="other">Other</option>
						<option value="director">Director</option>
						<option value="secretary">Secretary</option>												
					</select>
				</div>				
			</div>			
		</div>
			
		<div class="row-fluid">
			<div class="span3">		
				<div class="control-group">	
				<label class="control-label">User Type:</label>
				<form:select path="type" items="${userTypesMap}" class="aui-field-select"  id="type"  placeholder="User Type"  />
				</div>
			</div>
		</div>

		<div class="actionContainer text-left">
			<c:choose>
				<c:when test="${userModel.id !=null && userModel.id !=0}">
					<input type="button" value="Update"		 			class="btn btnBgBuSm"  data-url="${createUserURL}" id="userUpdate" />
					<input type="button" value="Delete"		 			class="btn btnBgRedSm"   onclick="deleteCompany()" />
					<input type="button" value="Go Back" 			 	class="btn btnBgBuSm"  data-url="${createURL}&companyID=${userModel.company.id}"	id="cmpbackBtn"  />
				</c:when>
				<c:otherwise>
					<input type="button" value="Add User" 			 class="btn btnBgGreenSm"  data-url="${createUserURL}" id="userAdd" />
					<input type="button" value="Go Back" 			 class="btn btnBgBuSm"  data-url="${createURL}&companyID=${companyID}"	id="cmpbackBtn"  />
				</c:otherwise>
			
			</c:choose>
				
				
				
				
		</div>


	</form:form>
</div>