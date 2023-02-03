<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Sign Up</h2>
		<div class="mt-2 d-flex justify-content-end">
			<a href="/univ/user/sign_in">Go back to Login</a>
		</div>
		<div>
			<h4>Type</h4>
			<label><input id="userTypeRadio" type="radio" id="type"
				name="type" value="student" class="type" checked="checked">Student</label>
			<label><input id="userTypeRadio" type="radio" id="type"
				name="type" value="professor" class="type">Professor</label>
		</div>

		<!-- Student's sign up form -->
		<jsp:include page="../form/studentForm.jsp" />

		<!-- Professor's sign up form -->
		<jsp:include page="../form/professorForm.jsp" />

	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$('.duplicateCheckBtn').on(
								'click',
								function() {
									let typeName = $('.type').val().trim();
									let userId = '';
									if (typeName == 'student') {
										userId = $('#studUserId').val();
									} else if (typeName == 'professor') {
										userId = $('#profUserId').val();
									}
									if (userId == '') {
										alert("Please write your user ID");
										$('#statusFill').removeClass('d-none');
										return;
									}
									$.ajax({
										url : "/user/duplicate_check",
										data : {
											"userId" : userId
										},
										success : function(data) {
											if (data.code == 0) {
												alert("usable");
												$('#statusUsable').removeClass(
														'd-none');
											} else if (data.code == 1) {
												$('#statusUnusable')
														.removeClass('d-none');
											} else if (data.code == 500) {
												alert("error");
											}
										},
										error : function(e) {

										}
									});
								});

						$('#birthMonth').change(function() {
							let monthInfo = $(this).val();
							let month = Math.floor(monthInfo / 100);
							let monthDays = monthInfo % 100;
							$('#birthDay').val(0);
							if (monthDays == '30') {
								$('#day31').addClass("d-none");
							} else if (monthDays == 28) {
								$('#day31').addClass("d-none");
								$('#day30').addClass("d-none");
								$('#day29').addClass("d-none");
							} else {
								$('#day31').removeClass("d-none");
								$('#day30').removeClass("d-none");
								$('#day29').removeClass("d-none");
							}
						});
						$('#birthDay').on('click', function() {
							if ($('#birthMonth').val() == 0) {
								alert("Please select your birth Month.");
								return false;
							}
						});

						$('input[name=type]').change(function() {
							var currentType = $(this).val();
							if (currentType == 'professor') {
								$('#professorFormView').removeClass('d-none');
								$('#studentFormView').addClass('d-none');
							} else {
								$('#studentFormView').removeClass('d-none');
								$('#professorFormView').addClass('d-none');
							}
						});

						$('#studentForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											let userId = $('#studUserId').val()
													.trim();
											if (userId == '') {
												alert("Please input your user ID");
												return false;
											}

											let password = $('#studPassword')
													.val().trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}

											let profileUrl = $(
													'#studProfileUrl').val()
													.trim();

											let firstName = $('#studFirstName')
													.val().trim();
											if (firstName == '') {
												alert("Please input your first name");
												return false;
											}

											let lastName = $('#studLastName')
													.val().trim();
											if (lastName == '') {
												alert("Please input your last name");
												return false;
											}

											let email = $('#studEmail').val()
													.trim();
											if (email == '') {
												alert("Please input your email");
												return false;
											}
											if (email.includes('@') == false
													&& email.includes('.') == false) {
												alert("Please check if this email is a valid email");
												return false;
											}

											let monthInfo = $('#studBirthMonth')
													.val();
											let birthDay = $('#studBirthDay')
													.val();
											let birthMonth = Math
													.floor(monthInfo / 100);
											let birthYear = $('#studBirthYear')
													.val().trim();

											if (birthYear == '-- Year --') {
												alert("Please fill up your birth year");
												return false;
											}
											if (birthMonth == '0') {
												alert("Please fill up your birth month");
												return false;
											}
											if (birthDay == '0') {
												alert("Please fill up your birth day");
												return false;
											}

											let gender = $('#studGender').val()
													.trim();
											if (gender == '-- Select --') {
												alert("Please select a proper gender.\nIf you don't want to disclose, please choose the option 'Prefer not to disclose.''");
												return false;
											}

											let url = $(this).attr('action');
											let params = $(this).serialize();

											$
													.post(url, params)
													.done(
															function(data) {
																if (data.code == 1) {
																	alert("Welcome "
																			+ firstName
																			+ "!");
																	location.href = "/univ";
																} else {
																	alert("error: "
																			+ data.code
																			+ " "
																			+ errormessage);
																}
															});
										});
						$('#professorForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											let userId = $('#profUserId').val()
													.trim();
											if (userId == '') {
												alert("Please input your user ID");
												return false;
											}

											let password = $('#profPassword')
													.val().trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}

											let profileUrl = $(
													'#profProfileUrl').val()
													.trim();

											let firstName = $('#profFirstName')
													.val().trim();
											if (firstName == '') {
												alert("Please input your first name");
												return false;
											}

											let lastName = $('#profLastName')
													.val().trim();
											if (lastName == '') {
												alert("Please input your last name");
												return false;
											}

											let email = $('#profEmail').val()
													.trim();
											if (email == '') {
												alert("Please input your email");
												return false;
											}
											if (email.includes('@') == false
													&& email.includes('.') == false) {
												alert("Please check if this email is a valid email");
												return false;
											}

											let monthInfo = $('#profBirthMonth')
													.val();
											let birthDay = $('#profBirthDay')
													.val();
											let birthMonth = Math
													.floor(monthInfo / 100);
											let birthYear = $('#profBirthYear')
													.val().trim();

											if (birthYear == '-- Year --') {
												alert("Please fill up your birth year");
												return false;
											}
											if (birthMonth == '0') {
												alert("Please fill up your birth month");
												return false;
											}
											if (birthDay == '0') {
												alert("Please fill up your birth day");
												return false;
											}

											let subject = $('#profSubject')
													.val().trim();
											if (subject == '-- Select Your Class --') {
												alert("Please select your class");
												return false;
											}

											let gender = $('#profGender').val()
													.trim();
											if (gender == '-- Select --') {
												alert("Please select a proper gender.\nIf you don't want to disclose, please choose the option 'Prefer not to disclose.'");
												return false;
											}

											let url = $(this).attr('action');
											let params = $(this).serialize();

											$
													.post(url, params)
													.done(
															function(data) {
																if (data.code == 1) {
																	alert("Welcome "
																			+ firstName
																			+ "!");
																	location.href = "/univ";
																} else {
																	alert("error: "
																			+ data.code
																			+ " "
																			+ errormessage);
																}
															});
										});
					});
</script>