<%@include file="init.jsp"%>



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

<div class="container-fluid">
	<form:form commandName="userModel" method="post"
		action="${createUserURL}" id="createUser" autocomplete="off" name="userDetail">
		<input type="hidden" value="${deleteUserURL}" id="deleteURL">

		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4"></div>
				<div class="span4">
					<h4>Add User Information</h4>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Title:</label>
				<input type="hidden" name="id" value="${userModel.id}"/>
				<form:input path="title"  cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Username:</label>
				<form:input path="username" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">First Name:</label>
				<form:input path="firstName" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Middle Name:</label>
				<form:input path="middleName" cssClass="span6" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Last Name:</label>
				<form:input path="lastName" cssClass="span6" />
			</div>
			
			<div class="span6">
				<label class="span6">Email:</label>
				<form:input path="email" cssClass="span6" />
			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Telephone No:</label>
				<form:input path="mobile" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Level:</label>
				<form:input path="level" cssClass="span6" />
			</div>			
		</div>
		
		<div class="row-fluid">
			<div class="span6">
			<c:choose>
				<c:when test="${userModel.id !=null && userModel.id !=0}">
					<input type="button" value="Update"		 			 class="btn btn-primary"  data-url="${createUserURL}" id="userUpdate" />
					<input type="button" value="Delete"		 class="btn btn-danger"   onclick="deleteCompany()" />
				</c:when>
				<c:otherwise>
					<input type="button" value="Add User" 			 class="btn btn-primary"  data-url="${createUserURL}" id="userAdd" />
				</c:otherwise>
			
			</c:choose>
				
				
				
				<input type="button" value="Go Back" 			 class="btn btn-primary"  data-url="${companyListURL}"	id="cmpbackBtn"  />
				<%-- <button formaction="${defaultRender}" class="btn btn-primary"><i class="fa fa-reply fa-1"></i>  Go Back</button>  --%>
			</div>
		</div>


	</form:form>
</div>