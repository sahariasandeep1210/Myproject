<%@include file="init.jsp"%>

<div class="row-fluid">
	 <div class="span6">
		<!-- <h4>Manage Users</h4> -->
	</div>
	<div class="span6">
		<div class="span12">
			<h5 style="float: right !important;">
				<a href="${createUserURL}&companyID=${companyModel.id}"
					style="color: #295780; font-weight: bold;"><i
					class="fa fa fa-plus"></i> Add User</a>
			</h5>
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
			<c:choose>
				<c:when test="${fn:length(users) gt 0}">
					<c:forEach items="${users}" var="user">
						<tr
							onclick="window.location.href='${createUserURL}&userID=${user.id}&companyID=${companyModel.id}'">
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.username}</td>
							<td>${user.email}</td>
							<td>${user.mobile}</td>
							<td>${user.level}</td>
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