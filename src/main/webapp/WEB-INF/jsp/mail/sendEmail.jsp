<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<input type="text" id="to" name="to" class="form-control mt-3">
		<input id="title" name="title" type="text" class="form-control mt-3">
		<textarea rows="4" cols="" id="message" name="message"
			class="form-control mt-3"></textarea>
		<div class="d-flex justify-content-end">
			<button type="button" id="sendBtn" class="btn button mt-3">Send</button>
		</div>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(function() {
		$('#sendBtn').on('click', function() {
			let to = $('#to').val();
			let title = $('#title').val();
			let message = $('#message').val();

			$.ajax({
				type : "GET",
				url : "/mail/send_email",
				data : {
					"to" : to,
					"title" : title,
					"message" : message
				},
				success : function(data) {
					alert("success");
					location.href = "/univ";
				},
				error : function(e) {
					alert("error: " + e);
				}
			});
		});
	});
</script>