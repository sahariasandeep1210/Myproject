<form:form commandName="companyModel" method="post"
	action="${createCompanyURL}" id="createCompany" name="companyDetail">
	<input type="hidden" value="${deleteCompanyURL}" id="deleteURL">
	<!-- <div class="row-fluid">
		<div class="span12"
			style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
			<div class="span4">
				<h4>Add Company Information</h4>
			</div>
		</div>
	</div> -->


	<div class="row-fluid" id="fetchCmpInfo">
		<div class="span6">
			<label class="span6">Company Number:</label>
			<%-- <form:input path="name" name="" cssClass="span6" id="companyName" /> --%>
			<input type="text" id="companyNumber" name="companyNumber"
				class="span6" />

		</div>
		<div class="span4">
			<input type="hidden" value="${fetchCompanyDetails}" id="fetchURL" />
			<input type="button" value="Find Company Details"
				class="span6 btn btn-primary" id="findCompany" />

		</div>

	</div>


	<div id="companyDetails">
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Name:<span class="requiredStar">*</span></label>
				<input type="hidden" name="id" value="${companyModel.id}"
					id="compId" />
				<form:input path="name" name="" cssClass="span6" id="companyName" />


			</div>
			<div class="span6">
				<label class="span6">Alternate Name:</label>
				<form:input path="altname" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Registration Number:<span
					class="requiredStar">*</span></label>
				<form:input path="regNumber" cssClass="span6" id="registrationNo" />

			</div>
			<div class="span6">
				<label class="span6">Date Established:<span
					class="requiredStar">*</span></label>
				<form:input path="dateestablished" cssClass="span5"
					id="dateestablished" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Address Information</label>
				<%-- <form:input path="addRegistered" cssClass="span6" id="cmpAddress"/> --%>
			</div>

			<%-- <div class="span6">
				<label class="span6">Address Trading:</label>
				<form:input path="addTrading" cssClass="span6" />
			</div> --%>

		</div>

		<div class="row-fluid">
			<div class="span6">
				<div class="span6">
					<form:input path="address.addressLine1" cssClass="span9"
						id="address1" placeholder="Address Line 1*" />
				</div>
				<div class="span6">
					<form:input path="address.addressLine2" cssClass="span9"
						id="address2" placeholder="Address Line 2" />
				</div>
			</div>
			<div class="span6">
				<form:input path="address.locality" cssClass="span4" id="locality"
					placeholder="Locality" />
			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="span6">
					<form:input path="address.region" cssClass="span9" id="region"
						placeholder="Region*" />
				</div>
				<div class="span6">
					<form:input path="address.country" cssClass="span9" id="country"
						placeholder="country*" />
				</div>
			</div>

			<div class="span6">
				<form:input path="address.postalCode" cssClass="span4"
					id="postalCode" placeholder="Postal Code*" />
			</div>

		</div>
		<div class="row-fluid">
			<div class="span12"></div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Telephone No:<span class="requiredStar">*</span></label>
				<form:input path="telnumber" cssClass="span6" id="telNo" />

			</div>
			<div class="span6">
				<label class="span6">URL:</label>
				<form:input path="website" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Organisation Type:</label>
				<form:select path="orgType" items="${orgTypeMap}" class="dropdown"
					id="orgType" placeholder="Organisation Type" />
			</div>


			<div class="span6">
				<label class="span6">Company Type:</label>
				<c:choose>
					<c:when test="${permissionChecker.isOmniadmin()}">
						<form:select path="companyType" items="${companyTypeMap}"
							class="dropdown" id="companyType" placeholder="CompanyType Type" />
					</c:when>
					<c:otherwise>
						${companyModel.companyType}
					</c:otherwise>
				</c:choose>
				

			</div>



		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Directors:</label>
				<form:input path="directors" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Shareholders:</label>
				<form:input path="shareholders" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Customers:</label>
				<form:input path="customers" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Jurisdiction:</label>
				<form:input path="jurisdiction" cssClass="span6" id="jurisdiction" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Business type:</label>
				<form:input path="bustype" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Company Reference :</label>
				<form:input path="companyreference" cssClass="span6"
					id="companyreference" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<c:choose>
					<c:when test="${companyModel.id !=null && companyModel.id !=0}">
						<input type="button" value="Update" class="btn btn-primary"
							data-url="${createCompanyURL}" id="cmpUpdate" />
						<input type="button" value="Delete" class="btn btn-danger"
							onclick="deleteCompany()" />
					</c:when>
					<c:otherwise>
						<input type="button" value="Add Company" class="btn btn-primary"
							data-url="${createCompanyURL}" id="cmpAdd" />
							<input type="button" value="Go Back" class="btn btn-primary"
						data-url="${companyListURL}" id="cmpback" />
					</c:otherwise>

				</c:choose>



				

				
			</div>
		</div>
	</div>

</form:form>