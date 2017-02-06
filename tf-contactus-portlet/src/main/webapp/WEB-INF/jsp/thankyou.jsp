
<%@include file="init.jsp"%>

<portlet:renderURL var="defaultURL"></portlet:renderURL>

<section class="home-section bussiness-application high-padding" id="confirmationDiv">
	<div class="panel panel-default">
	
		  <div class="panel-body">
            <div class="text-center img-w"><img alt="" src="${themeDisplay.getPathThemeImage()}/footer-bottom-w.png" /></div>

            <div class="sub-head text-center">
                <p>Thanks!</p>                
                <hr class="maxWidth" />
            </div>      
            
             <div class="text-center des-p">             
               <p>We appreciate that you've taken the time to write us. We'll get back to you very soon. </p>
                <br>
                <p>Please come back and see us often.</p>
            </div>    
            
            <div class="button-container text-center">				
				<a  href="${defaultURL}" class="customButtonMedium btnBgGreen btnfont"  >Go Back</a>
			</div>
        </div>
	
	</div>
</section>