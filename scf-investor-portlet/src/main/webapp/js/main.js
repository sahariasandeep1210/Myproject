$(document).ready(function() {
	
	  investorIndex = 0;
	  $("#saveProtfolios").hide(); 
	  $(".historyRow").hide();
	  $("#errorMsg").hide(); 
	  
	  
	  $('#investorModel').on('keypress', '.addprotfolio input', function(e) {
		  
		  //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        //$("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		  
	  });
	  
	  // Add button click handler
      $('#investorModel').on('click', '.addButton', function() {
    	  investorIndex++;
    	  var allSelectedvalues = [];
    	  //this code snippet with add all selected dropdown values to array
    	  $('.scfDropDown').each(function() {
    		  var currentValue=$(this).val();
    		  if(currentValue!="" || currentValue!=null){
    			  allSelectedvalues.push($(this).val());    		  
    			}    		 
    		});
    	  
    	 
          var $template = $('#protfolioTemplate'),
              $clone    = $template
                              .clone()
                              .removeClass('hide')
                              .addClass('addprotfolio')
                              .removeAttr('id')
                              .attr('data-investor-index', investorIndex)
                              .insertBefore($template);
          
          var dropwDownEle=$clone.find('.scfDropDown');
          
          //update DropDown values based on user selection
          $.each(allSelectedvalues, function( index, value ) {
        	  dropwDownEle.find('[value="'+value+'"]').remove();
        	 
    		});
          

          // Update the name attributes
          $clone
              .find('[name="investorModel.company.id"]').attr('name', 'investorModel[' + investorIndex + '].company.id').end()
              .find('[name="investorModel.currentCreditLine"]').attr('name', 'investorModel[' + investorIndex + '].currentCreditLine').end()
              .find('[name="investorModel.myCreditLine"]').attr('name', 'investorModel[' + investorIndex + '].myCreditLine').end()
              .find('[name="investorModel.discountRate"]').attr('name', 'investorModel[' + investorIndex + '].discountRate').end()
              .find('[name="investorModel.amountInvested"]').attr('name', 'investorModel[' + investorIndex + '].amountInvested').end()
              .find('[name="investorModel.availToInvest"]').attr('name', 'investorModel[' + investorIndex + '].availToInvest').end();
          
          if( $(".parentclass").length>1){
        	  $("#saveProtfolios").show();
        	  $("#butonClass" ).show(); 
          }else{
        	  $("#saveProtfolios").hide();
        	  $("#butonClass" ).hide(); 
          }
             
         
      })
        // Remove button click handler
      .on('click', '.removeButton', function() {
            var $row  = $(this).parents('.parentclass'),
                index = $row.attr('data-investor-index');

     

            // Remove element containing the fields
            $row.remove();
            if( $(".parentclass").length>1){
          	  $("#saveProtfolios").show();
          	  $("#butonClass" ).show(); 
            }else{
          	  $("#saveProtfolios").hide();
          	 $("#butonClass" ).hide(); 
            }
        });
      
      $('#investorModel').on('click', '.editInvestor', function() {
    	  var currentValue;
    	  var showModel=false;
    	  $('.parentclass :input').each(function() {
    		   currentValue=$(this).val();
    		   console.log("currentValue::::"+currentValue+":**:done");
    	        if(currentValue!='' &&  currentValue!=null && currentValue!='null'){
    	        	showModel=true;
    	        	return false;
    	        }
    	    });
    	  
    	  if(showModel){
    		 
    		  var currentID=$(this).attr('id');
    		  $("#invProtID").val(currentID);
    		  $("#editConfirmationModel").modal('show');
    	  }else{
    		  console.log("Do Edit >>");
    		  $(".addprotfolio").remove();
    		  var currentID=$(this).attr('id');
    		  triggerEdit(currentID);
    	
    	  }  	  
    	  
      });
      
      $('#investorModel').on('click', '#editCancel', function() {
    	    $("#errorMsg").hide(); 
    	    $("#editTemplate").addClass("hide");
    		$("#butonClass" ).hide(); 
    		$("#addProtfolioBtn" ).show();
    		
    		  $('#editTemplate :input').not(':button, :submit, :reset, :hidden').each(function() {          		 
         	        	$(this).removeClass("error_show");         	   
         	    });
    		//$("#saveProtfolios").hide();
    	  
      });
      
      $('#investorModel').on('click', '.historybtn', function() {
  	   var historyURL=$(this).attr('data-url'); 
  	   var protfolioID=$(this).attr('protID');
  	   //hiding all other history rows
  	   $(".historyRow").hide();
  	   if($(this).parent().parent().hasClass("highlightedClass")){
  		 $(this).parent().parent().toggleClass('highlightedClass');
  		   return ;
  	   }else{
  		 $('#companyListTable tr').removeClass("highlightedClass");
  		 $(this).parent().parent().toggleClass('highlightedClass');
  	   }
  	   
  	   
  	   
  	   if($("#"+protfolioID+"_table").length){
  		   $("#"+protfolioID+"_row").slideToggle();
  	   }else{
  			$.ajax({ 
				url: historyURL, 
				type: 'POST', 
				cache: false,
				data: { 
					protfolioID: protfolioID 					
					  }, 
				success: function(data){
					$("#"+protfolioID+"_row > td").html(data);
					$("#"+protfolioID+"_row").slideToggle();
							
				} ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
					
				}
				});	
  	   }
  	  
    });
      
      $('#investorModel').on('click', '.breakdown', function() {
    	  var breakdownURL=$(this).attr('data-url'); 
     	   var scfcompany=$(this).attr('scfcompany'); 
     	  var investorID=$(this).attr('investorID');
     	   
     		$.ajax({ 
				url: breakdownURL, 
				type: 'POST', 
				cache: false,
				data: { 
					scfcompany: scfcompany,
					investorID: investorID 
					  }, 
				success: function(data){
					$("#breakdownBody").html(data);
					 $("#breakdownModel").modal('show');
							
				} ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
					
				}
				});	
    	  
      });
    
      
      
      
      
      $('#investorModel').on('click', '#updatebtn', function() {
    	  $("#errorMsg").hide(); 
    	  	var errorFree=true;
    	  	var editutilised= $("#editutilised").val() + 0;
    	  	var editmyCreditLne= $("#editmyCreditLne").val()+ 0;
    	  	var url = $(this).attr('data-url');
    	 
    	    $('#editTemplate :input').not(':button, :submit, :reset, :hidden').each(function() {
      		  currentValue=$(this).val();
     	        if(currentValue=='' ||  currentValue==null){
     	        	errorFree=false;
     	        	$(this).addClass("error_show");
     	        }else{
     	        	$(this).removeClass("error_show");
     	        }
     	    });
    	    if(editmyCreditLne < editutilised){
    	    	$("#errorMsg").show(); 
    	    	$("#errorMsg").text("My Credit line can't be less than utilized amount");
    	    	$("#editmyCreditLne").addClass("error_show");
    	    	errorFree=false;
    	    }
    	    
    	  	
    	  	 if(errorFree){
    	  	 	document.forms["investorModel"].action = url;	  	  	
      			document.forms["investorModel"].submit();
        	  }
    	  
      }); 
      
      $('#investorModel').on('click', '#saveProtfolios', function() {
    	  var errorFree=true;
    	  console.log("Save protfolois");
    	  $('.addprotfolio :input').not(':button, :submit, :reset, :hidden').each(function() {
    		  currentValue=$(this).val();
   	        if(currentValue=='' ||  currentValue==null){
   	        	errorFree=false;
   	        	$(this).addClass("error_show");
   	        }else{
   	        	$(this).removeClass("error_show");
   	        }
   	    });
    	  
    	  console.log("Save protfolois >>>>>>>>>"+errorFree);
    	  if(errorFree){
    		 console.log("Validation pass>>");   	  	  	
  			document.forms["investorModel"].submit();
    	  }
    	  
    	 
  	  
    });
	
	
	
	

});



