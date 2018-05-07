<%@ include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveGeneralSettings">
	<portlet:param name="action" value="saveGeneralSettings" />
</portlet:actionURL>
<div class="tab-content">

	<div id="scf-tab" class="tab-pane">
			  <div class="title-container clearfix">
			  	
			  		<div class="main-title">Manage General Settings</div>			  	
			  	
			  </div>
		  	
		</div>

<form:form method="post" commandName="generalSettingModel"
		class="form-horizontal" name="generalSettingForm">
		<input type="hidden" value="${saveGeneralSettings}" id="saveSettingURL" />
		<input type="hidden" value="${generalSetting.id}" name="id" />
		
				<div class="customTableContainer" id="generalTable" style="width: 50%;">
					<table class="table  tablesorter table-bordered" >
						<thead>
							<tr>
								<!-- <th width="5%"></th> -->
								<th width="25%">Settings</th>
								<th width="25%"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
							     <td>Whitehall Profit Share %</td>
							      <td>
							      <input type="text"
												value="${generalSetting.whitehalShare}"
												name="whitehalShare" id="profit" class="field text-right">
							    </td> 
							</tr>
							<tr>
							     <td>VAT  %</td>
							      <td>
							         <input type="text"
												value="${generalSetting.vat }"
												name="vat" id="vat" class="field text-right">
							      
							      </td>
							</tr>
							
							<tr>
							     <td>Transaction Fee (Buyer) Fixed</td>
							      <td>
							      <input type="text"
												value="${generalSetting.sellerTransFee }"
												name="sellerTransFee" id="transaction" class="field text-right">
							       
							      </td>
							</tr>
							<tr>
							     <td>Seller Transaction Fee (Whitehall) %</td>
							      <td>
							      <input type="text"
												value="${generalSetting.sellerFinFee }"
												name="sellerFinFee" id="finance" class="field text-right">
							         
							      </td>
							</tr>
							<tr>
							     <td>Min Payment Date Duration</td>
							      <td>
							      <input type="text"
												value="${generalSetting.minPaymentDateDuartion }"
												name="minPaymentDateDuartion" id="minPaymentDateDuartion" class="field text-right">
							         
							      </td>
							</tr>
							<tr>
							     <td>Min Level Of Investment</td>
							      <td>
							      <input type="text"
												value="${generalSetting.minLevelOfInvestment }"
												name="minLevelOfInvestment" id="minLevelOfInvestment" class="field text-right">
							         
							      </td>
							</tr>
							
						 <tr>
							     <td>VAT Investor Fee %</td>
							      <td>
							         <input type="text"
												value="${generalSetting.vatInvestor }"
												name="vatInvestor" id="vatInvestor" class="field text-right">
							      
							      </td>
							</tr>
							<tr>
							     <td>VAT WhiteHall Fee %</td>
							      <td>
							         <input type="text"
												value="${generalSetting.vatWhitehall }"
												name="vatWhitehall" id="vatWhitehall" class="field text-right">
							      
							      </td>
							</tr>
							<tr>
							     <td>VAT Seller Fee  %</td>
							      <td>
							         <input type="text"
												value="${generalSetting.vatSeller }"
												name="vatSeller" id="vatSeller" class="field text-right">
							      
							      </td>
							</tr> 
							
					</tbody>
					</table>
				</div>


			
		<div class="text-left">
				<input type="button" value="Update Settings" id="updateGeneralSettings" class="btn btnBgBuSm" />
		</div>
	</form:form>
	</div>
	