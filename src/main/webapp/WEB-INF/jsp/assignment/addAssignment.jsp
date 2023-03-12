<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h4 class="mt-3">
			<a href="/univ/assignment/assignment_list?classId=${classId}"
				class="underline noDecoA" id="classIdHolder"
				data-class-id="${classId}">Back to assignment list</a>
		</h4>

		<select id="classId" name="classId" class="form-control sharpBorder">
			<option value="0">--- Course ---</option>
			<c:forEach var="combined" items="${combinedList}">
				<option value="${combined.id}">${combined.courseCode += ' - ' +=
						combined.courseName}</option>
			</c:forEach>
		</select>

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
				<input type="file" id="filePath" name="filePath" multiple="multiple">
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
		<div id="classIdHolder" hidden="hidden" data-class-id="${classId}"></div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let classId = $('#classIdHolder').data("class-id");
						$('#classId').val(classId).prop("selected", true);
						$('#classId').on('change', function() {
							classId = $('#classId').val();
						})
						
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

											let classId = $('#classIdHolder')
													.data("class-id");

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

											let inputFileList = new Array();
											for (let i = 0; i < $('#filePath')[0].files.length; i++) {
												inputFileList
														.push($('#filePath')[0].files[i]);
											}

											let maxScore = $('#maxScore').val();
											if ((asgmtType == 'Graded Assignment' || asgmtType == 'Test')
													&& maxScore == '') {
												alert("Please choose the maximum score of this assignment.");
												return false;
											}

											let dueDate = $('#dueDate').val();

											if (!confirm("Do you want to create an assignment with these information?")) {
												return false;
											}

											let url = $(this).attr('action');
											let formData = new FormData();
											formData.append("classId", classId);
											formData.append("asgmtType",
													asgmtType);
											formData.append("asgmtName",
													asgmtName);
											formData.append("content", content);
											for (let i = 0; i < inputFileList.length; i++) {
											　　　　formData.append("files", inputFileList[i]);
											}
											formData.append("maxScoreString",
													maxScore);
											if (dueDate != "") {
												formData.append(
														"dueDateString",
														dueDate);
											}
											$
													.ajax({
														type : "PUT",
														url : url,
														enctype : "multipart/form-data",
														data : formData,
														processData : false,
														contentType : false,
														success : function(data) {
															if (data.code == 1) {
																alert("Assignment "
																		+ asgmtName
																		+ " created!");
																location.href = "/univ/assignment/assignment_list?classId="
																		+ classId;
															} else if (data.code == 500) {
																alert("error " + data.code + ": " + data.errorMessage);
															}
														},
														error : function(e) {
															alert("error: " + e);
														}
													});
										});
					});
</script>