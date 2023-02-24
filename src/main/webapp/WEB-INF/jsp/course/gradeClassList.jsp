<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">Grade List</h1>
		<table class="table">
			<thead>
				<tr>
					<th>Class</th>
					<th>Grade</th>
					<th>Letter</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="combined" items="${combinedList}">
					<tr>
						<td>${combined.courseCode += " - " += combined.courseName}</td>
						<td>${combined.averageGrade}</td>
						<td><c:choose>
								<c:when test="${combined.averageGrade >= 90}">A+</c:when>
								<c:when
									test="${combined.averageGrade >= 85 and 89 >= combined.averageGrade}">A</c:when>
								<c:when
									test="${combined.averageGrade >= 80 and 74 >= combined.averageGrade}">A-</c:when>
								<c:when
									test="${combined.averageGrade >= 77 and 79 >= combined.averageGrade}">B+</c:when>
								<c:when
									test="${combined.averageGrade >= 73 and 76 >= combined.averageGrade}">B</c:when>
								<c:when
									test="${combined.averageGrade >= 70 and 72 >= combined.averageGrade}">B-</c:when>
								<c:when
									test="${combined.averageGrade >= 67 and 69 >= combined.averageGrade}">C+</c:when>
								<c:when
									test="${combined.averageGrade >= 63 and 66 >= combined.averageGrade}">C</c:when>
								<c:when
									test="${combined.averageGrade >= 60 and 62 >= combined.averageGrade}">C-</c:when>
								<c:when
									test="${combined.averageGrade >= 57 and 59 >= combined.averageGrade}">D+</c:when>
								<c:when
									test="${combined.averageGrade >= 53 and 56 >= combined.averageGrade}">D</c:when>
								<c:when
									test="${combined.averageGrade >= 50 and 52 >= combined.averageGrade}">D-</c:when>
								<c:when
									test="${combined.averageGrade >= 42 and 49 >= combined.averageGrade}">F+</c:when>
								<c:when
									test="${combined.averageGrade >= 35 and 41 >= combined.averageGrade}">F</c:when>
								<c:when
									test="${combined.averageGrade >= 0 and 34 >= combined.averageGrade}">F-</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-3"></div>
</div>