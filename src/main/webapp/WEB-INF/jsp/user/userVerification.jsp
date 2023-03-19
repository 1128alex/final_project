<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-4"></div>
	<div class="col-4">
		<h4 class="mt-3">
			<a href="/univ/user/sign_in" class="underline noDecoA">Back to
				login</a>
		</h4>
		<h3>Please enter your email.</h3>
		<input class="form-control" id="email" name="email"
			placeholder="eg) example@auniv.com">
		<button id="nextBtn" class="btn button mt-2">Next</button>

		<div class="question mt-3 d-none">
			<h4 id="questionBox"></h4>
			<input type="text" id="answerSlot" class="form-control">
			<button type="button" id="verifyBtn" class="btn button mt-2">Verify</button>
		</div>
	</div>
	<div class="col-4"></div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$('#nextBtn').on(
								'click',
								function() {
									let email = $('#email').val();
									if (email == "") {
										alert("Please write your email.");
										return;
									}

									$.ajax({
										type : "POST",
										url : " /user/get_verify_question",
										data : {
											"email" : email
										},
										success : function(data) {
											if (data.code == 1) {
												$('.question').removeClass(
														"d-none");
												$('#questionBox').append(
														data.question);
												$('#nextBtn')
														.addClass("d-none");
											} else {
												alert("error " + data.code
														+ ": "
														+ data.errorMessage);
											}
										},
										error : function(e) {
											alert("error: " + e);
										}
									});
								});
						$('#verifyBtn')
								.on(
										'click',
										function() {
											let email = $('#email').val();
											let question = $('#questionBox')
													.text();
											let answer = $('#answerSlot').val();
											if (email == "") {
												alert("Please write your email.");
												return;
											}
											if (answer == "") {
												alert("Please write the answer for the question.");
												return;
											}
											$
													.ajax({
														type : "POST",
														url : " /user/verify_question",
														data : {
															"email" : email,
															"question" : question,
															"answer" : answer
														},
														success : function(data) {
															if (data.code == 1) {
																alert("Verification success!");
																location.href = "/univ/user/reset_password?email="
																		+ email;
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