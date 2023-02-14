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
		<h1>${courseName }</h1>
		<div class="d-flex justify-content-end">
			<a href="/univ/assignment/add_assignment?classId=${classId}"
				class="btn button text-white">Add Assignment</a>
		</div>

		<table class="table mt-1">
			<thead>
				<tr>
					<th>Assignment Name</th>
					<th>Submitted Students</th>
					<th>Due Date</th>
					<th>Average Grade</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="assignment" items="${assignments}">
					<tr>
						<td><a
							href="/univ/assignment/assignment_detail?classId=${assignment.classId}&asgmtId=${assignment.asgmtId}">${assignment.asgmtName}</a></td>
						<td>-- Submitted Students --</td>
						<td><fmt:formatDate value="${assignment.dueDate}"
								pattern="d MMM yyyy" /></td>
						<td>-- Average Grade --</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-3"></div>
</div>