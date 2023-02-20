<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<form id="assignmentSubmitForm" action="/assignment/submit_assignment"
			method="put">
			<div class="d-flex justify-content-between align-items-end">
				<h2 class="my-3">${course.courseCode += " - " += course.courseName}</h2>
			</div>
			<h2 class="text-center">${assignment.asgmtName+=" Submission"}</h2>
			<div class="d-flex justify-content-end">
				<span>${assignment.asgmtType}</span>
			</div>
			<c:if
				test="${assignment.asgmtType eq 'Graded Assignment'|| assignment.asgmtType eq 'Test'}">
				<div class="d-flex justify-content-end">
					<span>Out of ${assignment.maxScore}</span>
				</div>
			</c:if>
			<h3>Description</h3>
			<span>${assignment.content}</span>
			<h3 class="mt-4">File Attachments</h3>
			<div id="fileBox"></div>
			<div id="fileDataHolder" data-file-string="${assignment.filePath}"></div>
			<textarea rows="4" cols="" class="form-control mt-4" id="content"></textarea>
			<div class="d-flex justify-content-end mt-2">
				<input type="file" id="filePath2" name="filePath"
					multiple="multiple">
			</div>
			<div class="d-flex justify-content-end mt-2">
				<button type="submit" id="assignmentSubmitBtn" class="btn button">Submit</button>
			</div>
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
						$('#assignmentSubmitForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

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

											let inputFileList = new Array();
											for (let i = 0; i < $('#filePath2')[0].files.length; i++) {
												inputFileList
														.push($('#filePath2')[0].files[i]);
											}

											let url = $(this).attr('action');
											let formData = new FormData();
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
																location.href = "/univ/assignment/assignment_list?classId="
																		+ classId;
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
