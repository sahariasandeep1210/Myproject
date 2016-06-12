<%@include file="init.jsp"%>


<portlet:actionURL var="regCompanyURL">
	<portlet:param name="action" value="registerCompany" />
</portlet:actionURL>

<portlet:actionURL var="continueURL">
	<portlet:param name="action" value="regCompanyInfo" />
</portlet:actionURL>

<portlet:actionURL var="homePageURL">
	<portlet:param name="action" value="homePage" />
</portlet:actionURL>

<portlet:resourceURL id="fetchCompanyDetails" var="fetchCompanyDetails" ></portlet:resourceURL> 

<div class="" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>

<liferay-ui:error 	key="error-user-email">
	<liferay-ui:message key="user.email.error"  arguments="${registration.user.email}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-user-screenname">
	<liferay-ui:message key="user.screenname.error"  arguments="${registration.user.username}"></liferay-ui:message>
</liferay-ui:error>
<liferay-ui:error 	key="error-company-registration">
	<liferay-ui:message key="company.duplicate.registration.no"  arguments="${registration.company.regNumber}"></liferay-ui:message>
</liferay-ui:error> 			
<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 


	<form:form commandName="registration" method="post"
		action="${regCompanyURL}" id="createCompany" name="companyDetail">
		<input type="hidden" value="${currentScreen}" name="currentScreen" id="currScreen"> 
		
		
		
		<!-- START: Company information -->
<section class="home-section bussiness-application high-padding" id="companyDiv">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
        	<div class="clearfix bs-wizard">      
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body common">
            <h4>Company Information</h4>

            <hr />
            <div class="row-fluid" id="fetchCmpInfo">
                <div class="span3 spanSm6">
                
                	<div class="control-group">
						<label class="control-label" for="comNo"> Company Number </label>
						<input type="text" id="companyNumber" name="companyNumber"		class="field" />
					</div>
                    
                </div>

                <div class="span6 spanSm6">
                    <div class="btncont">
                    <input type="hidden" value="${fetchCompanyDetails}" id="fetchURL" />
					<input type="button" value="Find Company Details"	class="customButtonMedium btnBgGray btnsmall mb10" id="findCompany" />                    	
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="name"> Name *</label>
						<input type="hidden" name="id"	value="${registration.company.id}" />					
						<form:input path="company.name" name="" cssClass="field"  id="companyName"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="alName">Alternate Name *</label>
						<form:input path="company.altname" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="regNo">Registration Number *</label>						
						<form:input path="company.regNumber" cssClass="field" id="registrationNo" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="dateEst">Date Established *</label>
						<div class="input-append">						
							<form:input path="company.dateestablished" cssClass="field"	id="dateestablished" />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>						
					</div>
                </div>
            </div>


			<label class="labelfont">Address Information *</label>
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<form:input path="company.address.addressLine1" cssClass="field"		id="address1" placeholder="Address Line 1*" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<form:input path="company.address.addressLine2" cssClass="field"	id="address2" placeholder="Address Line 2" />
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<form:input path="company.address.locality" cssClass="field" id="locality"		placeholder="Locality" />
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<form:input path="company.address.region" cssClass="field" id="region"		placeholder="Region*" />
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<form:input path="company.address.country" cssClass="field" id="country"		placeholder="country*" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<form:input path="company.address.postalCode" cssClass="field"		id="postalCode" placeholder="Postal Code*" />
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="teleNo">Telephone No *</label>
						<form:input path="company.telnumber" cssClass="field"  id="telNo"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="url">URL *</label>
						<form:input path="company.website" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
                		<label class="control-label" for="selectionStyle">Organisation Type *</label>					
						<form:select path="company.orgType" items="${orgTypeMap}"	class="aui-field-select" id="orgType" placeholder="Organisation Type" />
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="comType">Company Type *</label>
						<form:select path="company.companyType" items="${companyTypeMap}"		class="aui-field-select" id="companyType" placeholder="CompanyType Type"/>
					</div>
                </div>
            </div>

            <hr />
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="directors">Directors</label>
						<form:input path="company.directors" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="shareholders">Shareholders</label>
						<form:input path="company.shareholders" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="customers">Customers</label>
						<form:input path="company.customers" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="jurisdiction">Jurisdiction</label>
						<form:input path="company.jurisdiction" cssClass="field" id="jurisdiction" />
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="bussType">Bussiness Type</label>
						<form:input path="company.bustype" cssClass="field" />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="comRef">Company Reference</label>
						<form:input path="company.companyreference" cssClass="field"  id="companyreference"/>
					</div>
                </div>
            </div>

          
		<div class="button-container">
			<c:if test="${currentScreen =='Company'}">
				<a href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${continueURL}" id="continue" >Continue</a>	
				<a  href="javascript:void(0)" class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" data-url="${homePageURL}" id="homePage" >Go Back</a>
			</c:if>
				<%-- <c:choose>
					<c:when
						test="${currentScreen =='Company'}">
						<a href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${continueURL}" id="continue" >Continue</a>					
					</c:when>				
					<c:otherwise>
						<a  href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${regCompanyURL}" id="registerSeller" >Register</a>
					</c:otherwise>
				</c:choose>
				<a  href="javascript:void(0)" class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" data-url="${homePageURL}" id="homePage" >Go Back</a> --%>

		</div>
        </div>
    </div>
