<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui"  prefix="aui"%>

<portlet:defineObjects />

<div id="creditBreakModal"></div>
<div id="portfolioTab">
  <ul class="nav nav-tabs">
	<li class="active"><a href="#investor-tab">INVESTOR PORTFOLIOS</a></li>
	<li><a href="#cash-tab">CASH REPORT</a></li>
  </ul>
	<div class="tab-content">
		<div id="investor-tab" class="tab-pane">
		
			<div class="title-container clearfix">
					<div class="main-title">
						MANAGE INVOICES
						<div class="sub-title">Conveniently manage your Portfolio</div>
					</div>
					
					<div class="btn-wrapper">
						<aui:button cssClass="btnBgGreenSm" value="ADD PORTFOLIO"></aui:button>
					</div>
			  </div>
			  
			  <div class="customWell filter-container">
			  	<div class="row-fluid">
			  		<div class="span3">
			  			<aui:select label="" name="selectionStyle">
							<aui:option selected="true" value="">Select SCF Company *</aui:option>
							<aui:option selected="" value="dynamic">Option1</aui:option>
							<aui:option selected="" value="manual">Option2</aui:option>
						</aui:select>
			  		</div>
			  		
			  		<div class="span3 mtXs10">
			  			<aui:input name="myCreditLine" label="" placeholder="My Credit Line *"></aui:input>
			  		</div>
			  		
			  		<div class="span3 mtXs10">
			  			<aui:select label="" name="selectionStyle">
							<aui:option selected="true" value="">Offered BPS *</aui:option>
							<aui:option selected="" value="dynamic">Option1</aui:option>
							<aui:option selected="" value="manual">Option2</aui:option>
						</aui:select>
			  		</div>
			  		
			  		<div class="span3 mtXs10">
			  			<aui:button cssClass="btnBgRedSm btnIconSm" icon="icomoon-delete"></aui:button>
			  		</div>
			  	</div>
			  	<div class="row-fluid">
			  		<div class="span12">
			  			<div class="actionContainer noBorder text-left">
			  				<aui:button cssClass="btnBgBuSm" value="UPDATE PORTFOLIO"></aui:button>
			  			</div>
			  			
			  		</div>
			  	</div>
			  </div>
			  
			  
			  <div class="customTableContainer">
			  	<table id="tablesorter-demo" class="tablesorter table">
					<thead>
						<tr>
							<th>SCF Company</th>
							<th width="150px">Total Credit Line</th>
							<th>My Credit Line</th>
							<th>BPS</th>
							<th>Utilised</th>
							<th>Available</th>
							<th>My Transactions</th>
						</tr>
					</thead>
					<tbody>
						<tr class="highlight">
							<td>Total</td>
							<td class="blue_normal">110,000</td>
							<td class="green_bold">1,125.46</td>
							<td></td>
							<td class="blue_bold">1,277.78</td>
							<td class="blue_bold">102.31</td>
							<td>
								<aui:button cssClass="btnBgGreenSm btnIconSm" icon="icomoon-edit"></aui:button>
								<aui:button cssClass="btnBgBuSm btnIconSm" icon="icomoon-history"></aui:button>
							</td>
						</tr>
						<tr>
							<td>TESCO</td>
							<td class="blue_normal text-right">
								<div class="pull-left">110,000</div> 
								<div class="text-align-icon">
									<i class="icomoon-plus cursor-pointer credit-break"></i>
								</div>
							</td>
							<td class="green_normal">1,125.46</td>
							<td>420</td>
							<td class="blue_normal">1,277.78</td>
							<td class="blue_normal">102.31</td>
							<td>
								<aui:button cssClass="btnBgGreenSm btnIconSm" icon="icomoon-edit"></aui:button>
								<aui:button cssClass="btnBgBuSm btnIconSm" icon="icomoon-history"></aui:button>
							</td>
						</tr>
						<tr>
							<td colspan="7" class="inner-table-container">
								<table class="table inner-table">
									<thead>
										<tr>
											<th>Discount Rate</th>
											<th>My Credit Line</th>
											<th>Start Date</th>
											<th>End Date</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>400</td>
											<td>300,000</td>
											<td>29-02-2016 18:27</td>
											<td>24-03-2016 18:11</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>TESCO</td>
							<td class="blue_normal text-right">
								<div class="pull-left">110,000</div> 
								<div class="text-align-icon">
									<i class="icomoon-plus cursor-pointer credit-break"></i>
								</div>
							</td>
							<td class="green_normal">1,125.46</td>
							<td>420</td>
							<td class="blue_normal">1,277.78</td>
							<td class="blue_normal">102.31</td>
							<td>
								<aui:button cssClass="btnBgGreenSm btnIconSm" icon="icomoon-edit"></aui:button>
								<aui:button cssClass="btnBgBuSm btnIconSm" icon="icomoon-history"></aui:button>
							</td>
						</tr>
						<tr>
							<td>TESCO</td>
							<td class="blue_normal text-right">
								<div class="pull-left">110,000</div> 
								<div class="text-align-icon">
									<i class="icomoon-plus cursor-pointer credit-break"></i>
								</div>
							</td>
							<td class="green_normal">1,125.46</td>
							<td>420</td>
							<td class="blue_normal">1,277.78</td>
							<td class="blue_normal">102.31</td>
							<td>
								<aui:button cssClass="btnBgGreenSm btnIconSm" icon="icomoon-edit"></aui:button>
								<aui:button cssClass="btnBgBuSm btnIconSm" icon="icomoon-history"></aui:button>
							</td>
						</tr>
					</tbody>
				</table>
			  </div>
		</div>
		<div id="cash-tab">
		   <div class="customWell">
		   		<div class="row-fluid">
		   			<div class="span12">
		   				<div class="labelBigTextContaier spacer border">
				   			<div class="smallLabelText">
				   				Investor Name
				   			</div>
				   			
				   			<div class="bigText">
				   				ROYAL BANK GROUP SERVICES LIMITED
				   			</div>
				   		</div>	
		   			</div>
		   		</div>
		   		
		   		<div class="row-fluid">
		   			<div class="span3 spanSm6">
		   				<div class="labelBigTextContaier">
				   			<div class="smallLabelText">
				   				Cash Position
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 46250.00
				   			</div>
				   		</div>
		   			</div>
		   			
		   			<div class="span3 spanSm6">
		   				<div class="labelBigTextContaier mtXs15">
				   			<div class="smallLabelText">
				   				Total Asset Value
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 50025.77
				   			</div>
				   		</div>
		   			</div>
		   			
		   			<div class="span3 spanSm6">
		   				<div class="labelBigTextContaier mtSm15 mtXs15">
				   			<div class="smallLabelText">
				   				Receivables Position 
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 3775.77
				   			</div>
				   		</div>
		   			</div>
		   			
		   			<div class="span3 spanSm6">
		   				<div class="labelBigTextContaier mtSm15 mtXs15">
				   			<div class="smallLabelText">
				   				Current Balance 
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 3775.77
				   			</div>
				   		</div>
		   			</div>
		   		</div>
		   		
		   		<div class="row-fluid">
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<aui:input name="startDate" label="Date" placeholder="mm/dd/yyyy" suffix="<i class='icomoon-calendar'></i>"></aui:input>
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<aui:input name="endDate" label="Date" placeholder="mm/dd/yyyy" suffix="<i class='icomoon-calendar'></i>"></aui:input>
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<aui:select label="Select Transaction Type" name="selectionStyle">
							<aui:option selected="true" value="">Select</aui:option>
							<aui:option selected="" value="dynamic">Option1</aui:option>
							<aui:option selected="" value="manual">Option2</aui:option>
						</aui:select>
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="labelBigTextContaier">
				   			<div class="smallLabelText">
				   				Total Selected
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 3775.77
				   			</div>
				   		</div>
		   			</div>
		   		</div>
		   		
		   		<div class="row-fluid">
			  		<div class="span12">
			  			<div class="actionContainer noBorder text-left">
			  				<aui:button cssClass="btnBgBuSm" value="SUBMIT"></aui:button>
			  			</div>
			  			
			  		</div>
			  	</div>
		   		
		   </div>
		   
		   
		   <div class="customTableContainer">
		  	<table id="tablesorter-demo2" class="tablesorter table">
				<thead>
					<tr>
						
						<th>Date</th>
						<th>Transactin Type</th>
						<th>Trade ID</th>
						<th>Amount</th>
						<th>Reference</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>25-03-2016</td>
						<td class=" text-right bigger-icon">
							<div class="pull-left text-align-text">Deposit</div> 
							<div class="text-align-icon">
								<i class="icomoon-round-plus green_normal cursor-pointer"></i>
							</div>
						</td>
						<td></td>						
						<td>50000.00</td>
						<td></td>
					</tr>
					<tr>
						<td>25-03-2016</td>
						<td class=" text-right bigger-icon">
							<div class="pull-left text-align-text">Deposit</div> 
							<div class="text-align-icon">
								<i class="icomoon-round-minus red_normal cursor-pointer"></i>
							</div>
						</td>	
						<td></td>						
						<td>50000.00</td>
						<td></td>
					</tr>
					
				</tbody>
			</table>
		  </div>
		  
		  <div class="lfr-pagination">
			  	<div id="pagination" class="pagination pagination-centered">
				  <ul class="pagination-content">
				    <li><a href="#">&laquo;</a></li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">&raquo;</a></li>
				  </ul>
				</div>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">5 items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
		                  <li role="presentation"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation"><a role="menuitem" href="#">15 items per page</a></li>
		                </ul>
					</div>
					<small class="search-results">Showing 1 - 20 of 22 Results.</small>
				</div>
		  </div>
		</div>
	</div>
