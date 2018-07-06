/*
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
AUI().ready(
	'aui-carousel', 'liferay-hudcrumbs', 'liferay-navigation-interaction', 'event-outside', 'aui-sortable-layout', 'aui-toggler',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('#breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var dockbar = A.one('.color-scheme-default .dockbar');

		if (dockbar) {
			A.all('#navigation .nav-item-dockbartoggle > a').each(function(btnDockbarToggle) {
				new A.Toggler(
					{
						content: dockbar,
						header: btnDockbarToggle,
						expanded: false
					}
				);
			});
		}

		var banner = A.one('.color-scheme-dashboard #banner');
		var btnNavigation = A.one('#navigation .nav-item-sitenavigationtoggle > a');

		if (banner) {
			var btnNavigationDockbar = A.one('#_145_navSiteNavigationNavbarBtn');

			if (!btnNavigationDockbar) {
				btnNavigationDockbar = btnNavigation;
			}
			else {
				btnNavigation.hide();
			}

			new A.Toggler(
				{
					content: banner,
					header: btnNavigationDockbar,
					expanded: false
				}
			);
		}
		else {
			var navigation = A.one(Liferay.Data.NAV_SELECTOR);

			if (btnNavigation) {
				btnNavigation.on(
					'click',
					function(event) {
						btnNavigation.toggleClass('open');
						navigation.toggleClass('open');
					}
				);
			}
		}

		var siteSearch = A.one('#sitesearch');

		if (siteSearch) {
			var btnSearch = siteSearch.one('a');

			var searchForm = siteSearch.one('.site-search-form');
			var searchField = searchForm.one('.site-search-field');

			btnSearch.on(
				'click',
				function(event) {
					event.preventDefault();

					if (searchForm.getStyle('width') == '0px') {
						siteSearch.removeClass('site-search-collapsed');
						searchField.focus();

						return;
					}
					else {
						if (searchField.get('value') == '') {
							siteSearch.addClass('site-search-collapsed');

							return;
						}
					}

					searchForm.submit();
				}
			);
		}
	}
);

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



