<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold text-center">Update Account</h2>
		<div>
			<h4>Type</h4>
			<label><input type="radio" name="type" value="student"
				class="type" disabled="disabled">Student</label> <label><input
				type="radio" name="type" value="professor" class="type"
				disabled="disabled">Professor</label>
		</div>

		<div>
			<form method="post" id="form" action="/user/edit_profile">
				<div class="mt-3">
					<h4>Email</h4>
					<input type="text" id="email" name="email" class="form-control"
						placeholder="example@univ.com" value="${user.email}"
						data-email="${user.email}"><small id="emailUsableAlert"
						class="text-success d-none">Available email</small> <small
						id="invalidEmailAlert" class="text-danger d-none">Please
						check if the email is a valid email.</small> <small id="emailDupAlert"
						class="text-danger d-none">The account with this email
						already exists.</small>
				</div>

				<div class="mt-3">
					<h4>Reset Password</h4>
					<a id="resetPassword" href="#">Reset</a>
				</div>

				<div class="mt-3">
					<h4>Profile Image</h4>
					<input type="file" id="profileUrl" name="profileUrl">
					<div class="text-danger">* If you had a profile picture, you
						have to re-select your profile picture.</div>
				</div>

				<div class="d-flex mt-3">
					<div class="mt-3">
						<h4>First Name</h4>
						<input type="text" id="firstName" name="firstName"
							class="form-control" value="${user.firstName}">
					</div>
					<div class="mt-3 ml-3">
						<h4>Last Name/Given Name</h4>
						<input type="text" id="lastName" name="lastName"
							class="form-control" value="${user.lastName}">
					</div>
				</div>
				<h4 class="mt-3">Birth Date</h4>
				<div class="d-flex justify-content-between">
					<select name="birthYear" id="birthYear" class="form-control col-3">
						<option value="0">-- Year --</option>
						<c:forEach var="j" begin="1900" end="${year}">
							<option id="year">${j}</option>
						</c:forEach>
					</select> <select name="birthMonth" id="birthMonth"
						class="form-control col-4">
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

				<div class="d-flex justify-content-between mt-3 mb-4">
					<div>
						<button type="button" id="deleteBtn" class="btn delButton">Delete</button>
					</div>
					<div>
						<button type="submit" class="btn button">Edit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="dataHolder" data-type="${user.type}"
		data-email="${user.email}" data-profile="${user.profileUrl}"
		data-birth-year="${birthYear}" data-birth-month="${birthMonth}"
		data-birth-date="${birthDate}" data-gender="${user.gender}"></div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let type = $('#dataHolder').data('type');
						let prevProfile = $('#dataHolder').data('profile');
						let prevEmail = $('#dataHolder').data('email');
						let year = $('#dataHolder').data('birth-year');
						let month = $('#dataHolder').data('birth-month');
						let day = $('#dataHolder').data('birth-date');
						let gender = $('#dataHolder').data('gender');

						$('input[name=type][value='.concat(type, ']')).prop(
								'checked', true);
						$('#birthYear').val(year).prop('selected', true);
						$('#birthMonth').val(month).prop('selected', true);
						$('#birthDay').val(day).prop('selected', true);
						$('#gender').val(gender).prop('selected', true);

						$('#resetPassword')
								.on(
										'click',
										function(e) {
											e.preventDefault();
											let email = $('#email').data(
													'email');
											if (confirm('The changes you made will not be saved. Do you want to leave this page?')) {
												location.href = "/univ/user/reset_password?signedIn=1&email="
														+ email;
											}
										})

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
									if (email == prevEmail) {
										return;
									}

									if (email.includes('@') == false
											|| email.includes('.') == false
											|| email.includes('/')) {
										$('#invalidEmailAlert').removeClass(
												'd-none');
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
													|| email.includes('.') == false) {
												alert("Please check if the email is a valid email");
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

											let gender = $('#gender').val()
													.trim();
											if (gender == '0') {
												alert("Please select a proper gender.\nIf you don't want to disclose, please choose the option 'Prefer not to disclose.'");
												return false;
											}

											let url = $(this).attr('action');
											let formData = new FormData();
											formData.append("prevProfile",
													prevProfile);
											formData.append("prevEmail",
													prevEmail);
											formData.append("email", email);
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
											formData.append("gender", gender);

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
																alert("Account information updated!");
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
						$('#deleteBtn')
								.on(
										'click',
										function() {
											if (!confirm("Are you sure you want to delete this account? You will not be able to withdraw your choice.")) {
												return;
											}
											$
													.ajax({
														type : "DELETE",
														url : "/user/delete_user",
														data : {
															"email" : prevEmail
														},
														success : function(data) {
															alert("Account "
																	+ prevEmail
																	+ " deleted!");
															location.href = "/univ/user/sign_in";
														},
														error : function(e) {

														}
													})
										})
					});
</script>