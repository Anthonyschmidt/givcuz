// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery.min
//= require bootstrap
//= require jquery-ui
//= require jquery.easing.min
//= require jquery.flexslider
//= require jquery.plugin
//= require jquery.ui.touch-punch.min
//= require less
//= require site
//= require jquery.themepunch.plugins.min
//= require jquery.themepunch.revolution



$(document).ready(function(){
	$('#buy-deal').bind('click', function(e){
		e.preventDefault();
		var deal_id = $(this).parent().find('#deal-id')[0].getAttribute('value');
		$.ajax({
			url: '/deals/buy',
			type: 'POST',
			data: {
				id: deal_id
			},
			success: function(resp) {
				window.location =  "/deals/checkout/" + deal_id;
			}
		});
		return false;
	});

	$("#confirm-payment").bind('click', function (e){
		e.preventDefault();
		var deal_id = $(this).parent().find('#deal-id')[0].getAttribute('value');
		$.ajax({
			url: '/deals/confirm',
			type: 'POST',
			data: {
				id: deal_id
			},
			success: function(resp) {
				if (resp.success) {
					window.location = '/deals/complete/' + resp.id_coupon + '/'
				}
			}
		});
		return false;
	});

	$('#contactForm').bind('click', function(e) {
			e.preventDefault();
			$.ajax({
				url: '/contact/send_contact_information',
				type: 'POST',
				data: {
					name: $('#inputName').val(),
					subject: $('#inputSubject').val(),
					email: $('#inputEmail').val(),
					message: $('#textArea').val()
				},
				success: function(resp) {
				}
			});
			return false;
	});
});