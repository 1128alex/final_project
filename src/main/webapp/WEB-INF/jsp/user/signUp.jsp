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
				name="type" value="student" checked="checked">Student</label> <label><input
				id="userTypeRadio" type="radio" id="type" name="type"
				value="professor">Professor</label>
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
						$('#birthMonth').change(function() {
							let monthInfo = $(this).val();
							let month = Math.floor(monthInfo / 100);
							let monthDays = monthInfo % 100;
							if (monthDays == '30') {
								$('#day31').addClass("d-none");
							} else if (monthDays == 28) {
								$('#day31').addClass("d-none");
								$('#day30').addClass("d-none");
								$('#day29').addClass("d-none");
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

											let userId = $('#userId').val()
													.trim();
											if (userId == '') {
												alert("Please input your user ID");
												return false;
											}

											let password = $('#password').val()
													.trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}

											let profileUrl = $('#profileUrl')
													.val().trim();

											let firstName = $('#firstName')
													.val().trim();
											if (firstName == '') {
												alert("Please input your first name");
												return false;
											}

											let lastName = $('#lastName').val()
													.trim();
											if (lastName == '') {
												alert("Please input your last name");
												return false;
											}

											let email = $('#email').val()
													.trim();
											if (email == '') {
												alert("Please input your email");
												return false;
											}

											let birthDay = $('#birthDay').val();
											let birthMonth = month;
											let birthYear = $('#birthYear')
													.val().trim();
											if (birthDay == '-- Day --'
													|| birthMonth == '-- Month --'
													|| birthYear == '-- Year --') {
												alert("Please fill up your birth date");
												return false;
											}

											let gender = $('#gender').val()
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
					});
</script>