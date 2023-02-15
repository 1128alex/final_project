<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Edit Class</h2>
		<form id="editClassForm" action="/course/edit_class" method="post">
			<div class="mt-3">
				<h4>Class</h4>
				<div class="d-flex">
					<select id="subjectCode" name="subjectCode"
						class="form-control col-5 mr-2">
						<option value="0">-- Subject --</option>
						<option value="CS">Computer Science</option>
						<option value="ECON">Economics</option>
						<option value="MATH">Math</option>
					</select> <select id="subjectLevel" name="subjectLevel"
						class="form-control col-5 ml-2">
						<option value="0">-- Level --</option>
						<c:forEach var="i" begin="1" end="4">
							<option>${i}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div hidden="hidden" id="endValue" data-end-value="${length}"></div>
			<div id="courseNameHolder" data-course-name="${courseName}"></div>
			<div id="courseCodeHolder" data-course-code="${classInfo.courseCode}"></div>
			<select id="courseName" name="courseName"
				class="form-control col-8 mt-2">
				<option value="0">-- Course --</option>
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<option id="${course.courseCode}"
						class="courses courses${status.index}">
						${course.courseCode += " - " += course.courseName}</option>
				</c:forEach>
			</select>
			<div class="mt-3 d-flex">
				<div class="w-50 d-flex justify-content-center">
					<div class="text-center">
						<h4>Maximum Students</h4>
						<div class="d-flex justify-content-center">
							<input type="number" id="maxNum" name="maxNum"
								class="form-control col-8" value="${classInfo.maxNum}">
						</div>
					</div>
				</div>
				<div class="w-50 d-flex justify-content-center">
					<div class="text-center">
						<h4>Registration Due Date</h4>
						<div class="d-flex justify-content-center">

							<input type="text" id="registerDueDate" name="registerDueDate"
								class="form-control col-11"
								value="<fmt:formatDate value="${classInfo.registerDueDate}"
								pattern="YYYY/MM/dd" />">
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<h4>Class Schedule</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="p-0">
								<div class="ml-2">Day of the Week</div>
							</th>
							<td class="p-0">
								<div class="dayOfWeek mt-1">
									<label>Mon</label>
								</div>
							</td>
							<td class="p-0">
								<div class="dayOfWeek mt-1">
									<label>Tue</label>
								</div>
							</td>
							<td class="p-0">
								<div class="dayOfWeek mt-1">
									<label>Wed</label>
								</div>
							</td>
							<td class="p-0">
								<div class="dayOfWeek mt-1">
									<label>Thu</label>
								</div>
							</td>
							<td class="p-0">
								<div class="dayOfWeek mt-1">
									<label>Fri</label>
								</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="p-0"><div class="mt-2 ml-2">Start Time</div></th>
							<c:forEach var="i" begin="1" end="5">
								<c:choose>
									<c:when test="${i eq 1}">
										<div id="monStartTimeHolder"
											data-mon-start="${classInfo.monStartTime}"></div>
									</c:when>
									<c:when test="${i eq 2}">
										<div id="tueStartTimeHolder"
											data-tue-start="${classInfo.tueStartTime}"></div>
									</c:when>
									<c:when test="${i eq 3}">
										<div id="wedStartTimeHolder"
											data-wed-start="${classInfo.wedStartTime}"></div>
									</c:when>
									<c:when test="${i eq 4}">
										<div id="thuStartTimeHolder"
											data-thu-start="${classInfo.thuStartTime}"></div>
									</c:when>
									<c:when test="${i eq 5}">
										<div id="friStartTimeHolder"
											data-fri-start="${classInfo.friStartTime}"></div>
									</c:when>
								</c:choose>


								<td class="p-0"><select id="dayOfWeek${i}"
									class="form-control">
										<option value="0">No Class</option>
										<c:forEach var="j" begin="6" end="20">
											<option value="${j}">${j}:00</option>
										</c:forEach>
								</select></td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<div>
						<button type="button" id="deleteClassBtn" class="btn delButton">Delete</button>
					</div>
					<div>
						<button type="button" id="editClassCancelBtn"
							class="btn cancelButton mr-2">Cancel</button>
						<button type="submit" id="editClassSubmitBtn" class="btn button">Edit</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="classIdDataHolder" data-class-id="${classInfo.id}"></div>
</div>

