<%@include file="init.jsp"%>

<portlet:actionURL var="sendContactUSformURL">
  <portlet:param name="action" value="sendQuery"/>
</portlet:actionURL>

<section class="home-section contact-round-section normal-padding">
    <div class="container">
        <h2 class="text-center main-header full-visible blue" data-animation="flipInX">Get in touch</h2>

        <div class="row-fluid" data-animation="fadeInUp">
            <div class="span4">
                <div class="feature-img text-center">
					<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon1.png" />
				</div>

                <div class="sub-head text-center">
                    <p>London,United Kingdom</p>
                </div>
            </div>

            <div class="span4">
                <div class="feature-img text-center yellow">
					<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon2.png" />
				</div>

                <div class="sub-head text-center">
                    <p></p>
                </div>
            </div>

            <div class="span4">
                <div class="feature-img text-center green">
                	<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon3.png" />
                </div>

                <div class="sub-head text-center">
                    <p>info@whitehallfinance.com</p>
                </div>
            </div>
        </div>
    </div>
</section>



<form:form commandName="contactModel" method="post" 	action="${sendContactUSformURL}" id="contactForm" name="contactForm">

<section class="home-section contact-round-section form-margin">

<div  id="errorMsg">
	
</div>
    <div class="form-box">
        <div class="container">
            <div class="row-fluid">
                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="fName">First Name</label>
						<!-- <input class="field " id="fName" name="fName" type="text" value=""> -->
						<form:input path="firstName"   id="firstName"  cssClass="field" />
					</div>
                </div>

                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lName">Last Name</label>
						<!-- <input class="field " id="lName" name="lName" type="text" value=""> -->
						<form:input path="lastName"   id="lastName"  cssClass="field" />
					</div>
                </div>

                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="cName">Company Name</label>
						<!-- <input class="field " id="cName" name="cName" type="text" value=""> -->
						<form:input path="companyName"   id="companyName"  cssClass="field" />
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="jobTitle">Job Title</label>
						<!-- <input class="field " id="jobTitle" name="jobTitle" type="text" value=""> -->
						<form:input path="jobtitle"   id="jobtitle"  cssClass="field" />
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="contactNo">Contact Number</label>
					<!-- 	<input class="field " id="contactNo" name="contactNo" type="text" value=""> -->
						<form:input path="contactNo"   id="contactNo"  cssClass="field" />
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="emailAddress">Email Address</label>
					<!-- 	<input class="field " id="emailAddress" name="emailAddress" type="text" value=""> -->
						<form:input path="emailAddress"   id="emailAddress"  cssClass="field" />
					</div>
                </div>
            </div>

            <div class="row-fluid">
            	<div class="span12">
            		<div class="control-group">
						<label class="control-label" for="message">Your Message</label>
						<!-- <textarea id="message" name="message" rows="3"></textarea> -->
						<textarea name="message" id="message"  rows="3" maxlength="1000" ></textarea>
					</div>
            	</div>
            </div>

            <div class="row-fluid">
                <div class="button-container">
                	 <a class="customButtonMedium btnBgGreen btnfont" href="javascript:void(0)" id="submitForm">Submit</a> 
                	<!-- <input type="button" value="Submit" class="customButtonMedium btnBgGreen btnfont"  /> -->
                </div>
            </div>
        </div>
    </div>
</section>
</form:form>

<section class="home-section contact-round-section map-section">
    <div class="map-body">
        <div class="map" id="map">&nbsp;</div>
    </div>
</section> 
