$(document).ready(function() {
	buttonListner();
});

var buttonListner = function() {
	$('#round-login').on('click', function(event) {
		event.preventDefault();

		var $loginButton = $(this);

		var ajaxRequest = $.ajax({
			url: $loginButton.attr('href'),
			type: 'GET'
		});
		
		ajaxRequest.done(function(response) {
			$('ul').append(response);
		});

		ajaxRequest.fail(function(response) {
			console.log('Something went wrong!', response)
		});
	});
}


