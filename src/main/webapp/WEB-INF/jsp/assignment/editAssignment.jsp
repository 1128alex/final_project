<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Edit Assignment</h2>
		<form id="assignmentEditForm" action="/assignment/edit_assignment">
			<div class="mt-3">
				<h4>Assignment Name</h4>
				<input type="text" id="asgmtName" name="asgmtName"
					class="form-control col-8 mt-2" value="${assignment.asgmtName}">
			</div>
			<div class="mt-2">
				<h4>Assignment Type</h4>
				<div class="d-flex">
					<div id="asgmtTypeHolder" data-asgmt-type="${assignment.asgmtType}"></div>
					<select id="asgmtType" name="asgmtType" class="form-control col-4">
						<option value="0">-- Type --</option>
						<option>Ungraded Assignment</option>
						<option>Graded Assignment</option>
						<option>Test</option>
					</select>
					<div id="maxScoreBox" class="ml-3 d-none">
						<c:if test="${assignment.maxScore ne 0}">
							<c:set value="${assignment.maxScore}" var="maxScore"></c:set>
						</c:if>
						<div class="d-flex align-items-center">
							Out of: <input type="number" id="maxScore" name="maxScore"
								min="1" class="form-control col-5 ml-2" value="${maxScore}">
						</div>
					</div>
				</div>
			</div>
			<div class="mt-2">
				<h4>Description</h4>
				<textarea rows="4" id="content" name="content" class="form-control">${assignment.content}</textarea>
			</div>
			<div class="d-flex justify-content-end mt-2">
				<input type="file" id="filePath1" name="filePath"
					multiple="multiple">
			</div>

			<div class="mt-3">
				<h4>Assignment Due Date</h4>
				<input type="text" id="dueDate" name="dueDate"
					class="form-control col-10"
					value="<fmt:formatDate value="${assignment.dueDate}"
								pattern="YYYY/MM/dd" />">
			</div>
			<div class="d-flex justify-content-between mt-3">
				<div>
					<button type="button" id="deleteAssignmentBtn"
						class="btn delButton">Delete</button>
				</div>
				<div>
					<button type="button" id="editAssignmentCancelBtn"
						class="btn cancelButton mr-2">Cancel</button>
					<button type="submit" id="editAssignmentBtn" class="btn button">Edit</button>
				</div>
			</div>

		</form>
		<div id="classIdHolder" hidden="hidden"
			data-class-id="${assignment.classId}"></div>
		<div id="asgmtIdHolder" hidden="hidden"
			data-asgmt-id="${assignment.asgmtId}"></div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let asgmtType = $('#asgmtTypeHolder')
								.data("asgmt-type");
						$('#asgmtType').val(asgmtType).prop("selected", true);
						if (asgmtType == "Graded Assignment"
								|| asgmtType == "Test") {
							$('#maxScoreBox').removeClass('d-none');
						}

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

						let classId = $('#classIdHolder').data("class-id");
						let asgmtId = $('#asgmtIdHolder').data("asgmt-id");
						$('#editAssignmentCancelBtn')
								.on(
										'click',
										function() {
											if (!confirm("Leaving this page will delete the changes. Do you want to leave this page?")) {
												return false;
											}

											location.href = "/univ/assignment/assignment_detail?classId="
													+ classId
													+ "&asgmtId="
													+ asgmtId;
										});
						let asgmtName = $('#asgmtName').val();
						$('#assignmentEditForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

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
											for (let i = 0; i < $('#filePath1')[0].files.length; i++) {
												inputFileList
														.push($('#filePath1')[0].files[i]);
											}

											let maxScore = $('#maxScore').val();
											if ((asgmtType == 'Graded Assignment' || asgmtType == 'Test')
													&& maxScore == '') {
												alert("Please choose the maximum score of this assignment.");
												return false;
											}

											let dueDate = $('#dueDate').val();

											if (!confirm("Are you sure you want to edit the assignment with these information?")) {
												return false;
											}

											let url = $(this).attr('action');
											let formData = new FormData();
											formData.append("classId", classId);
											formData.append("asgmtId", asgmtId);
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
														alert("Success editing assignment.");
														location.href = "/univ/assignment/assignment_detail?classId="
																+ classId + "&asgmtId="+asgmtId;
													}
													if (data.code == 500) {
														alert("error: "+data.errorMessage);
													}
												},
												error : function(e) {
													alert("error: " + data.errorMessage);
												}
											});
										});
						$('#deleteAssignmentBtn')
						.on(
								'click',
								function() {
									if (!confirm("Are you sure you want to delete the assignment " + asgmtName + "?")) {
										return;
									}
									$
											.ajax({
												type : "DELETE",
												url : "/assignment/delete_assignment",
												data : {
													"classId" : classId,
													"asgmtId" : asgmtId
												},
												success : function(data) {
													if (data.code == 1) {
														alert("Success deleting assignment "
																+ asgmtName
																+ ".");
														location.href = "/univ/assignment/assignment_list?classId=" + classId;
													} else {
														alert("error: "
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