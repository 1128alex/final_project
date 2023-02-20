<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<form id="assignmentSubmitForm" action="/assignment/submit_assignment"
			method="GET">
			<div class="d-flex justify-content-between align-items-end">
				<h2 class="my-3">${course.courseCode += " - " += course.courseName}</h2>
			</div>
			<h2 class="text-center">${assignment.asgmtName += " Submission"}</h2>
			<div class="d-flex justify-content-end">
				<span>${assignment.asgmtType}</span>
			</div>
			<c:if
				test="${assignment.asgmtType eq 'Graded Assignment' or assignment.asgmtType eq 'Test'}">
				<div class="d-flex justify-content-end">
					<span>Out of ${assignment.maxScore}</span>
				</div>
			</c:if>

			<hr color="black">

			<h2 class="text-center">Assignment Information</h2>
			<h3>Description</h3>
			<span>${assignment.content}</span>
			<h3 class="mt-4">File Attachments</h3>
			<div id="fileBox"></div>
			<div id="fileDataHolder" data-file-string="${assignment.filePath}"></div>

			<hr color="black">



			<c:if test="${submittedAsgmt ne null}">
				<h2 class="text-center">Submission</h2>
				<h3 class="mt-4">Submitted File Attachments</h3>
				<div id="studFileBox"></div>
				<div id="studFileDataHolder"
					data-stud-file-string="${submittedAsgmt.filePath}"></div>
				<h3 class="mt-3">Submitted</h3>

				<c:if test="${submittedAsgmt.access eq true}">
					<textarea rows="4" cols="" class="form-control mb-4" id="content">${submittedAsgmt.content}</textarea>
				</c:if>

				<c:if test="${submittedAsgmt.access eq false}">
					<textarea rows="4" cols="" class="form-control mb-4" id="content"
						disabled="disabled">${submittedAsgmt.content}</textarea>
				</c:if>
			</c:if>

			<c:if test="${submittedAsgmt eq null}">
				<h3>Submission</h3>
				<textarea rows="4" cols="" class="form-control mt-4" id="content"></textarea>
			</c:if>

			<c:if
				test="${submittedAsgmt eq null or submittedAsgmt.access eq true}">
				<div class="d-flex justify-content-end mt-2">
					<input type="file" id="filePath2" multiple="multiple">
				</div>
			</c:if>

			<c:if
				test="${submittedAsgmt ne null and submittedAsgmt.access eq true}">
				<div class="d-flex justify-content-end mt-2">
					<div id="reHolder" data-re="re"></div>
					<button type="submit" id="assignmentResubmitBtn" class="btn button">Resubmit</button>
				</div>
			</c:if>
			<c:if test="${submittedAsgmt eq null}">
				<div class="d-flex justify-content-end mt-2">
					<div id="reHolder" data-re="nr"></div>
					<button type="submit" id="assignmentSubmitBtn" class="btn button">Submit</button>
				</div>
			</c:if>

			<c:if test="${submittedAsgmt ne null}">
				<hr color="black">
				<h2 class="text-center">Grading from Professor</h2>
				<table class="table">
					<tr>
						<th>Grade</th>
						<td><c:choose>
								<c:when test="${assignment.asgmtType eq 'Ungraded Assignment'}">
									<span>No grade</span>
								</c:when>
								<c:when
									test="${submittedAsgmt.score eq null and assignment.maxScore ne null}">
									<span>Ungraded</span>
								</c:when>
								<c:when test="${submittedAsgmt.score ne null}">
									<span>${submittedAsgmt.score += " / " +=  assignment.maxScore}</span>
								</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<th>Feedback</th>
						<td><c:if test="${submittedAsgmt.feedback ne null}">
								<span>${submittedAsgmt.feedback}</span>
							</c:if> <c:if test="${submittedAsgmt.feedback eq ''}">
								<span>No feedback</span>
							</c:if></td>
					</tr>
				</table>
			</c:if>
		</form>
	</div>
	<div class="col-3"></div>
</div>
<div id="asgmtIdHolder" data-asgmt-id="${assignment.asgmtId}"></div>
<div id="classIdHolder" data-class-id="${assignment.classId}"></div>


<script>
	$(document)
			.ready(
					function() {
						let fileString = $('#fileDataHolder').data(
								"file-string");
						if (fileString == '' || fileString == null) {
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
						if ($('#studFileDataHolder').data("stud-file-string") == ''
								|| $('#studFileDataHolder').data(
										"stud-file-string") == null) {
							$('#studFileBox').append(
									"<span>No file attachments</span>");
						} else {
							let studFileString = $('#studFileDataHolder').data(
									"stud-file-string");
							let studFiles = studFileString.split(" ");

							for (let i = 0; i < studFiles.length - 1; i++) {
								let studFileName = studFiles[i].split("/")
										.pop();

								$('#studFileBox').append(
										"<a href=\"" + studFiles[i] + "\" class=\"noDecoA\" download>"
												+ studFileName + "</a><br>");
							}
						}
						$('#assignmentSubmitForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											let re = false;
											if ($('#reHolder').data("re") == "re") {
												re = true;
											}

											let asgmtId = $('#asgmtIdHolder')
													.data('asgmt-id');
											let classId = $('#classIdHolder')
													.data('class-id');
											let content = $('#content').val();
											if (content == '') {
												if (!confirm("Your submit box is empty. Are you sure you want to submit with no content?")) {
													return false;
												}
											}

											if (!confirm("Do you want to submit the assignment?")) {
												return false;
											}

											let inputFileList = new Array();
											if ($('#filePath2')[0].files != null) {
												for (let i = 0; i < $('#filePath2')[0].files.length; i++) {
													inputFileList
															.push($('#filePath2')[0].files[i]);
												}
											}

											let url = $(this).attr('action');
											let formData = new FormData();
											formData.append("resubmit", re);
											formData.append("asgmtId", asgmtId);
											formData.append("classId", classId);
											formData.append("content", content);
											for (let i = 0; i < inputFileList.length; i++) {
												formData.append("files",
														inputFileList[i]);
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
																alert("Assignment Submitted!");
																location
																		.reload();
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
