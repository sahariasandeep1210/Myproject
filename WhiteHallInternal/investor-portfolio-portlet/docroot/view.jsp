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

<div id="investorPortfolioTab">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#investor-tab">INVESTOR PORTFOLIOS</a></li>
		<li><a href="#cash-tab">INVESTOR BALANCE SHEET</a></li>
	</ul>
	<div class="tab-content">
	
		<div id="investor-tab" class="tab-pane">
			lorem
		</div>
		
		<div id="bal-sheet-tab" class="tab-pane">
			<div class="customWell">
				<div class="row-fluid">
					<div class="span4">
						<aui:select label="Investor Name" name="selectionStyle">
							<aui:option selected="true" value="">Select</aui:option>
							<aui:option selected="" value="dynamic">Option1</aui:option>
							<aui:option selected="" value="manual">Option2</aui:option>
						</aui:select>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Cash Position
				   			</div>
				   			<div class="with-button">
				   				<div class="bigText blue">
					   				&pound; 46250.00
					   			</div>
					   			<aui:button cssClass="btnBgGraySm" value="CASH REPORT"></aui:button>
				   			</div>
				   			
				   		</div>
					</div>
					
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Total Asset Value
				   			</div>
				   			<div class="with-button">
				   				<div class="bigText blue">
					   				&pound; 50025.77
					   			</div>
					   			<aui:button cssClass="btnBgGraySm" value="CURRENT RECEIVABLES"></aui:button>
				   			</div>
				   			
				   		</div>
					</div>
					
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Receivables Position 
				   			</div>
				   			
			   				<div class="bigText blue">
				   				&pound; 3775.77
				   			</div>
				   			
				   			
				   		</div>
					</div>
					
				</div>
				
				<div class="row-fluid">
					<div class="span4 mt15">
						<aui:select label="Action" name="selectionStyle1">
							<aui:option selected="true" value="">Select</aui:option>
							<aui:option selected="" value="dynamic">Option1</aui:option>
							<aui:option selected="" value="manual">Option2</aui:option>
						</aui:select>
					</div>
					
					<div class="span4 mt15">
						<aui:input name="transAmt" label="Transaction Amount" placeholder=""></aui:input>
					</div>
					
					<div class="span4 mt15">
						<aui:input name="selectDate" label="Date" placeholder="mm/dd/yyyy" suffix="<i class='icomoon-calendar'></i>"></aui:input>
					</div>
					
				</div>
				
				<div class="row-fluid">
			  		<div class="span12">
			  			<div class="actionContainer noBorder text-left">
			  				<aui:button cssClass="btnBgBuSm" value="SUBMIT"></aui:button>
			  				<aui:button cssClass="btnBrGrSm" value="CANCEL"></aui:button>
			  			</div>
			  			
			  		</div>
			  	</div>
			</div>
			<div class="row-fluid">
				<div class="span12 text-right mb15">
					<aui:button cssClass="btnBgGreenSm" value="Export"></aui:button>
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

<aui:script>
AUI().ready(function() {
	AUI().use('aui-tabview',function(A) {
		new A.TabView({
			srcNode: '#investorPortfolioTab'
		  }
		).render();
	});
});

$(function() {
	$("#tablesorter-demo2").tablesorter();
	
	$( "input#<portlet:namespace/>selectDate" ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true
    });
});
</aui:script>