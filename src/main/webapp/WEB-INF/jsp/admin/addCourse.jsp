<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<div class="mt-3">
			<h4>Course Code</h4>
			<input type="text" id="courseCode" name="courseCode"
				class="form-control" placeholder="eg) CS100, ECON200, MATH300">
		</div>
		<div class="mt-3">
			<h4>Course Name</h4>
			<input type="text" id="courseName" name="courseName"
				class="form-control">
		</div>
		<div class="mt-3">
			<h4>Description</h4>
			<textarea id="description" name="description" class="form-control"
				rows="5"></textarea>
		</div>
		<div class="mt-3">
			<h4>Price</h4>
			<input type="number" id="price" name="price"
				class="form-control col-3">
		</div>
		<div class="mt-3 d-flex justify-content-end">
			<button type="button" id="createBtn" class="btn button">Create</button>
		</div>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$('#createBtn')
								.on(
										'click',
										function() {
											let courseCode = $('#courseCode')
													.val();
											if (courseCode == '') {
												alert('Please enter the course code.');
												return;
											}
											if (isNaN(courseCode) == false) {
												alert('Please check if you have included the subject code.');
												return;
											}
											if (containsNumbers(courseCode) == false) {
												alert('Please check if you have included the course level.');
												return;
											}
											let upperCaseCC = courseCode
													.toUpperCase();

											let courseName = $('#courseName')
													.val().trim();
											if (courseName == '') {
												alert('Please enter the course name.');
												return;
											}

											let description = $('#description')
													.val();

											let price = $('#price').val();
											if (price == '') {
												alert('Please enter the price.');
												return;
											}
											$
													.ajax({
														type : "POST",
														url : "/course/add_course",
														data : {
															"courseCode" : upperCaseCC,
															"courseName" : courseName,
															"description" : description,
															"price" : price
														},
														success : function(data) {
															if (data.code == 1) {
																alert("Completed adding course "
																		+ upperCaseCC
																		+ " - "
																		+ courseName
																		+ ".");
																location.href = "/univ/admin";
															}
														},
														error : function(e) {
															alert("error: " + e);
														}
													})
										});
						function containsNumbers(str) {
							return /\d/.test(str);
						}
					});
</script>