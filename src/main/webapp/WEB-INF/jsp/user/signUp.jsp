<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Sign Up</h2>
		<div class="mt-2 d-flex justify-content-end">
			<a href="/univ/user/sign_in">Go back to Login</a>
		</div>
		<form method="post" action="user/sign_up">
			<div>
				<h4>Type</h4>
				<label><input id="userTypeRadio" type="radio" name="type"
					value="student" checked="checked">Student</label> <label><input
					id="userTypeRadio" type="radio" name="type" value="professor">Professor</label>
			</div>
			<div class="mt-2">
				<h4>Id</h4>
				<input type="text" class="form-control">
			</div>
			<div class="mt-2">
				<h4>Password</h4>
				<input type="password" class="form-control">
			</div>
			<div class="mt-2">
				<h4>First Name</h4>
				<input type="text" class="form-control">
			</div>
			<div class="mt-2">
				<h4>Last Name/Given Name</h4>
				<input type="text" class="form-control">
			</div>
			<div class="mt-2">
				<h4>Gender</h4>
				<input type="radio" name="gender" class="form-control"
					value="female"> <input type="radio" name="gender"
					class="form-control" value="male">
			</div>




			<div class="d-flex justify-content-end">
				<button type="submit" class="btn button mt-3" id="loginBtn">Sign
					Up</button>
			</div>
		</form>
	</div>
</div>