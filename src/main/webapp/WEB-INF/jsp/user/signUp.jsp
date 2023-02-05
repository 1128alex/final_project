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

		<jsp:include page="../form/form.jsp" />
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let type = 'student';
						// Changing account type
						$('input[name=type]')
								.on(
										'click',
										function() {
											if (confirm("Are you sure you want to change your account type?") == true) {
												$('#subject').val('0');

												var currentType = $(this).val();
												type = currentType;
												if (currentType == 'professor') {
													$('#profSubject')
															.removeClass(
																	"d-none");
												} else {
													$('#profSubject').addClass(
															"d-none");
												}
											} else {
												return false;
											}

										});

						// Date Settings
						$('#birthMonth').change(function() {
							let monthInfo = $(this).val();
							let month = Math.floor(monthInfo / 100);
							let monthDays = monthInfo % 100;
							$('#birthDay').val('0');
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

						$('.birthDay').on('click', function() {
							if ($('#birthMonth').val() == '0') {
								alert("Please select your birth Month.");
								return false;
							}
						});

						$('#form')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											let email = $('#email').val()
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

											let password = $('#password').val()
													.trim();
											if (password == '') {
												alert("Please input your password");
												return false;
											}

											let passwordCheck = $(
													'#passwordCheck').val()
													.trim();
											if (passwordCheck == '') {
												alert("Please check your password");
												return false;
											}
											if (password != passwordCheck) {
												alert("Password does not match");
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

											let monthInfo = $('#birthMonth')
													.val();
											let birthDay = $('#birthDay').val();
											let birthMonth = Math
													.floor(monthInfo / 100);
											let birthYear = $('#birthYear')
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

											let subject = $('#subject').val();
											if (type == "professor"
													&& subject == '0') {
												alert("Please select your class");
												return false;
											}

											let gender = $('#gender').val()
													.trim();
											if (gender == '0') {
												alert("Please select a proper gender.\nIf you don't want to disclose, please choose the option 'Prefer not to disclose.'");
												return false;
											}

											let question = $('#verQues').val();
											if (question == '0') {
												alert("Please select a verification question.\nIt is needed when you lost your password.");
												return false;
											}

											let answer = $('#verAns').val()
													.trim();
											if (answer == '') {
												alert("Please provide the answer for the verification question.");
												return false;
											}

											let url = $(this).attr('action');
											let formData = new FormData();
											formData.append("type", type);
											formData.append("email", email);
											formData.append("password",
													password);
											if (profileUrl != '') {
												formData
														.append(
																"profileFile",
																$('#profileUrl')[0].files[0]);
											}
											formData.append("firstName",
													firstName);
											formData.append("lastName",
													lastName);
											formData.append("birthYear",
													birthYear);
											formData.append("birthMonth",
													birthMonth);
											formData.append("birthDay",
													birthDay);
											if (subject != '0') {
												formData.append("subject",
														subject);
											}
											formData.append("gender", gender);
											formData.append("verifyQuestion",
													question);
											formData.append("verifyAnswer",
													answer);

											$
													.ajax({
														type : "POST",
														url : url,
														data : formData,
														enctype : "multipart/form-data", // Required for file upload
														processData : false, // Required for file upload
														contentType : false, // Required for file upload
														success : function(data) {
															if (data.code == 2) {
																alert("An account created with this email already exists.");
																return false;
															}
															if (data.code == 1) {
																alert("Welcome "
																		+ firstName
																		+ "!");
																location.href = "/univ";
															} else {
																alert("error: "
																		+ data.code
																		+ " "
																		+ errorMessage);
																return false;
															}
														},
														error : function(e) {
															alert("error: " + e);
														}

													});
										});
					});
</script>