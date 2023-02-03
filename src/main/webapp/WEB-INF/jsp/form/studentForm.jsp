<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h4 class="mt-2">Birth Date</h4>
		<div class="d-flex justify-content-between">
			<select name="birthYear" id="birthYear" class="form-control col-3">
				<option>-- Year --</option>
				<c:forEach var="j" begin="1900" end="${year}">
					<option id="year">${j}</option>
				</c:forEach>
			</select> <select name="birthMonth" id="birthMonth" class="form-control col-4">
				<option id="months" data-max-days="0" value="0">-- Month --</option>
				<option id="months" data-max-days="31" value="131">January</option>
				<option id="months" data-max-days="28" value="228">February</option>
				<option id="months" data-max-days="31" value="331">March</option>
				<option id="months" data-max-days="30" value="430">April</option>
				<option id="months" data-max-days="31" value="531">May</option>
				<option id="months" data-max-days="30" value="630">June</option>
				<option id="months" data-max-days="31" value="731">July</option>
				<option id="months" data-max-days="31" value="831">August</option>
				<option id="months" data-max-days="30" value="930">September</option>
				<option id="months" data-max-days="31" value="1031">October</option>
				<option id="months" data-max-days="30" value="1130">November</option>
				<option id="months" data-max-days="31" value="1231">December</option>
			</select> <select name="birthDay" id="birthDay" class="form-control col-3">
				<option>-- Day --</option>
				<c:forEach var="i" begin="1" end="31">
					<option id="day${i}">${i}</option>
				</c:forEach>
			</select>
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
