<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="professorFormView" class="d-none">
	<form method="post" id="professorForm" action="/user/sign_up_professor">
		<div class="mt-2">
			<h4>Id</h4>
			<div class="d-flex">
				<input type="text" id="profUserId" name="userId"
					class="form-control">
				<button type="button" id="duplicateCheckBtn"
					class="duplicateCheckBtn btn button">Check</button>
			</div>
			<small id="statusUsable" class="text-success d-none">Usable</small> <small
				id="statusUnusable" class="text-danger d-none">Already in
				use</small><small id="statusFill" class="text-danger d-none">Please
				write your user ID</small>
		</div>
		<div class="mt-2">
			<h4>Password</h4>
			<input type="password" id="profPassword" name="password"
				class="form-control">
		</div>
		<div class="mt-2">
			<h4>Profile Image</h4>
			<input type="file" id="profProfileUrl" name="profileUrl">
		</div>
		<div class="mt-2">
			<h4>First Name</h4>
			<input type="text" id="profFirstName" name="firstName"
				class="form-control">
		</div>
		<div class="mt-2">
			<h4>Last Name/Given Name</h4>
			<input type="text" id="profLastName" name="lastName"
				class="form-control">
		</div>
		<div class="mt-2">
			<h4>Email</h4>
			<input type="text" id="profEmail" name="email" class="form-control">
		</div>
		<h4 class="mt-2">Birth Date</h4>
		<div class="d-flex justify-content-between">
			<select name="birthYear" id="profBirthYear"
				class="form-control col-3">
				<option>-- Year --</option>
				<c:forEach var="j" begin="1900" end="${year}">
					<option id="year">${j}</option>
				</c:forEach>
			</select> <select name="birthMonth" id="profBirthMonth"
				class="form-control col-4">
				<option id="months" value="0">-- Month --</option>
				<option id="months" value="131">January</option>
				<option id="months" value="228">February</option>
				<option id="months" value="331">March</option>
				<option id="months" value="430">April</option>
				<option id="months" value="531">May</option>
				<option id="months" value="630">June</option>
				<option id="months" value="731">July</option>
				<option id="months" value="831">August</option>
				<option id="months" value="930">September</option>
				<option id="months" value="1031">October</option>
				<option id="months" value="1130">November</option>
				<option id="months" value="1231">December</option>
			</select> <select name="birthDay" id="profBirthDay" class="form-control col-3">
				<option value="0">-- Day --</option>
				<c:forEach var="i" begin="1" end="31">
					<option id="day${i}">${i}</option>
				</c:forEach>
			</select>
		</div>

		<div class="mt-2">
			<h4>Subject</h4>
			<select name="subject" id="profSubject" class="form-control">
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
			<select name="gender" id="profGender" class="form-control">
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