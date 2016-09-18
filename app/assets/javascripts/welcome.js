function hide_alert() {
  $('.alert-position').fadeOut(300, function() {
    $(this).remove();
  });
};

setTimeout(hide_alert, 3000);

function get_available_slots(url) {
	year = $('#booking_date_1i').val()
	month = $('#booking_date_2i').val()
	day = $('#booking_date_3i').val()
	date = year + '-' + month + '-' + day
	url_with_date = url + '?date=' + date
	$.ajax({
		url: url_with_date,
		dataType: "script"
	});
}