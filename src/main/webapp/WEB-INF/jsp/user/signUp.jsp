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
			<label><input id="userTypeRadioStud" type="radio" id="type"
				name="type" value="student" class="type" checked="checked">Student</label>
			<label><input id="userTypeRadioProf" type="radio" id="type"
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

						let validationCount = 0;
						let typeName = $('input[name=type]').val().trim();

						// Changing account type
						$('input[name=type]')
								.on(
										'click',
										function() {
											if (confirm("Are you sure you want to change your account type?\nIt will delete every information that you have written.") == true) {
												$('.statusUsable').addClass(
														'd-none');
												$('.statusUnusable').addClass(
														'd-none');
												$('.userId').val('');
												$('.password').val('');
												$('.passwordCheck').val('');
												$('.profileUrl').val('');
												$('.firstName').val('');
												$('.lastName').val('');
												$('.email').val('');
												$('.birthYear').val('0');
												$('.birthMonth').val('0');
												$('.birthDay').val('0');
												$('.subject').val('0');
												$('.gender').val('0');

												var currentType = $(this).val();
												if (currentType == 'professor') {
													/* $('#userTypeRadioProf')
															.attr("disabled",
																	true);
													$('#userTypeRadioStud')
															.attr("disabled",
																	false); */
													$('#professorFormView')
															.removeClass(
																	'd-none');
													$('#studentFormView')
															.addClass('d-none');
													typeName = 'professor';
												} else {
													/* $('#userTypeRadioStud')
															.attr("disabled",
																	true);
													$('#userTypeRadioProf')
															.attr("disabled",
																	false); */
													$('#studentFormView')
															.removeClass(
																	'd-none');
													$('#professorFormView')
															.addClass('d-none');
													typeName = 'student';
												}
												validationCount = 0;
											} else {
												return false;
											}
										});
						// Id duplication check
						$('.duplicateCheckBtn').on(
								'click',
								function() {
									$('.statusUsable').addClass('d-none');
									$('.statusUnusable').addClass('d-none');
									$('.passwordStatus').addClass("d-none");

									let userId = '';
									if (typeName == 'student') {
										userId = $('#studUserId').val();
									} else if (typeName == 'professor') {
										userId = $('#profUserId').val();
									}
									if (userId == '') {
										alert("Please write your user ID");
										return;
									}
									validationCount++;

									$.ajax({
										url : "/user/duplicate_check",
										data : {
											"userId" : userId
										},
										success : function(data) {
											if (data.code == 0) {
												$('.statusUsable').removeClass(
														'd-none');
											} else if (data.code == 1) {
												$('.statusUnusable')
														.removeClass('d-none');
											} else if (data.code == 500) {
												alert("error");
											} else {
												alert("unknown error");
											}
										},
										error : function(e) {
											alert(e);
										}
									});
								});

						// Date Settings
						$('#studBirthMonth').change(function() {
							let monthInfo = $(this).val();
							let month = Math.floor(monthInfo / 100);
							let monthDays = monthInfo % 100;
							$('#studBirthDay').val(0);
							if (monthDays == '30') {
								$('#studDay31').addClass("d-none");
							} else if (monthDays == 28) {
								$('#studDay31').addClass("d-none");
								$('#studDay30').addClass("d-none");
								$('#studDay29').addClass("d-none");
							} else {
								$('#studDay31').removeClass("d-none");
								$('#studDay30').removeClass("d-none");
								$('#studDay29').removeClass("d-none");
							}
						});
						$('#profBirthMonth').change(function() {
							let monthInfo = $(this).val();
							let month = Math.floor(monthInfo / 100);
							let monthDays = monthInfo % 100;
							$('#profBirthDay').val(0);
							if (monthDays == '30') {
								$('#profDay31').addClass("d-none");
							} else if (monthDays == 28) {
								$('#profDay31').addClass("d-none");
								$('#profDay30').addClass("d-none");
								$('#profDay29').addClass("d-none");
							} else {
								$('#profDay31').removeClass("d-none");
								$('#profDay30').removeClass("d-none");
								$('#profDay29').removeClass("d-none");
							}
						});

						$('.birthDay')
								.on(
										'click',
										function() {
											if ($('#profBirthMonth').val() == '0'
													&& $('#studBirthMonth')
															.val() == '0') {
												alert("Please select your birth Month.");
												return false;
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

											if (validationCount == 0) {
												alert("Please check the validation for your ID");
												return false;
											}

											let password = $('#studPassword')
													.val().trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}
											let passwordCheck = $(
													'#studPasswordCheck').val()
													.trim();
											if (passwordCheck == '') {
												alert("Please check your password");
												return false;
											}
											if (password != passwordCheck) {
												alert("Password does not match");
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
													|| email.includes('.') == false) {
												alert("Please check if the email is a valid email");
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

											if (birthYear == '0') {
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
											if (gender == '0') {
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

											if (validationCount == 0) {
												alert("Please check the validation for your ID");
												return false;
											}

											let password = $('#profPassword')
													.val().trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}

											let passwordCheck = $(
													'#profPasswordCheck').val()
													.trim();
											if (passwordCheck == '') {
												alert("Please check your password");
												return false;
											}
											if (password != passwordCheck) {
												alert("Password does not match");
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
													|| email.includes('.') == false) {
												alert("Please check if the email is a valid email");
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

											if (birthYear == '0') {
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
											if (gender == '0') {
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
																	location.href = "/univ/professor";
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