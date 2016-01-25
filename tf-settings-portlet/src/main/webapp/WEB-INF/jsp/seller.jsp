<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveSellerSettings">
	<portlet:param name="action" value="saveSellerSettings" />
</portlet:actionURL>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="span4">
				<h4>
					<liferay-ui:message key='manage.seller.information' />
				</h4>
			</div>

		</div>
	</div>
	<div class="row-fluid">
		<div class="span12 borderdiv">
			<div class="span12">
				<h6>
					<liferay-ui:message key='manage.seller.message' />
				</h6>
			</div>

		</div>
	</div>
	<form:form method="post" commandName="sellerDTO"
		class="form-horizontal" name="settingForm">
		<input type="hidden" value="${saveSellerSettings}" id="saveURL" />
		<input type="hidden" value="${sellerDTO.id}" name="id" />
		
		

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Transaction Fee</label>
				<form:input path="sellerTransFee" name="" cssClass="span6"  />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Finance Fee</label>
				<form:input path="sellerFinFee" name="" cssClass="span6"  />
			</div>
		</div>
		
		
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Update Settings" id="updateSettings" class="btn btn-primary" />
			</div>
		</div>
	</form:form>
</div>