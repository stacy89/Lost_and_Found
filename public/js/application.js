// $(document).ready(function() {
// 	buttonListner();
// });
// // When the login button is clicked the login form should
// // pop up under the button itself instead of redirecting to the login page
// var buttonListner = function() {
// 	$('#form-button').on('click', function(event) {
// 		event.preventDefault();

// 		var $loginButton = $(this);

// 		var ajaxRequest = $.ajax({
// 			url: $loginButton.attr('action'),
// 			type: $loginButton.attr('method')
// 		});
// 		// need to figure out what class/id I should apppend when the button is clicked
// 		ajaxRequest.done(function(response) {
// 			console.log(response);
// 			$('ul').append('#login-form');
// 		});

// 		ajaxRequest.fail(function(response) {
// 			console.log('Something went wrong!', response)
// 		});

// 	});
// }

