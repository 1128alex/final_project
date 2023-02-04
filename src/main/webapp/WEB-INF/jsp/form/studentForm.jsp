<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div id="studentFormView">
	<form method="post" id="studentForm" action="/user/sign_up_student">
		<div class="mt-3">
			<h4>Email</h4>
			<input type="text" id="studEmail" name="email"
				class="form-control email" placeholder="example@univ.com">
		</div>
		<div class="mt-3">
			<h4>Password</h4>
			<input type="password" id="studPassword" name="password"
				class="form-control password">
		</div>
		<div class="mt-1">
			<h4>Password Check</h4>
			<input type="password" id="studPasswordCheck" name="passwordCheck"
				class="form-control passwordCheck">
		</div>
		<div class="mt-3">
			<h4>Profile Image</h4>
			<input type="file" id="studProfileUrl" name="profileUrl"
				class="profileUrl">
		</div>

		<div class="d-flex justify-content-between mt-3">
			<div class="w-50 pr-2">
				<h4>First Name</h4>
				<input type="text" id="studFirstName" name="firstName"
					class="form-control firstName">
			</div>
			<div class="w-50 pl-2">
				<h4>Last Name</h4>
				<input type="text" id="studLastName" name="lastName"
					class="form-control lastName">
			</div>
		</div>

		<h4 class="mt-3">Birth Date</h4>
		<div class="d-flex justify-content-between">
			<select name="birthYear" id="studBirthYear"
				class="form-control col-3 birthYear">
				<option value="0">-- Year --</option>
				<c:forEach var="j" begin="1900" end="${year}">
					<option id="year">${j}</option>
				</c:forEach>
			</select> <select id="studBirthMonth" name="birthMonth"
				class="form-control col-4 birthMonth">
				<option value="0">-- Month --</option>
				<option value="131">January</option>
				<option value="228">February</option>
				<option value="331">March</option>
				<option value="430">April</option>
				<option value="531">May</option>
				<option value="630">June</option>
				<option value="731">July</option>
				<option value="831">August</option>
				<option value="930">September</option>
				<option value="1031">October</option>
				<option value="1130">November</option>
				<option value="1231">December</option>
			</select> <select id="studBirthDay" name="birthDay"
				class="form-control col-3 birthDay">
				<option value="0">-- Day --</option>
				<c:forEach var="i" begin="1" end="31">
					<option id="studDay${i}">${i}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mt-3">
			<h4>Gender</h4>
			<select id="studGender" name="gender" class="form-control gender">
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
