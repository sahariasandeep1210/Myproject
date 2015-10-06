<%@include file="init.jsp"%>


						
<div class="row-fluid">
	
	<div class="span12">
		<div class="span12">
			<h5 style="float: right !important;">
				<input type="button" value="Fetch Officers Information"
						class="btn btn-primary" data-url="${fetchOfficers}"
						id="fetchOfficers" />
			</h5>
		</div>
	</div>
</div>

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
					<c:choose>
						<c:when test="${fn:length(officers) gt 0}">
							<c:forEach items="${officers}" var="officer">
								<tr>
									<td>${officer.name}</td>
									<td>${officer.officer_role}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${officer.appointed_on}" /></td>
									<td>${officer.nationality}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${officer.resigned_on}" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" align="center" style="text-align: center;"> No Officers found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>