function confirmEdit(){
	 $(".addprotfolio").remove();
	var currentId=$("#invProtID").val();
	triggerEdit(currentId);
	$("#editConfirmationModel").modal('hide');
}

function triggerEdit(currentId){
	var cmpName=$("#"+currentId+"cmpname").text();
	var currcreditLine=$("#"+currentId+"currcreditLine").text();
	var mycreditLine=$("#"+currentId+"mycreditLine").text();
	var dicountRate=$("#"+currentId+"dicountRate").text();
	var utilised=$("#"+currentId+"utilised").text();
	$("#scfCompantName").text(cmpName);
	$("#editcurrCreditLine").val(currcreditLine);
	$("#editmyCreditLne").val(mycreditLine);
	$("#editDiscountRate").val(dicountRate);
	$("#editutilised").val(utilised);
	$("#editTemplate").removeClass("hide");
	currentId=currentId.replace("_","");
	$("#profolioId").val(currentId);
	//$("#editTemplate").slideToggle();
	$("#butonClass" ).hide(); 
	$("#addProtfolioBtn" ).hide();
}

function ajaxindicatorstart(text)
{
	if($('body').find('#resultLoading').attr('id') != 'resultLoading'){
	$('body').append('<div id="resultLoading" style="display:none"><div><img src="/tf-admin-portlet/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
	}
	
	$('#resultLoading').css({
		'width':'100%',
		'height':'100%',
		'position':'fixed',
		'z-index':'10000000',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto'
	});	
	
	$('#resultLoading .bg').css({
		'background':'#000000',
		'opacity':'0.7',
		'width':'100%',
		'height':'100%',
		'position':'absolute',
		'top':'0'
	});
	
	$('#resultLoading>div:first').css({
		'width': '250px',
		'height':'75px',
		'text-align': 'center',
		'position': 'fixed',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto',
		'font-size':'16px',
		'z-index':'10',
		'color':'#ffffff'
		
	});

    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeIn(300);
    $('body').css('cursor', 'wait');
}

function ajaxindicatorstop()
{
    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeOut(300);
    $('body').css('cursor', 'default');
}

$(document).ajaxStart(function () {
		//show ajax indicator
	ajaxindicatorstart('loading history data.. please wait..');
}).ajaxStop(function () {
	//hide ajax indicator
	ajaxindicatorstop();
});