</section>

<!-- START: User information -->
<section class="home-section bussiness-application high-padding" id="userDiv">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
                  <div class="clearfix bs-wizard">      
			     <div class="bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body common">
            <h4>User Information</h4>

            <hr />
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="title">Title *</label>
						<form:input path="user.title" cssClass="field"  id="title"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="username">Username *</label>
						<form:input path="user.username" cssClass="field"  id="username"/>
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="fname">First Name *</label>
						<form:input path="user.firstName" cssClass="field"  id="firstname"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="mname">Middle Name *</label>
						<form:input path="user.middleName" cssClass="field"  />
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lname">Last Name *</label>
						<form:input path="user.lastName" cssClass="field"  id="lastname"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lname">Email *</label>
						<form:input path="user.email" cssClass="field" id="email"/>
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="bussTeleNo">Telephone No *</label>
						<form:input path="user.mobile" cssClass="field"  id="userTelNo"/>
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="level">Level</label>
						<form:input path="user.level" cssClass="field" />
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <label class="labelfont mb0">Directors</label>
                    <label class="radio inline pt0">
                         <%-- <form:radiobutton	path="user.companyDirector" value="Yes" id="yesOption" />Yes  --%>
                         <input checked="checked" id="optionsRadios1" name="optionsRadios" type="radio" value="option1" /> Yes 
                     </label>
                    <label class="radio inline pt0">
                       <%--  <form:radiobutton path="user.companyDirector" value="No" id="noOption" /> No  --%>
                        <input id="optionsRadios2" name="optionsRadios" type="radio" value="option2" /> No 
                     </label>
                </div>
            </div>
            
            <div class="row-fluid" style="display:none;">
				<div class="span6">
					<label class="span6">User Type:</label>
					<form:input path="user.type" cssClass="span6" />					
				</div>
			</div>

           
		<div class="button-container">
				<%-- <c:choose>
					<c:when
						test="${currentScreen =='Company'}">
						<a href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${continueURL}" id="continue" >Continue</a>					
					</c:when>				
					<c:otherwise>
						<a  href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${regCompanyURL}" id="registerSeller" >Register</a>
					</c:otherwise>
				</c:choose>
				<a  href="javascript:void(0)" class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" data-url="${homePageURL}" id="homePage" >Go Back</a> --%>
				
			<c:if test="${currentScreen =='User'}">
				<a  href="javascript:void(0)" class="customButtonMedium btnBgGreen btnfont" data-url="${regCompanyURL}" id="registerSeller" >Register</a>
				<a  href="javascript:void(0)" class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" data-url="${homePageURL}" id="homePage" >Go Back</a>
			</c:if>

		</div>
        </div>
    </div>
</section>
<!-- END: User information -->

<!-- START: Confirmation -->
<section class="home-section bussiness-application high-padding"  id="confirmationDiv">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix bs-wizard">      
			     <div class=" bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body">
            <div class="text-center img-w"><img alt="" src="${themeDisplay.getPathThemeImage() }/footer-bottom-w.png" /></div>

            <div class="sub-head text-center">
                <p>Thank you.</p>

                <p>You have been successfully Registered.</p>

                <hr class="maxWidth" />
            </div>

            <div class="text-center des-p">
                <!-- <p>Your Password and action link has been send to your registered E-mail ID.</p> -->

              <!--   <p>Please use the action link to activate your Account.</p> -->
              <p>Please check your email for login instruction.Your temporary password is : ${tempPassword}</p>
            </div>
            
            div class="button-container">
				
				<a  href="/web/guest/home" class="customButtonMedium btnBgGreen btnfont"  >Login</a>

		</div>
        </div>
    </div>
</section>
		



	</form:form>


<div id="myModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Not Found!</h3>
  </div>
  <div class="modal-body">
    <p>Company details not found.Please enter manually.</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>



