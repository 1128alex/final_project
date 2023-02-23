<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-4"></div>
	<div class="col-4">
		<div class="mt-3">
			<h4>New Password</h4>
			<input type="password" id="password" name="password"
				class="form-control">
		</div>
		<div class="mt-1">
			<h4>New Password Check</h4>
			<input type="password" id="passwordCheck" name="passwordCheck"
				class="form-control">
		</div>
		<button type="button" id="resetBtn" class="btn button">Reset</button>
	</div>
	<div class="col-4"></div>
	<div id="emailHolder" data-email="${email}"></div>
</div>

<script>
	$(document).ready(function() {
		$('#resetBtn').on('click', function() {
			let email = $('#emailHolder').data("email");
			let password = $('#password').val().trim();
			let passwordCheck = $('#passwordCheck').val().trim();

			if (password == '') {
				alert("Please input your password");
				return;
			}

			if (passwordCheck == '') {
				alert("Please check your password");
				return;
			}
			if (password != passwordCheck) {
				alert("Password does not match");
				return;
			}

			$.ajax({
				type : "POST",
				url : "/user/reset_password",
				data : {
					"email" : email,
					"password" : password
				},
				success : function(data) {
					if (data.code == 1) {
						alert("Password reset!");
						location.href = "/univ/user/sign_in";
					} else {
						alert("error " + data.code + ": " + data.errorMessage);
					}
				},
				error : function(e) {
					alert("error: " + e);
				}
			});
		});
	});
</script>