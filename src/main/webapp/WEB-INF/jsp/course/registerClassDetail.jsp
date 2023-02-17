<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div id="classIdHolder" data-class-id="${combined._class.id}"></div>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">Register Class</h1>
		<div class="d-flex justify-content-end">
			Due date:
			<fmt:formatDate value="${combined._class.registerDueDate}"
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
					<td>${combined.course.courseCode += ' - ' +=combined.course.courseName}</td>
					<td>${combined.user.firstName += ' ' += combined.user.lastName}</td>
					<td>${combined._class.maxNum}</td>
				</tr>
			</tbody>
		</table>
		<h2>Course Description</h2>
		<span> ${combined.course.description}</span>
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
							<c:when test="${combined._class.monStartTime ne 0}">
								<c:choose>
									<c:when test="${combined._class.monStartTime > 12}">${combined._class.monStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined._class.monStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined._class.monStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined._class.tueStartTime ne 0}">
								<c:choose>
									<c:when test="${combined._class.tueStartTime > 12}">${combined._class.tueStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined._class.tueStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined._class.tueStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined._class.wedStartTime ne 0}">
								<c:choose>
									<c:when test="${combined._class.wedStartTime > 12}">${combined._class.wedStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined._class.wedStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined._class.wedStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined._class.thuStartTime ne 0}">
								<c:choose>
									<c:when test="${combined._class.thuStartTime > 12}">${combined._class.thuStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined._class.thuStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined._class.thuStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${combined._class.friStartTime ne 0}">
								<c:choose>
									<c:when test="${combined._class.friStartTime > 12}">${combined._class.friStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined._class.friStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined._class.friStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
				</tr>
			</tbody>
		</table>
		<div class="d-flex justify-content-between">
			<span>Price: <fmt:formatNumber type="currency"
					currencySymbol="$">${combined.course.price}</fmt:formatNumber>
			</span>
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
						location.href = "/univ/course/class_list";
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