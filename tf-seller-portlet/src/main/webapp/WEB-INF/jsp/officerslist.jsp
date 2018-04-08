<%@include file="init.jsp"%>



					<c:choose>
						<c:when test="${fn:length(companyModel.officers) gt 0}">
							<p class="mb15" >Officers information was updated on ${officersUpdateDate}.Please click on 'Update Officers information' to update officers information.</p>
						</c:when>
						<c:otherwise>
							<p class="mb15">Officers information Not Found! Please click on 'Fetch Officers Information' button to add officers to this company.</p>
						</c:otherwise>
					</c:choose>
					
							

						
<div class="actionContainer text-left">
	<c:if test="${fn:length(companyModel.officers) eq 0}">
		
				<h5 style="float: right !important;">
					<input type="button" value="Fetch Officers Information"
							class="btn btnBgGreenSm" data-url="${fetchOfficers}"
							id="fetchOfficers" />
				</h5>
		
	</c:if>
</div>

<div class="customTableContainer">
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
						<c:when test="${fn:length(companyModel.officers) gt 0}">
							<c:forEach items="${companyModel.officers}" var="officer">
								<tr>
									<td>${officer.name}</td>
									<td>${officer.officerRole}</td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${officer.appointedDate}" /></td>
									<td>${officer.nationality}</td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${officer.resignedDate}" /></td>
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