<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div>
	<form method="post" id="form" action="/user/sign_up">
		<div class="mt-3">
			<h4>Email</h4>
			<input type="text" id="email" name="email" class="form-control"
				placeholder="example@univ.com">
		</div>
		<div class="mt-3">
			<h4>Password</h4>
			<input type="password" id="password" name="password"
				class="form-control">
		</div>
		<div class="mt-1">
			<h4>Password Check</h4>
			<input type="password" id="passwordCheck" name="passwordCheck"
				class="form-control">
		</div>
		<div class="mt-3">
			<h4>Profile Image</h4>
			<input type="file" id="profileUrl" name="profileUrl"
				class="profileUrl">
		</div>

		<div class="d-flex justify-content-between mt-3">
			<div class="mt-3">
				<h4>First Name</h4>
				<input type="text" id="firstName" name="firstName"
					class="form-control">
			</div>
			<div class="mt-3">
				<h4>Last Name/Given Name</h4>
				<input type="text" id="lastName" name="lastName"
					class="form-control">
			</div>
		</div>

		<h4 class="mt-3">Birth Date</h4>
		<div class="d-flex justify-content-between">
			<select name="birthYear" id="birthYear" class="form-control col-3">
				<option value="0">-- Year --</option>
				<c:forEach var="j" begin="1900" end="${year}">
					<option id="year">${j}</option>
				</c:forEach>
			</select> <select name="birthMonth" id="birthMonth" class="form-control col-4">
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
			</select> <select name="birthDay" id="birthDay" class="form-control col-3">
				<option value="0">-- Day --</option>
				<c:forEach var="i" begin="1" end="31">
					<option id="day${i}">${i}</option>
				</c:forEach>
			</select>
		</div>

		<div id="profSubject" class="mt-3 d-none">
			<h4>Subject</h4>
			<select name="subject" id="subject" class="form-control">
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
			<select name="gender" id="gender" class="form-control">
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

		<div class="mt-3">
			<h4>Verification Question</h4>
			<select id="verQues" name="verifyQuestion" class="form-control">
				<option value="0">-- Question --</option>
				<option>What is your favorite book?</option>
				<option>What is your favorite sport?</option>
				<option>What is your favorite movie?</option>
				<option>What is your best friend's name?</option>
				<option>Who is your childhood hero?</option>
			</select>
			<h4>Verification Answer</h4>
			<input type="text" id="verAns" name="verifyAnswer"
				class="form-control">
		</div>

		<div class="d-flex justify-content-end mb-4">
			<button type="submit" class="btn button mt-3">Sign Up</button>
		</div>
	</form>
</div>