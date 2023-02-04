<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-4 font-weight-bold">Login</h2>
		<form id="signInForm" method="post" action="/user/sign_in">
			<div class="mt-3">
				<label>Student Number / Email Adress</label> <input type="text"
					name="userId" id="userId" class="form-control"
					placeholder="Input your Id/Email">
			</div>
			<div class="mt-2">
				<label>Password</label> <input type="password" name="password"
					id="password" class="form-control"
					placeholder="Input your Password">
			</div>
			<div class="d-flex justify-content-between">
				<div class="mt-2">
					Don't have an Id? <a href="/univ/user/sign_up">Sign Up</a>
				</div>
				<button type="submit" class="btn button mt-3" id="loginBtn">Login</button>
			</div>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#signInForm').on('submit', function(e) {
			e.preventDefault();
			let userId = $('#userId').val().trim();
			if (userId == '') {
				alert("Please write your ID.");
				return false;
			}

			let password = $('#password').val().trim();
			if (password == '') {
				alert("Please write your password.");
				return false;
			}

			$.ajax({
				type : "POST",
				url : "/user/sign_in",
				data : {
					"userId" : userId,
					"password" : password
				},
				success : function(data) {
					if (data.code == 1) {
						if (data.type == 'professor') {
							location.href = "/univ/professor";
						} else if (data.type = "student") {
							location.href = "/univ";
						}
					} else if (data.code == 500) {
						alert(data.errorMessage);
					}
				},
				error : function(e) {
					alert("error: " + e);
				}
			});
		});
	});
</script>