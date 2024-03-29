<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold text-center">Create Account</h2>
		<div>
			<h4>Type</h4>
			<label><input type="radio" name="type" value="student"
				class="type" checked="checked">Student</label> <label><input
				type="radio" name="type" value="professor" class="type">Professor</label>
		</div>

		<jsp:include page="../form/form.jsp" />
		<hr>
		<div class="d-flex justify-content-center mb-2">
			<div>Already have an account?</div>
			<a href="/univ/user/sign_in" class="underline noDecoA ml-1">Sign
				in</a>
		</div>
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
								$('#day30').removeClass("d-none");
								$('#day29').removeClass("d-none");
							} else if (monthDays == '28') {
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
							if ($('#birthMonth').val() == '0') {
								alert("Please select your birth Month.");
								return false;
							}
						});

						$('#email').on(
								'change',
								function() {
									$('#emailDupAlert').addClass('d-none');
									$('#emailUsableAlert').addClass('d-none');
									$('#invalidEmailAlert').addClass('d-none');

									let email = $('#email').val().trim();
									if (email.includes('@') == false
											|| email.includes('.') == false) {
										$('#invalidEmailAlert').removeClass(
												"d-none");
										return;
									}
									$.ajax({
										type : "GET",
										url : "/user/check_email_dup",
										data : {
											"email" : email
										},
										success : function(data) {
											if (data.code == 500) {
												$('#emailDupAlert')
														.removeClass("d-none");
											} else if (data.code == 1) {
												$('#emailUsableAlert')
														.removeClass("d-none");
											}
										},
										error : function(e) {
											alert("error: " + e);
										}
									})
								})

						$('#form')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											if ($('#invalidEmailAlert')
													.hasClass("d-none") == false) {
												alert("Please check if the email is a valid email.")
												return false;
											}
											if ($('#emailDupAlert').hasClass(
													"d-none") == false) {
												alert("The account with this email already exists.")
												return false;
											}

											let email = $('#email').val()
													.trim();
											if (email == '') {
												alert("Please input your email");
												return false;
											}
											if (email.includes('@') == false
													|| email.includes('.') == false
													|| email.includes('/')) {
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
															if (data.code == 1) {
																alert("Welcome "
																		+ firstName
																		+ "!");
																location.href = "/univ/course/class_list";
															} else {
																alert("error "
																		+ data.code
																		+ ": "
																		+ data.errorMessage);
															}
														},
														error : function(e) {
															alert("error: " + e);
														}

													});
										});
					});
</script>