</div>
<div class="hidden modal-table">
	<div class="mb15">MORRISON LIMITED credit Line breakdown</div>
	<div class="customTableContainer ">
		<table>
			<tr>
				<th>Investor Name</th>
				<th>My Credit Line</th>
				<th>BPS</th>
			</tr>
			<tr>
				<td>Anonymous</td>
				<td>500,000</td>
				<td>400</td>
			</tr>
			<tr>
				<td>Anonymous</td>
				<td>500,000</td>
				<td>400</td>
			</tr>
			<tr>
				<td>Anonymous</td>
				<td>500,000</td>
				<td>400</td>
			</tr>
		</table>
	</div>
</div>


<aui:script>

AUI().ready(function() {
	AUI().use('aui-tabview',function(A) {
		new A.TabView({
			srcNode: '#portfolioTab'
		  }
		).render();
	});
	
	
	AUI().use('aui-modal', function(A) {
        var showModel = A.all('.credit-break');
        var modal = new A.Modal({
            bodyContent: $(".modal-table").html(),
            centered: true,
            headerContent: 'CREDIT LINE BREAKDOWN',
            modal: true,
            render: '#creditBreakModal', // !!this is most important config!!
            maxWidth: 450,
            visible: false,
            resizable: false,
            cssClass: 'customModal',
            toolbars:{
                header:[
                {
                    label: '',
                    cssClass: 'icomoon-close close',
                    on: {
                      click: function() {
                        modal.hide();
                      }
                    }
                  }
                ],
                footer:[
                    {
                      label: 'CLOSE',
                      cssClass: 'btnBrGrSm',
                      on: {
                        click: function() {
                          modal.hide();
                        }
                      }
                    }
                ]
            }
        }).render();
    	
        showModel.on({
            click:function(){
                modal.show();
            }
        });
    });
});

$(function() {
	$("#tablesorter-demo").tablesorter();
	
	$("#tablesorter-demo2").tablesorter();
	
	$( "input#<portlet:namespace/>startDate" ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true
    });
	
	$( "input#<portlet:namespace/>endDate" ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true
    });
});

</aui:script>