$(document).ready(function() {
	$('button#check').click(function() {
		$('#reply').html("(Checking...)");
		$.ajax({
			type: "POST",
			url: "check.php",
			data: $('form#typeform').serialize(),
			success: function(result) {
				$('#reply').html(result);
			}
		});

	});










});
