<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="professorFormView" class="d-none">
	<form method="post" id="professorForm" action="user/sign_up_professor">
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
			<h4>Subject</h4>
			<select id="subject" name="subject" class="form-control">
				<option>-- Select Your Class --</option>
				<option>Computer Science</option>
				<option>Math</option>
				<option>Science</option>
				<option>English</option>
				<option>Social Studies</option>
			</select>
		</div>

		<div class="mt-2">
			<h4>Gender</h4>
			<div class="d-flex">
				<div class="d-flex">
					<label> <input type="radio" id="gender" name="gender"
						value="female">Female
					</label>
				</div>
				<div class="d-flex">
					<label><input type="radio" id="gender" name="gender"
						value="male">Male</label>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-end mb-4">
			<button type="submit" class="btn button mt-3" id="loginBtn">Sign
				Up</button>
		</div>
	</form>
</div>