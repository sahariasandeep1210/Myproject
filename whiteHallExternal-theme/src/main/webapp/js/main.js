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
				waitForLayers : false,
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
			
			/*Start: Map*/
			var marker;
			var _lat = 51.504564
			var _long = -0.126229
			
			var address = 'London, UK';
			function initMap() {
		        var map = new google.maps.Map(document.getElementById('map'), {
		        	 mapTypeId: google.maps.MapTypeId.TERRAIN,
		             zoom: 6
		          //zoom: 15,
		         // center: {lat: _lat, lng: _long}
				});
		        
		        var geocoder = new google.maps.Geocoder();
		        geocoder.geocode({
		            'address': address
		         }, 
		         function(results, status) {
		            if(status == google.maps.GeocoderStatus.OK) {
		               new google.maps.Marker({
		                  position: results[0].geometry.location,
		                  map: map
		               });
		               map.setCenter(results[0].geometry.location);
		            }
		         });

		     /*   marker = new google.maps.Marker({
		          map: map,
		          draggable: true,
		          animation: google.maps.Animation.DROP,
		          position: {lat: _lat, lng: _long}
		        });*/
		       // marker.addListener('click', toggleBounce);
		    }

		    function toggleBounce() {
		        if (marker.getAnimation() !== null) {
		          marker.setAnimation(null);
		        } else {
		          marker.setAnimation(google.maps.Animation.BOUNCE);
		        }
		    }
		    if(!!document.getElementById('map')){
		    	initMap();
		    }
		    /*End: Map*/
			
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


