<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="studentFormView">
	<form method="post" id="studentForm" action="/user/sign_up_student">
		<div class="mt-2">
			<h4>Id</h4>
			<input type="text" id="userId" name="userId" class="form-control">
		</div>
		<div class="mt-2">
			<h4>Password</h4>
			<input type="password" id="password" name="password"
				class="form-control">
		</div>
		<div class="mt-2">
			<h4>Profile Image</h4>
			<input type="file" id="profileUrl" name="profileUrl">
		</div>
		<div class="mt-2">
			<h4>First Name</h4>
			<input type="text" id="firstName" name="firstName"
				class="form-control">
		</div>
		<div class="mt-2">
			<h4>Last Name/Given Name</h4>
			<input type="text" id="lastName" name="lastName" class="form-control">
		</div>
		<div class="mt-2">
			<h4>Email</h4>
			<input type="text" id="email" name="email" class="form-control">
		</div>
		<div class="mt-2">
			<h4>Birth Date</h4>
			<input type="text" id="birth" name="birth" class="form-control">
		</div>
		<div class="mt-2">
			<h4>Gender</h4>
			<select id="gender" name="gender" class="form-control">
				<option>-- Select --</option>
				<option>Prefer not to disclose</option>
				<option>Female</option>
				<option>Male</option>
				<option>Transgender</option>
				<option>Gender Neutral</option>
				<option>Non-binary</option>
				<option>Agender</option>
			</select>
		</div>

		<div class="d-flex justify-content-end mb-4">
			<button type="submit" class="btn button mt-3" id="loginBtn">Sign
				Up</button>
		</div>
	</form>
</div>