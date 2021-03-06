$(function() {

	var today = new Date();

	$('#datepicker').datepicker({
		autoclose : true,
		format : 'yyyy-mm-dd',
	}).datepicker("setDate", $('#currentDay').val()).on('changeDate',
			function(e) {
				$('#currentDay').val($(this).val());
				$('#book_form').attr('action', root_url).submit();
			});

	$('#meeting_table tbody tr td').not(":first-child").hover(function() {
		var th = getThByTd($(this));
		th.addClass('th-hover');
		$(this).addClass('td_time_hover');
	}, function() {
		var th = getThByTd($(this));
		th.removeClass('th-hover');
		$(this).removeClass('td_time_hover');
	});

	$("#meeting_table tbody tr td").not(":first-child").click(function() {
		// add
		if ($(this).attr('type') == 'free') {
			var time = $(this).closest('tr').attr('time');
			var room = $(this).attr('room');

			$('#room_id').val(room);
			$('#start_time').val(time);

			$('#book_form').attr('action', booking_add_url).submit();
		}
		// edit
		else if ($(this).attr('type') == 'book') {
			$('#book_id').val($(this).attr('bookid'));
			$('#book_form').attr('action', booking_edit_url).submit();
		}

	});
});

function getThByTd(tdObj) {
	var index = tdObj.attr('room');
	var th = $('th[roomId="' + index + '"]');
	return th;
}

function test() {
	console.log('test');
}