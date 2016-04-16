<%@ include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveGeneralSettings">
	<portlet:param name="action" value="saveGeneralSettings" />
</portlet:actionURL>
<div class="container-fluid">
      <div class="row-fluid">
				<div class="span12" >
					 <div class="span4"><h4>Manage General Settings</h4></div>	
				</div>
      </div>

<form:form method="post" commandName="generalSettingModel"
		class="form-horizontal" name="generalSettingForm">
		<input type="hidden" value="${saveGeneralSettings}" id="saveSettingURL" />
		<input type="hidden" value="${generalSetting.id}" name="id" />
		
		<div class="row-fluid">
			<div class="span6">




				<div class="table-responsive" id="generalTable">
					<table class="table  tablesorter table-bordered">
						<thead>
							<tr>
								<!-- <th width="5%"></th> -->
								<th>Settings</th>
								<th width="25%"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
							     <td>Whitehall Profit Share %</td>
							      <td>
							      <input type="text"
												value="${generalSetting.whitehalShare}"
												name="whitehalShare" id="profit">
							    </td> 
							</tr>
							<tr>
							     <td>VAT</td>
							      <td>
							         <input type="text"
												value="${generalSetting.vat }"
												name="vat" id="vat">
							      
							      </td>
							</tr>
							<tr>
							     <td>Seller Transaction Fee</td>
							      <td>
							      <input type="text"
												value="${generalSetting.sellerTransFee }"
												name="sellerTransFee" id="transaction">
							       
							      </td>
							</tr>
							<tr>
							     <td>Seller Finance Fee</td>
							      <td>
							      <input type="text"
												value="${generalSetting.sellerFinFee }"
												name="sellerFinFee" id="finance">
							         
							      </td>
							</tr>
							<tr>
							     <td>Min Payment Date Duartion</td>
							      <td>
							      <input type="text"
												value="${generalSetting.minPaymentDateDuartion }"
												name="minPaymentDateDuartion" id="minPaymentDateDuartion">
							         
							      </td>
							</tr>
							
					</tbody>
					</table>
				</div>


			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Update Settings" id="updateGeneralSettings" class="btn btn-primary" />
			</div>
		</div>
	</form:form>
	</div>
	