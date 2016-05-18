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

<div class="title-container noBorder clearfix">
 	<div class="btn-wrapper">
 		<button class="btn btnBrGrSm btnIconSm filter-btn active" type="button">
			<i class="icomoon-filter"></i>
		</button>
 		<button class="btn btnBgGreenSm" type="button"> Export </button>
 	</div>
</div>

<div class="customWell filter-container">
	<div class="row-fluid">
		<div class="span3 spanSm6">
			<div class="control-group">
				<div class="input-append" id="yui_patched_v3_11_0_1_1463574056569_503">
					<input class="field" id="search" name="search" placeholder="Search" type="text" value="">
						<span class="add-on"><i class="icomoon-search"></i></span>
				</div>
			</div>
		</div>
		
		<div class="span3 spanSm6 mtXs10">
			<div class="control-group">
				<select class="aui-field-select" id="selectionStyle" name="selectionStyle">
					<option class="" selected="" value="">Select Date</option>
					<option class="" value="dynamic">Option1</option>
					<option class="" value="manual">Option2</option>
				</select>
			</div>
		</div>
		
		<div class="span3 spanSm6 mtSm10 mtXs10">
			<div class="control-group">
				<div class="input-append">			
					<input class="field" id="startDate" name="startDate" placeholder="mm/dd/yyyy" type="text" value="">
					<span class="add-on"><i class="icomoon-calendar"></i></span>
				</div>
			</div>
		</div>
		
		<div class="span3 spanSm6 mtSm10 mtXs10">
			<div class="control-group">
				<div class="input-append">			
					<input class="field" id="endDate" name="endDate" placeholder="mm/dd/yyyy" type="text" value="">
					<span class="add-on"><i class="icomoon-calendar"></i></span>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="actionContainer noBorder text-left">
				<button class="btn btnBgBuSm" type="button"> Search </button>
			</div>
		</div>
	</div>
</div>
<div class="customTableContainer">
 	<table id="tablesorter-demo" class="tablesorter table">
	<thead>
		<tr>
			
			<th>Trade#</th>
			<th>SCF Company</th>
			<th>Duration</th>
			<th>Opening Date</th>
			<th>Closing Date</th>
			<th>Trade Amount</th>
			<th>Status</th>
			<th>Is Multi Invoice</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="#">TES1603</a></td>
			<td><b>TESCO</b></td>
			<td >66</td>
			<td>24-03-2016</td>
			<td>02-06-2016</td>
			<td class="blue_bold text-right">
				<div class="pull-left">15,000</div>
				<div class="text-align-icon">
					<i class="icomoon-minus cursor-pointer credit-break"></i>
				</div>
			</td>
			<td>Allotment Paid</td>
			<td class="bigger-icon red_normal"> <i class="icomoon-no-document"></i> </td>
		</tr>
		
		<tr>
			<td colspan="7" class="inner-table-container">
				<table class="table inner-table">
					<thead>
						<tr>
							<th>Allotment Amount</th>
							<th>Discount Rate</th>
							<th>Duration</th>
							<th>Allotment Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3750.00</td>
							<td>400</td>
							<td>66</td>
							<td>24-03-2016 18:11</td>
						</tr>
						<tr>
							<td>3750.00</td>
							<td>400</td>
							<td>66</td>
							<td>24-03-2016 18:11</td>
						</tr>
					</tbody>
				</table>
			</td>
			<td></td>
		</tr>
		<tr>
			
			<td><a href="#">TES1603</a></td>
			<td><b>TESCO</b></td>
			<td >66</td>
			<td>24-03-2016</td>
			<td>02-06-2016</td>
			<td class="blue_bold text-right">
				<div class="pull-left">15,000</div>
				<div class="text-align-icon">
					<i class="icomoon-plus cursor-pointer credit-break"></i>
				</div>
			</td>
			<td>Allotment Paid</td>
			<td class="bigger-icon red_normal"> <i class="icomoon-no-document"></i> </td>
		</tr>
		<tr>
			
			<td><a href="#">TES1603</a></td>
			<td><b>TESCO</b></td>
			<td >66</td>
			<td>24-03-2016</td>
			<td>02-06-2016</td>
			<td class="blue_bold text-right">
				<div class="pull-left">15,000</div>
				<div class="text-align-icon">
					<i class="icomoon-plus cursor-pointer credit-break"></i>
				</div>
			</td>
			<td>Allotment Paid</td>
			<td class="bigger-icon red_normal"> <i class="icomoon-no-document"></i> </td>
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
	
<aui:script>
AUI().ready(function() {
	
});

$(function() {
	
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
	
	$("#tablesorter-demo").tablesorter({
		 headers: {
			 0:{
				 sorter: false
			 }
		 }
	});
	
	$(".filter-btn").on({
		click: function(){
			var btn = $(this);
			$(".filter-container").slideToggle(400, function(){
				$(btn).removeClass("active");
				if($(this).is(":visible")){
					$(btn).addClass("active");
				}
			});
		}
	});
});	
</aui:script>	