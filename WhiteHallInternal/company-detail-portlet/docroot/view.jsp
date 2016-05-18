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

<div id="myToggler" class="customToggler">
	<div class="toggleHeader toggler-header-collapsed">
	  	<div class="toggle-title pull-left">Company Information</div>
	  	<div class="toggle-icon-container text-right">
	  		<i class="icomoon-accordian-arrow-down"></i>
	  	</div>
  	</div>
  	<div class="toggleContent toggler-content-collapsed">
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="name"> Name * </label>
					<input class="field " id="name" name="name" type="text" value="LLOYDS">
				</div>
  			</div>
  			
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="alname"> Alternate Name </label>
					<input class="field " id="alname" name="alname" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="regNum"> Registration Number * </label>
					<input class="field " id="regNum" name="regNum" type="text" value="123456">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="dateEs"> Date Established *</label>
					<div class="input-append">
						<input class="field" id="dateEs" name="dateEs" placeholder="" type="text" value="07/23/2004">
						<span class="add-on"><i class="icomoon-calendar"></i></span>
					</div>
				</div>
  			</div>
  		</div>
  		
  		<div class="divider mb15"></div>
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="add1"> Address Line 1 * </label>
					<input class="field " id="add1" name="add1" type="text" value="Address 1">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="add2"> Address Line 2 </label>
					<input class="field " id="add2" name="add2" type="text" value="Address 2">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="loc"> Locality </label>
					<input class="field " id="loc" name="loc" type="text" value="London">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="region"> Region * </label>
					<input class="field " id="region" name="region" type="text" value="London">
				</div>
  			</div>
  		</div>
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="country"> Country * </label>
					<input class="field " id="country" name="country" type="text" value="United Kingdom">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="postal"> Postal Code * </label>
					<input class="field " id="postal" name="postal" type="text" value="W1G 9QR">
				</div>
  			</div>
  		</div>
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="telNo"> Telephone No * </label>
					<input class="field " id="telNo" name="telNo" type="text" value="659-759-1589">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="url"> URL </label>
					<input class="field " id="url" name="url" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
				<div class="control-group">
					<label class="control-label" for="orgType"> Organisation Type</label>
					<select class="aui-field-select" id="orgType" name="orgType">
						<option class="" selected="" value=""> Select</option>
						<option class="" value=""> Option1</option>
						<option class="" value=""> Option2</option>
					</select>
				</div>
  			</div>
  			<div class="span3">
				<div class="control-group">
					<label class="control-label" for="comType"> Company Type</label>
					<select class="aui-field-select" id="comType" name="comType">
						<option class="" selected="" value=""> Select</option>
						<option class="" value=""> Option1</option>
						<option class="" value=""> Option2</option>
					</select>
				</div>
  			</div>
  		</div>
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="directors"> Directors </label>
					<input class="field " id="directors" name="directors" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="shareholders"> Shareholders </label>
					<input class="field " id="shareholders" name="shareholders" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="customers"> Customers </label>
					<input class="field " id="customers" name="customers" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="juridiction"> Juridiction </label>
					<input class="field " id="juridiction" name="juridiction" type="text" value="">
				</div>
  			</div>
  		</div>
  		
  		<div class="row-fluid">
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="businessType"> Business Type </label>
					<input class="field " id="businessType" name="businessType" type="text" value="">
				</div>
  			</div>
  			<div class="span3">
  				<div class="control-group">
					<label class="control-label" for="comRef"> Company Referance </label>
					<input class="field " id="comRef" name="comRef" type="text" value="">
				</div>
  			</div>
  		</div>
  		
  		<div class="actionContainer text-left">
  			<button class="btn btnBgBuSm" type="button"> UPDATE </button>
  			<button class="btn btnBgRedSm" type="button"> DELETE </button>
  		</div>
  	</div>
  	
  	<div class="toggleHeader toggler-header-collapsed">
	  	<div class="toggle-title pull-left">User Information</div>
	  	<div class="toggle-icon-container text-right">
	  		<i class="icomoon-accordian-arrow-down"></i>
	  	</div>
  	</div>
  	<div class="toggleContent toggler-content-collapsed">
  		<div class="row-fluid">
	  		<div class="span12 text-right">
	  			<div class="actionContainer noBorder pt0">
	  				<button class="btn btnBgGreenSm" type="button"> ADD USER </button>
	  			</div>
	  			
	  		</div>
	  	</div>
	  	
	  	<div class="customTableContainer">
		  	<table id="tablesorter-demo" class="tablesorter table">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Level</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Gautam</td>
						<td>Sharma</td>
						<td>gautamkct</td>
						<td>gautam.kct1988@gmail.com</td>
						<td>696-896-8868</td>
						<td>Admin</td>
					</tr>
				</tbody>
			</table>
		  </div>
  	</div>
  	
  	<div class="toggleHeader toggler-header-collapsed">
	  	<div class="toggle-title pull-left">Offer Information</div>
	  	<div class="toggle-icon-container text-right">
	  		<i class="icomoon-accordian-arrow-down"></i>
	  	</div>
  	</div>
  	<div class="toggleContent toggler-content-collapsed">
  		<p class="mb15">Officer's information was updated on . Please click on "Update Officers Information" to update officers information.</p> 
  		<div class="customTableContainer">
		  	<table id="tablesorter-demo1" class="tablesorter table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Officer Role</th>
						<th>Appointed Date</th>
						<th>Nationality</th>
						<th>Register on</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>NOMINEE SECRETARY LTD</td>
						<td>coporate-nominee-director</td>
						<td>23-07-2004</td>
						<td></td>
						<td>696-896-8868</td>
					</tr>
					<tr>
						<td>NOMINEE SECRETARY LTD</td>
						<td>coporate-nominee-director</td>
						<td>23-07-2004</td>
						<td>India</td>
						<td>696-896-8868</td>
					</tr>
				</tbody>
			</table>
	  	</div>
  	</div>
</div>

<aui:script>
AUI().use('aui-toggler', function(A) {
    new A.TogglerDelegate({
        animated: true,
        closeAllOnExpand: true,
        container: '#myToggler',
        content: '.toggleContent',
        expanded: false,
        header: '.toggleHeader',
        transition: {
          duration: 0.2,
          easing: 'cubic-bezier(0, 0.1, 0, 1)'
        }
      });
});

$(function() {		
	$( "input#dateEs" ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOtherMonths: true
    });
	
	$("#tablesorter-demo").tablesorter();
	$("#tablesorter-demo1").tablesorter();
});	
</aui:script>
