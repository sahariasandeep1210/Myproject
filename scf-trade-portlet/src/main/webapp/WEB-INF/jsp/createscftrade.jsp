<%@include file="init.jsp"%>


<div class="container-fluid">
	<form:form commandName="tradeModel" method="post"
		action="${createTradeURL}" id="createTrade" autocomplete="off"
		name="TradeDetail">
		<input type="hidden" value="${deleteTradeURL}" id="deleteURL">	
			<div class="row-fluid">
				<div class="span12" style="padding-bottom: 30px;">
					<div class="span4"></div>
					<div class="span4">
						<h4>Add Trade Information</h4>
					</div>
				</div>
			</div>
	
		

		<div class="row-fluid">
			<div class="span6">
				<form:checkbox path="scfTrade" value="1" cssClass="span3" /> <label class="span3">SCF Trade</label>			

			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Duration:</label>
				<form:input path="duration" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Closing Date:</label>
				<form:input path="closingDate" cssClass="span5"	id="closingDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Opening Date:</label>
				<form:input path="openingDate" cssClass="span5"	id="openingDate" />

			</div>

			<div class="span6">
				<label class="span6">Investor Payment Date:</label>
				<form:input path="investorPaymentDate" cssClass="span5"	id="investorPaymentDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Payment Date:</label>
				<form:input path="SellerPaymentDate" cssClass="span5"	id="SellerPaymentDate" />

			</div>
			<div class="span6">
				<label class="span6">Trade Amount:</label>
				<form:input path="website" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Company Name:</label>
				<form:select path="companyId" items="${companyIdMap}" class="dropdown"
					id="companyId" placeholder="Company Name" />
			</div>


			<div class="span6">
				<label class="span6">Company Type:</label>
				<form:select path="companyType" items="${companyTypeMap}"
					class="dropdown" id="companyType" placeholder="CompanyType Type" />

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
				<form:input path="jurisdiction" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Business type:</label>
				<form:input path="bustype" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Company Reference :</label>
				<form:input path="companyreference" cssClass="span6" />
			</div>
		</div>
		
		<div class="row-fluid">
			<div class="span6">				
						<input type="button" value="Add Company" class="btn btn-primary"
							data-url="${createCompanyURL}" id="cmpAdd" />
					


				<input type="button" value="Go Back" class="btn btn-primary"
					data-url="${companyListURL}" id="cmpback" />
			</div>
		</div>


	</form:form>

</div>


	


