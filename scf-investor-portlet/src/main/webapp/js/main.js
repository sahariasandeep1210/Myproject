$(document).ready(function() {
	
	  investorIndex = 0;
	  $("#saveProtfolios").hide();
	  
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
          }else{
        	  $("#saveProtfolios").hide();
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
            }else{
          	  $("#saveProtfolios").hide();
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
    		  $("#editConfirmationModel").modal('show');
    	  }else{
    		  console.log("Do Edit >>");
    		  $(".addprotfolio").remove();
    		  var currentID=$(this).attr('id');
    		  triggerEdit(currentID);
    	
    	  }  	  
    	  
      });
      
      $('#investorModel').on('click', '#editCancel', function() {
    	    $("#editTemplate").addClass("hide");
    		$("#butonClass" ).show(); 
    		$("#addProtfolioBtn" ).show();
    	  
      });
      
      $('#investorModel').on('click', '#updatebtn', function() {
    	  	var url = $(this).attr('data-url');
    	  	document.forms["investorModel"].action = url;
			document.forms["investorModel"].submit();
    	  
      });
	
	
	
	

});





function triggerEdit(currentId){
	var cmpName=$("#"+currentId+"cmpname").text();
	var currcreditLine=$("#"+currentId+"currcreditLine").text();
	var mycreditLine=$("#"+currentId+"mycreditLine").text();
	var dicountRate=$("#"+currentId+"dicountRate").text();
	$("#scfCompantName").text(cmpName);
	$("#editcurrCreditLine").val(currcreditLine);
	$("#editmyCreditLne").val(mycreditLine);
	$("#editDiscountRate").val(dicountRate);
	$("#editTemplate").removeClass("hide");
	currentId=currentId.replace("_","");
	$("#profolioId").val(currentId);
	//$("#editTemplate").slideToggle();
	$("#butonClass" ).hide(); 
	$("#addProtfolioBtn" ).hide();
}
