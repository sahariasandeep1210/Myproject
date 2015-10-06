<%@include file="init.jsp"%>

<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Officer Role</th>
						<th>Appointed Date</th>
						<th>Nationality</th>
						<th>Resigned on</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${officers}" var="officer">
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
				</tbody>
			</table>
		</div>