<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="professorFormView" class="d-none">
	<form method="post" id="professorForm" action="/user/sign_up_professor">
		<div class="mt-3">
			<h4>ID</h4>
			<div class="d-flex">
				<input type="text" id="profUserId" name="userId"
					class="form-control userId">
				<button type="button" class="duplicateCheckBtn btn button">Check</button>
			</div>
			<small class="text-success d-none statusUsable">Available ID</small>
			<small class="text-danger d-none statusUnusable">Already in
				use</small>
		</div>
		<div class="mt-3">
			<h4>Password</h4>
			<input type="password" id="profPassword" name="password"
				class="form-control password">
		</div>
		<div class="mt-1">
			<h4>Password Check</h4>
			<input type="password" id="profPasswordCheck" name="passwordCheck"
				class="form-control passwordCheck">
		</div>
		<div class="mt-3">
			<h4>Profile Image</h4>
			<input type="file" id="profProfileUrl" name="profileUrl"
				class="profileUrl">
		</div>

		<div class="mt-3">
			<h4>First Name</h4>
			<input type="text" id="profFirstName" name="firstName"
				class="form-control firstName">
		</div>
		<div class="mt-3">
			<h4>Last Name/Given Name</h4>
			<input type="text" id="profLastName" name="lastName"
				class="form-control lastName">
		</div>

		<div class="mt-3">
			<h4>Email</h4>
			<input type="text" id="profEmail" name="email"
				class="form-control email">
		</div>
		<h4 class="mt-3">Birth Date</h4>
		<div class="d-flex justify-content-between">
			<select name="birthYear" id="profBirthYear"
				class="form-control col-3 birthYear">
				<option value="0">-- Year --</option>
				<c:forEach var="j" begin="1900" end="${year}">
					<option id="year">${j}</option>
				</c:forEach>
			</select> <select name="birthMonth" id="profBirthMonth"
				class="form-control col-4 birthMonth">
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
			</select> <select name="birthDay" id="profBirthDay"
				class="form-control col-3 birthDay">
				<option value="0">-- Day --</option>
				<c:forEach var="i" begin="1" end="31">
					<option id="profDay${i}">${i}</option>
				</c:forEach>
			</select>
		</div>

		<div class="mt-3">
			<h4>Subject</h4>
			<select name="subject" id="profSubject" class="form-control subject">
				<option value="0">-- Select Your Class --</option>
				<option>Computer Science</option>
				<option>Math</option>
				<option>Science</option>
				<option>English</option>
				<option>Social Studies</option>
			</select>
		</div>

		<div class="mt-3">
			<h4>Gender</h4>
			<select name="gender" id="profGender" class="form-control gender">
				<option value="0">-- Select --</option>
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
			<button type="submit" class="btn button mt-3">Sign Up</button>
		</div>
	</form>
</div>