<%@include file="init.jsp"%>

<portlet:actionURL var="deleteUserURL">
	<portlet:param name="render" value="deleteUser" />
</portlet:actionURL>

	<div class="row-fluid">
	  		<div class="span12 text-right">
	  			<div class="actionContainer noBorder pt0">
	  				<a href="${createUserURL}&companyID=${companyModel.id}" class="btn btnBgGreenSm"><i
					class="fa fa fa-plus"></i> Add User</a>
	  			</div>
	  			
	  		</div>
	  	</div>

<div class="customTableContainer">

	<table class="table table-hover tablesorter table-bordered">
		<thead>
			<tr>
				<th>Firstname</th>
				<th>Lastname</th>
				<th>Username</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Level</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(users) gt 0}">
					<c:forEach items="${users}" var="user">
						<tr>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.firstName}</td>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.lastName}</td>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.username}</td>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.email}</td>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.mobile}</td>
							<td onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">${user.type}</td>
							<td>
							<c:if test="${user.liferayUserId ne  loggedUserLiferaryId}">
							<input type="button" value="Delete" class="btn btnBgRedSm"   onclick="window.location.href='${deleteUserURL}&userLiferayId=${user.liferayUserId}&userId=${user.id}'" />
							 </c:if>
							</td>
						   
						</tr>
					</c:forEach>
			</c:when>
			<c:otherwise>
							<tr>
								<td colspan="6" align="center" style="text-align: center;"> No User found!</td>
							</tr>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>