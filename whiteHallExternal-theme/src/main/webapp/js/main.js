AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/
		
	function() {
		
		(function(){
				    
			var getContentId = (window.location.hash != "")?window.location.hash:window.location.hash;
			
			if(getContentId != ""){
			 var diff = (jQuery(getContentId).offset())?jQuery(getContentId).offset().top - 40:0;
			    jQuery('html,body').animate( { scrollTop:(diff) } , 1000);
			}
			
		}());
		
		/* header fix while scroll */
		$( window ).scroll(function() {
		    $("#banner").toggleClass("fixed-pos", $(this).scrollTop() > 1);
		});
		
		$(document).ready(function(){

			var scroll = $(window).scrollTop();
			if(scroll > 1){
				$("#banner").addClass("fixed-pos");
			} else {
				$("#banner").removeClass("fixed-pos");
			};
			
			/* Home Banner */
			$( '#heroSlider' ).sliderPro({
				width: '100%',
				height: 630,
				fade: true,
				fadeOutPreviousSlide : true,
				fadeDuration: 1000,
				arrows: true,
				buttons: false,
				fullScreen: false,
				thumbnails: false,
				thumbnailArrows: false,
				autoplay: false,
				touchSwipe: false,
				forceSize: 'fullWidth',
				waitForLayers : true,
				slideDistance: 0,
			    autoScaleLayers: false,
			    autoScaleReference: '50%'
			});
			
			/* Sucess Stories */
			if($('.client-tele-list').size() > 0){
				$('.client-tele-list').slick({
				  dots: true,
				  infinite: true,
				  speed: 300,
				  slidesToShow: 1,
				  adaptiveHeight: true,
				  arrows : false
				});
			}
			
			/*Start: Animation*/
			function initAnimations(){
				//getting all animated elements and length
				var animatedEle = $("[data-animation]"), animatedEleLength = animatedEle.length; 
				
				// removing opacity
				$(animatedEle).addClass("no-opacity");
				
				$(animatedEle).each(function( index ){
					
					var animationClass = "animated " + $(this).attr("data-animation");  
					$(this).viewportChecker({
						classToAdd: animationClass,
						classToRemove: 'no-opacity',
						offset: "10%",
						removeClassAfterAnimation: true
					});
				});
				
			}
			initAnimations();
			/*End: Animation*/
			
		});
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
		
	}
);


