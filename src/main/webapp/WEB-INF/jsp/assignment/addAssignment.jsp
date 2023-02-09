<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Add Assignment</h2>
		<form id="assignmentAddForm" action="/assignment/add_assignment">
			<div class="mt-3">
				<h4>Assignment Name</h4>
				<input type="text" id="asgmtName" name="asgmtName"
					class="form-control col-8 mt-2">
			</div>
			<div class="mt-2">
				<h4>Assignment Type</h4>
				<div class="d-flex">
					<select id="asgmtType" name="asgmtType" class="form-control col-4">
						<option value="0">-- Type --</option>
						<option>Ungraded Assignment</option>
						<option>Graded Assignment</option>
						<option>Test</option>
					</select>
					<div id="maxScoreBox" class="ml-3 d-none">
						<div class="d-flex align-items-center">
							Out of: <input type="number" id="maxScore" name="maxScore"
								min="1" class="form-control col-5 ml-2">
						</div>
					</div>
				</div>
			</div>
			<div class="mt-2">
				<h4>Description</h4>
				<textarea rows="4" id="content" name="content" class="form-control"></textarea>
			</div>
			<div class="d-flex justify-content-end mt-2">
				<input type="file" id="filePath" name="filePath">
			</div>

			<div class="mt-3">
				<h4>Assignment Due Date</h4>
				<input type="text" id="dueDate" name="dueDate"
					class="form-control col-10">
			</div>
			<div class="mt-3 d-flex justify-content-end">
				<button type="submit" id="addAssignmentBtn" class="btn button">Add
					Assignment</button>
			</div>
		</form>

	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						$('#dueDate').datepicker({
							dateFormat : 'yy/mm/dd',
							minDate : 0
						});
						$('#asgmtType')
								.on(
										'change',
										function() {
											$('#maxScoreBox')
													.addClass('d-none');
											$('#maxScore').val('');
											if ($(this).val() == "Graded Assignment"
													|| $(this).val() == "Test") {
												$('#maxScoreBox').removeClass(
														'd-none');
											}
										});
						$('#assignmentAddForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											let asgmtName = $('#asgmtName')
													.val();
											if (asgmtName == '') {
												alert("Please input the assignment name.");
												return false;
											}

											let asgmtType = $('#asgmtType')
													.val();
											if (asgmtType == '0') {
												alert("Please choose the assignment type.");
												return false;
											}

											let content = $('#content').val();

											let filePath = $('#filePath').val();

											let maxScore = $('#maxScore').val();
											if ((asgmtType == 'Graded Assignment' || asgmtType == 'Test')
													&& maxScore == '') {
												alert("Please choose the maximum score of this assignment.");
												return false;
											}

											let dueDate = $('#dueDate').val();

											let url = $(this).attr('action');
											$
													.ajax({
														type : "put",
														url : url,
														enctype : "multipart/form-data",
														processData : false,
														contentType : false,
														data : {
															"asgmtType" : asgmtType,
															"asgmtName" : asgmtName,
															"content" : content,
															"filePath" : filePath,
															"maxScore" : maxScore,
															"dueDateString" : dueDate
														},
														success : function(data) {
															if (data.code == 1) {

															}
														},
														error : function(e) {
															alert("error: " + e);
														}
													});
										});
					});
</script>