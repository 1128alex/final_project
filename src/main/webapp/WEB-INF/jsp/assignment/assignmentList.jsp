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
		<h1 class="mt-4">Assignments for</h1>
		<h1>${courseName}</h1>

		<div class="d-flex">
			<select id="classId" name="classId" class="form-control sharpBorder">
				<option value="0">--- Course ---</option>
				<c:forEach var="combined" items="${combinedList}">
					<option value="${combined.id}">${combined.courseCode += ' - ' +=
						combined.courseName}</option>
				</c:forEach>
			</select>
			<button type="button" id="searchBtn" class="btn button sharpBorder">Search</button>
		</div>

		<c:if test="${type eq 'professor'}">
			<a href="/univ/assignment/add_assignment?classId=${classId}"
				class="btn button text-white my-2">Add Assignment</a>
		</c:if>

		<table class="table mt-1">
			<thead>
				<tr>
					<th>Created Date</th>
					<th>Course Code</th>
					<th>Assignment Name</th>
					<th>Due Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="assignment" items="${assignmentList}">
					<tr>
						<td><fmt:formatDate value="${assignment.createdAt}"
								pattern="d MMM yyyy" /></td>
						<td>${assignment.courseCode}</td>
						<td><a
							href="/univ/assignment/assignment_detail?classId=${assignment.classId}&asgmtId=${assignment.asgmtId}">${assignment.asgmtName}</a></td>
						<td><fmt:formatDate value="${assignment.dueDate}"
								pattern="d MMM yyyy" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-3"></div>
	<div id="classIdHolder" hidden="hidden" data-class-id="${classId}"></div>
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
						$('#searchBtn')
								.on(
										'click',
										function() {
											classId = $('#classId').val();
											location.href = "/univ/assignment/assignment_list?classId="
													+ classId;
										})
					})
</script>