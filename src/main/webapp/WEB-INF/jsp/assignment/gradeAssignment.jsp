<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">Grade Assignment</h1>
		<h3 class="mt-3">Student: ${submittedAsgmt.firstName += " " +=
		submittedAsgmt.lastName}</h3>
		<h3>Student Number: ${submittedAsgmt.studentNum}</h3>


		<hr>
		<h3 class="text-center">${assignment.asgmtName}</h3>
		<h3>Content:</h3>
		<h4>${assignment.content}</h4>
		<h3 class="mt-4">File Attachments</h3>
		<div id="fileBox"></div>
		<div id="fileDataHolder" data-file-string="${assignment.filePath}"></div>

		<hr>
		<h2 class="mt-3">Student's Submission</h2>
		<textarea rows="3" cols="" class="form-control">${submittedAsgmt.content}</textarea>
		<h3 class="mt-4">File Attachments</h3>
		<div id="studFileBox"></div>
		<div id="studFileDataHolder"
			data-stud-file-string="${submittedAsgmt.filePath}"></div>
		<c:if
			test="${assignment.asgmtType eq 'Graded Assignment' or  assignment.asgmtType eq 'Test'}">
			<div class="d-flex justify-content-end align-items-end">
				<div>
					<h3>Grade</h3>
					<div class="d-flex align-items-end">
						<input type="number" id="score" class="form-control" min="0"
							max="${assignment.maxScore}">
						<div class="col-6">
							<h4>${"/ " += assignment.maxScore}</h4>
						</div>
					</div>
				</div>
			</div>
			<h3>Feedback</h3>
			<textarea rows="3" cols="" id="feedback" class="form-control"></textarea>
			<div class="d-flex justify-content-end">
				<button id="gradeBtn" type="button" class="btn button my-3">Submit
					Grade</button>
			</div>
		</c:if>
	</div>
	<div class="col-3"></div>
	<div id="subAsgmtIdHolder" data-subasgmt-id="${submittedAsgmt.id}"></div>
	<div id="classIdHolder" data-class-id="${assignment.classId}"></div>
	<div id="asgmtIdHolder" data-asgmt-id="${assignment.asgmtId}"></div>
	<div></div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let subAsgmtId = $('#subAsgmtIdHolder').data(
								"subasgmt-id");
						let classId = $('#classIdHolder').data("class-id");
						let asgmtId = $('#asgmtIdHolder').data("asgmt-id");

						let fileString = $('#fileDataHolder').data(
								"file-string");
						if (fileString == '') {
							$('#fileBox').append(
									"<span>No file attachments</span>");
						} else {
							let files = fileString.split(" ");

							for (let i = 0; i < files.length - 1; i++) {
								let fileName = files[i].split("/").pop();

								$('#fileBox').append(
										"<a href=\"" + files[i] + "\" class=\"noDecoA\" download>"
												+ fileName + "</a><br>");
							}
						}
						let studFileString = $('#studFileDataHolder').data(
								"stud-file-string");
						if (studFileString == '') {
							$('#studFileBox').append(
									"<span>No file attachments</span>");
						} else {
							let studFiles = studFileString.split(" ");

							for (let i = 0; i < files.length - 1; i++) {
								let studFileName = files[i].split("/").pop();

								$('#studFileBox').append(
										"<a href=\"" + studFiles[i] + "\" class=\"noDecoA\" download>"
												+ studFileName + "</a><br>");
							}
						}
						$('#score').on('change', function() {
							if ($(this).val() > 100) {
								$('#score').val(100);
							}
						})

						$('#gradeBtn')
								.on(
										'click',
										function() {
											let score = $('#score').val();
											let feedback = $('#feedback').val();
											$
													.ajax({
														type : "PUT",
														url : "/assignment/grade_assignment",
														data : {
															"subAsgmtId" : subAsgmtId,
															"score" : score,
															"feedback" : feedback
														},
														success : function(data) {
															if (data.code == 1) {
																alert("Completed Grading!");
																location.href = "/univ/assignment/assignment_detail?classId="
																		+ classId
																		+ "&asgmtId="
																		+ asgmtId;
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

													})
										});
					});
</script>
