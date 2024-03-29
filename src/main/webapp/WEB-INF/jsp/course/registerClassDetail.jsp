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
				pattern="MMMM d, yyyy" />
		</div>
		<table class="table table-bordered mt-2">
			<thead>
				<tr>
					<th>Course</th>
					<th>Professor</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="dataHolder"
						data-course-info="${combined.courseCode += ' - ' +=combined.courseName}">${combined.courseCode += ' - ' +=combined.courseName}</td>
					<td>${combined.firstName += ' ' += combined.lastName}</td>
					<td><c:choose>
							<c:when test="${combined.registerCount < combined.maxNum}">
								${combined.registerCount}/${combined.maxNum}
							</c:when>
							<c:otherwise>
								<div id="fullMessage" class="text-warning">Full</div>
							</c:otherwise>
						</c:choose> <c:if test="${today > combined.registerDueDate}">
							<br>
							<div id="closedMessage" class="text-danger">Closed</div>
						</c:if></td>
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
					<td id="monTimeHolder" data-mon="${combined.monStartTime}"><c:choose>
							<c:when test="${combined.monStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.monStartTime > 12}">${combined.monStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.monStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.monStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td id="tueTimeHolder" data-tue="${combined.tueStartTime}"><c:choose>
							<c:when test="${combined.tueStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.tueStartTime > 12}">${combined.tueStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.tueStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.tueStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td id="wedTimeHolder" data-wed="${combined.wedStartTime}"><c:choose>
							<c:when test="${combined.wedStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.wedStartTime > 12}">${combined.wedStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.wedStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.wedStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td id="thuTimeHolder" data-thu="${combined.thuStartTime}"><c:choose>
							<c:when test="${combined.thuStartTime ne 0}">
								<c:choose>
									<c:when test="${combined.thuStartTime > 12}">${combined.thuStartTime-12 += ":00 PM"}</c:when>
									<c:when test="${combined.thuStartTime eq 12}">12:00 PM</c:when>
									<c:otherwise>${combined.thuStartTime += ":00 AM"}</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>No class</c:otherwise>
						</c:choose></td>
					<td id="friTimeHolder" data-fri="${combined.friStartTime}"><c:choose>
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
	$(document)
			.ready(
					function() {
						$('#registerBtn')
								.on(
										'click',
										function() {
											let classInfo = $('#dataHolder')
													.data("course-info");
											if (!confirm("Do you want to register class "
													+ classInfo + "?")) {
												return;
											}

											let fullMessage = document
													.getElementById("fullMessage");
											let closedMessage = document
													.getElementById("closedMessage");

											if (fullMessage != null) {
												alert("The class is full.");
												return;
											}
											if (closedMessage != null) {
												alert("The class is closed. Registration due date has passed.");
												return;
											}

											let classId = $('#classIdHolder')
													.data('class-id');

											let monTime = $('#monTimeHolder')
													.data("mon");
											let tueTime = $('#tueTimeHolder')
													.data("tue");
											let wedTime = $('#wedTimeHolder')
													.data("wed");
											let thuTime = $('#thuTimeHolder')
													.data("thu");
											let friTime = $('#friTimeHolder')
													.data("fri");

											$
													.ajax({
														type : "GET",
														url : "/registry/register_class",
														data : {
															"classId" : classId,
															"monTime" : monTime,
															"tueTime" : tueTime,
															"wedTime" : wedTime,
															"thuTime" : thuTime,
															"friTime" : friTime
														},
														success : function(data) {
															if (data.code == 1) {
																alert("You are now registered in "
																		+ classInfo
																		+ "!");
																location.href = "/univ/course/timetable";
															} else if (data.code == 3) {
																alert("error:"
																		+ data.errorMessage);
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