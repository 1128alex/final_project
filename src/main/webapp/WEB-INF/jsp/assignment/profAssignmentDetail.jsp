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
		<h4 class="mt-3">
			<a
				href="/univ/assignment/assignment_list?classId=${assignment.classId}"
				class="underline noDecoA">Back to assignment list</a>
		</h4>
		<div class="d-flex justify-content-between align-items-end">
			<h1 class="my-3">Assignment Detail</h1>
			<div class="mr-3">
				<a
					href="/univ/assignment/edit_assignment?classId=${assignment.classId}&asgmtId=${assignment.asgmtId}"
					class="btn button text-white">Edit</a>
			</div>
		</div>
		<hr>
		<h2 class="text-center mt-3">${assignment.asgmtName}</h2>
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

		<h2 class="mt-4">Submissions</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Student</th>
					<th>Submitted Time</th>
					<th>Status</th>
					<th>Score</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="submittedAsgmt" items="${submittedAsgmtList}">
					<tr>
						<td>${submittedAsgmt.firstName += " " += submittedAsgmt.lastName}</td>
						<td><fmt:formatDate value="${submittedAsgmt.updatedAt}"
								pattern="dd MMM yyyy" /></td>
						<td><c:choose>
								<c:when test="${assignment.asgmtType eq 'Ungraded Assignment'}">
									<span class="text-success">Ungraded Assignment</span>
								</c:when>
								<c:when
									test="${submittedAsgmt.score eq null and submittedAsgmt.feedback eq null}">
									<span class="text-danger">Not Graded</span>
								</c:when>
								<c:when
									test="${submittedAsgmt.score eq null and submittedAsgmt.feedback ne null}">
									<span class="text-warning">Only Feedback Given</span>
								</c:when>
								<c:when test="${submittedAsgmt.score ne null}">
									<span class="text-success">Graded</span>
								</c:when>
							</c:choose></td>
						<td><c:if test="${assignment.maxScore ne 0}">${submittedAsgmt.score += " / " += assignment.maxScore}</c:if>
						</td>
						<td><c:choose>
								<c:when test="${submittedAsgmt.score eq null}">
									<a
										href="/univ/assignment/grade_assignment?subAsgmtId=${submittedAsgmt.id}"
										class="underline">Grade</a>
								</c:when>
								<c:when test="${submittedAsgmt.score ne null}">
									<a
										href="/univ/assignment/grade_assignment?subAsgmtId=${submittedAsgmt.id}"
										class="underline">Update</a>
								</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(
			function() {
				let fileString = $('#fileDataHolder').data("file-string");
				if (fileString == '') {
					$('#fileBox').append("<span>No file attachments</span>");
				} else {
					let files = fileString.split(" ");

					for (let i = 0; i < files.length - 1; i++) {
						let fileName = files[i].split("/").pop();

						$('#fileBox').append(
								"<a href=\"" + files[i] + "\" class=\"noDecoA\" download>"
										+ fileName + "</a><br>");
					}
				}
			});
</script>
