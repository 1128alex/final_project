<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div id="classIdHolder" data-class-id="${combined.id}"></div>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h4 class="mt-3">
			<a href="/univ/course/register_class" class="underline noDecoA">Back
				to class list</a>
		</h4>
		<h1 class="mt-3">Register Class</h1>
		<div class="d-flex justify-content-end">
			Due date:
			<fmt:formatDate value="${combined.registerDueDate}"
				pattern="dd MMM yyyy" />
		</div>
		<table class="table table-bordered mt-2">
			<thead>
				<tr>
					<th>Course</th>
					<th>Professor</th>
					<th>Size</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${combined.courseCode += ' - ' +=combined.courseName}</td>
					<td>${combined.firstName += ' ' += combined.lastName}</td>
					<td>${combined.maxNum}</td>
				</tr>
			</tbody>
		</table>
		<h2>Course Description</h2>
		<span> ${combined.description}</span>
		<h2 class="mt-4">Class Schedule</h2>
		<table class="table table-bordered" id="classTable">
			<thead>
				<tr class="text-center">
					<th>Monday</th>
					<th>Tuesday</th>
					<th>Wednesday</th>
					<th>Thursday</th>
					<th>Friday</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td><c:choose>
							<c:when test="${combined.monStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.monStartTime > 12}">${combined.monStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.monStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.monStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined.tueStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.tueStartTime > 12}">${combined.tueStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.tueStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.tueStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined.wedStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.wedStartTime > 12}">${combined.wedStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.wedStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.wedStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined.thuStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.thuStartTime > 12}">${combined.thuStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.thuStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.thuStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined.friStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.friStartTime > 12}">${combined.friStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.friStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.friStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
				</tr>
			</tbody>
		</table>
		<div class="d-flex justify-content-end">
			<button type="button" id="registerBtn" class="btn button mt-2">Register</button>
		</div>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(function() {
		$('#registerBtn').on('click', function() {
			let classId = $('#classIdHolder').data('class-id');
			$.ajax({
				type : "GET",
				url : "/registry/register_class",
				data : {
					"classId" : classId
				},
				success : function(data) {
					if (data.code == 1) {
						alert("Success!");
						location.href = "/univ/course/timetable";
					} else {
						alert("error " + data.code + ": " + data.errorMessage);
					}
				},
				error : function(e) {
					alert("error: " + e);
					return;
				}
			});
		});
	});
</script>