<script>
	$(document)
			.ready(
					function() {

						let courseName = $('#courseNameHolder').data(
								'course-name');
						$('#courseName').val(courseName).prop("selected", true);
						let monStartTime = $('#monStartTimeHolder').data(
								'mon-start');
						$('#dayOfWeek1').val(monStartTime).prop("selected",
								true);
						let tueStartTime = $('#tueStartTimeHolder').data(
								'tue-start');
						$('#dayOfWeek2').val(tueStartTime).prop("selected",
								true);
						let wedStartTime = $('#wedStartTimeHolder').data(
								'wed-start');
						$('#dayOfWeek3').val(wedStartTime).prop("selected",
								true);
						let thuStartTime = $('#thuStartTimeHolder').data(
								'thu-start');
						$('#dayOfWeek4').val(thuStartTime).prop("selected",
								true);
						let friStartTime = $('#friStartTimeHolder').data(
								'fri-start');
						$('#dayOfWeek5').val(friStartTime).prop("selected",
								true);

						$('#subjectLevel').on('click', function() {
							if ($('#subjectCode').val() == "0") {
								alert("Please select the subject code.");
								return;
							}
						});
						$('#subjectCode, #subjectLevel')
								.on(
										'change',
										function() {
											$('#courseName').val('0');

											let subjectCode = $('#subjectCode')
													.val();
											let subjectLevel = $(
													'#subjectLevel').val();
											$('.courses').addClass("d-none"); // All hidden
											if (subjectCode == "0") {
												$('.courses').removeClass(
														"d-none"); // All non hidden
												$('#subjectLevel').val("0");
												return;
											}
											if ($('#subjectLevel').val() != "0") {
												subjectCode = ''.concat(
														subjectCode,
														subjectLevel);
											}

											let endValue = $('#endValue').data(
													"end-value");
											for (i = endValue - 1; i >= 0; i--) {
												if ($(''.concat('.courses', i))
														.val().startsWith(
																subjectCode)) {
													$(''.concat('.courses', i))
															.removeClass(
																	"d-none");
												}
											}
										});

						$('#registerDueDate').datepicker({
							dateFormat : 'yy/mm/dd',
							minDate : 0
						});
						let classId = $('#classIdDataHolder').data("class-id");
						$('#editClassCancelBtn')
								.on(
										'click',
										function() {
											if (!confirm("Leaving this page will delete the changes. Do you want to leave this page?")) {
												return false;
											}

											location.href = "/univ/course/class_detail?classId="
													+ classId;
										});

						let prevCourseCode = $('#courseCodeHolder').data(
								'course-code');
						$('#editClassForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

											if (!confirm("Do you want to change the class information to the following information?")) {
												return false;
											}

											let courseName = $('#courseName')
													.val();
											if (courseName == "0") {
												alert("Please select the course that you are going to teach.");
												return false;
											}
											let courseCode = courseName
													.split(' - ')[0];

											let maxNum = $('#maxNum').val();
											if (maxNum == '') {
												alert("Please select the number of maximum students available in this class.");
												return false;
											}

											let registerDueDate = $(
													'#registerDueDate').val();
											if (registerDueDate == '') {
												alert("Please select the register due date of this class.");
												return false;
											}

											let timeCount = 0;
											let monStartTime = $('#dayOfWeek1')
													.val();
											if (monStartTime != "0") {
												timeCount++;
											}
											let tueStartTime = $('#dayOfWeek2')
													.val();
											if (tueStartTime != "0") {
												timeCount++;
											}
											let wedStartTime = $('#dayOfWeek3')
													.val();
											if (wedStartTime != "0") {
												timeCount++;
											}
											let thuStartTime = $('#dayOfWeek4')
													.val();
											if (thuStartTime != "0") {
												timeCount++;
											}
											let friStartTime = $('#dayOfWeek5')
													.val();
											if (friStartTime != "0") {
												timeCount++;
											}
											if (timeCount == 0) {
												alert("There has to be at least one class time.");
												return false;
											}

											if (!confirm("Are you sure you want to edit the class with these information?")) {
												return false;
											}

											let url = $(this).attr("action");
											$
													.ajax({
														type : "PUT",
														url : url,
														data : {
															"classId" : classId,
															"prevCourseCode" : prevCourseCode,
															"courseCode" : courseCode,
															"maxNum" : maxNum,
															"courseName" : courseName,
															"registerDueDateString" : registerDueDate,
															"monStartTime" : monStartTime,
															"tueStartTime" : tueStartTime,
															"wedStartTime" : wedStartTime,
															"thuStartTime" : thuStartTime,
															"friStartTime" : friStartTime,
														},
														success : function(data) {
															if (data.code == 1) {
																alert("Success editing class.");
																location.href = "/univ/course/class_detail?classId="
																		+ classId;
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
						$('#deleteClassBtn')
								.on(
										'click',
										function() {
											if (!confirm("Are you sure you want to delete the class "
													+ courseName + "?")) {
												return;
											}
											$
													.ajax({
														type : "DELETE",
														url : "/course/delete_class",
														data : {
															"classId" : classId
														},
														success : function(data) {
															if (data.code == 1) {
																alert("Success deleting class "
																		+ courseName
																		+ ".");
																location.href = "/univ/course/class_list"
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


