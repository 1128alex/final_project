<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-6">
		<h2 class="mt-3 font-weight-bold">Add Class</h2>
		<form id="addClassForm" action="/course/create_class" method="get">
			<div class="col-10">
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
				<div id="endValueHolder" data-end-value="${length}"></div>
				<select id="courseName" name="courseName"
					class="form-control col-8 mt-2">
					<option value="0">-- Course --</option>
					<c:forEach var="course" items="${courseList}" varStatus="status">
						<c:forEach var="combined" items="${combinedList}">
							<c:if test="${combined.courseCode ne course.courseCode}">
								<option id="${course.courseCode}"
									class="courses courses${status.index}">
									${course.courseCode += " - " += course.courseName}</option>
							</c:if>
						</c:forEach>
					</c:forEach>
				</select>
				<div class="mt-3 d-flex">
					<div class="w-50 d-flex justify-content-center">
						<div class="text-center">
							<h4>Maximum Students</h4>
							<div class="d-flex justify-content-center">
								<input type="number" id="maxNum" name="maxNum"
									class="form-control col-8">
							</div>
						</div>
					</div>
					<div class="w-50 d-flex justify-content-center">
						<div class="text-center">
							<h4>Registration Due Date</h4>
							<div class="d-flex justify-content-center">
								<input type="text" id="registerDueDate" name="registerDueDate"
									class="form-control col-11">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3">
				<h3 class="mt-3">Timetable</h3>
				<span>Select class times.(Blue is the selected time)</span>
				<table
					class="table table-bordered border-grey colFixedTable smallTimetable">
					<thead class="text-center">
						<tr>
							<th>Time</th>
							<th>Monday</th>
							<th>Tuesday</th>
							<th>Wednesday</th>
							<th>Thursday</th>
							<th>Friday</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach var="i" begin="6" end="20">
							<tr>
								<td>
									<div class="h-100">
										<div
											class="h-100 d-flex justify-content-center align-items-center">${i}:00</div>
									</div>
								</td>
								<td class="p-0"><c:set var="count" value="0" />
									<div class="h-100">
										<c:forEach var="combined" items="${combinedList}">
											<c:choose>
												<c:when test="${combined.monStartTime eq i}">
													<c:set var="count" value="1"></c:set>
													<div id="mon${i}"
														class="classFilledTime h-100 d-flex justify-content-center align-items-center">${combined.courseCode}
													</div>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${count eq 0}">
											<div id="mon${i}"
												class="classAvailableTime h-100 d-flex justify-content-center align-items-center"
												data-time="mon${i}"></div>
										</c:if>
									</div></td>
								<td class="p-0"><c:set var="count" value="0" />
									<div class="h-100">
										<c:forEach var="combined" items="${combinedList}">
											<c:choose>
												<c:when test="${combined.tueStartTime eq i}">
													<c:set var="count" value="1"></c:set>
													<div id="tue${i}"
														class="classFilledTime h-100 d-flex justify-content-center align-items-center">${combined.courseCode}</div>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${count eq 0}">
											<div id="tue${i}"
												class="classAvailableTime h-100 d-flex justify-content-center align-items-center"
												data-time="tue${i}"></div>
										</c:if>
									</div></td>
								<td class="p-0"><c:set var="count" value="0" />
									<div class="h-100">
										<c:forEach var="combined" items="${combinedList}">
											<c:choose>
												<c:when test="${combined.wedStartTime eq i}">
													<c:set var="count" value="1"></c:set>
													<div id="wed${i}"
														class="classFilledTime h-100 d-flex justify-content-center align-items-center">${combined.courseCode}</div>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${count eq 0}">
											<div id="wed${i}"
												class="classAvailableTime h-100 d-flex justify-content-center align-items-center"
												data-time="wed${i}"></div>
										</c:if>
									</div></td>
								<td class="p-0"><c:set var="count" value="0" />
									<div class="h-100">
										<c:forEach var="combined" items="${combinedList}">
											<c:choose>
												<c:when test="${combined.thuStartTime eq i}">
													<c:set var="count" value="1"></c:set>
													<div id="thu${i}"
														class="classFilledTime h-100 d-flex justify-content-center align-items-center">${combined.courseCode}</div>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${count eq 0}">
											<div id="thu${i}"
												class="classAvailableTime h-100 d-flex justify-content-center align-items-center"
												data-time="thu${i}"></div>
										</c:if>
									</div></td>
								<td class="p-0"><c:set var="count" value="0" />
									<div class="h-100">
										<c:forEach var="combined" items="${combinedList}">
											<c:choose>
												<c:when test="${combined.friStartTime eq i}">
													<c:set var="count" value="1"></c:set>
													<div id="fri${i}"
														class="classFilledTime h-100 d-flex justify-content-center align-items-center">${combined.courseCode}</div>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${count eq 0}">
											<div id="fri${i}"
												class="classAvailableTime h-100 d-flex justify-content-center align-items-center"
												data-time="fri${i}"></div>
										</c:if>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="d-flex justify-content-end">
				<button type="submit" id="addClassSubmitBtn" class="btn button mb-4">Create</button>
			</div>
		</form>
	</div>
</div>
<script>
	$(document)
			.ready(
					function() {
						$('#subjectLevel').on('click', function() {
							if ($('#subjectCode').val() == "0") {
								alert("Please select the subject code.");
								return;
							}
						});
						$('.classAvailableTime')
								.on(
										'click',
										function() {
											let courseName = $('#courseName')
													.val();
											if (courseName == "0") {
												alert("Please select the course that you are going to teach.");
												return;
											}
											let courseCode = courseName
													.split(' - ')[0];

											let dayOfWeek = $(this)
													.data("time").substring(0,
															3);
											let time = $(this).data("time")
													.substring(3);

											for (let i = 6; i <= 20; i++) {
												if ($('#'.concat(dayOfWeek, i))
														.hasClass(
																"classSelectedTime")
														&& i != time) {
													alert("There is a class already in the same day.");
													return;
												}
											}

											if ($(this).hasClass(
													"classSelectedTime")) {
												$(this).removeClass(
														"classSelectedTime");
												$(this).text("");
											} else {
												$(this).addClass(
														"classSelectedTime");
												$(this).text(courseCode);
											}
										});

						$('#subjectCode, #subjectLevel')
								.on(
										'change',
										function() {
											$('#courseName').val('0');
											$('#courseName').change();

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

											let endValue = $('#endValueHolder')
													.data("end-value");
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
						$('#courseName').on(
								'change',
								function() {
									$('.classSelectedTime').text("");
									$('.classSelectedTime').removeClass(
											'classSelectedTime');


									});
								})
						$('#registerDueDate').datepicker({
							dateFormat : 'yy/mm/dd',
							minDate : 0
						});

						$('#addClassForm')
								.on(
										'submit',
										function(e) {
											e.preventDefault();

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

											let monStartTime;
											let tueStartTime;
											let wedStartTime;
											let thuStartTime;
											let friStartTime;

											let timeCount = 0;
											for (let i = 6; i <= 20; i++) {
												if ($('#mon'.concat(i))
														.hasClass(
																'classSelectedTime')) {
													monStartTime = $(
															'#mon'.concat(i))
															.data("time")
															.substring(3);
													timeCount++;
												}
												if ($('#tue'.concat(i))
														.hasClass(
																'classSelectedTime')) {
													tueStartTime = $(
															'#tue'.concat(i))
															.data("time")
															.substring(3);
													timeCount++;
												}
												if ($('#wed'.concat(i))
														.hasClass(
																'classSelectedTime')) {
													wedStartTime = $(
															'#wed'.concat(i))
															.data("time")
															.substring(3);
													timeCount++;
												}
												if ($('#thu'.concat(i))
														.hasClass(
																'classSelectedTime')) {
													thuStartTime = $(
															'#thu'.concat(i))
															.data("time")
															.substring(3);
													timeCount++;
												}
												if ($('#fri'.concat(i))
														.hasClass(
																'classSelectedTime')) {
													friStartTime = $(
															'#fri'.concat(i))
															.data("time")
															.substring(3);
													timeCount++;
												}
											}
											if (timeCount == 0) {
												alert("Please select your class time.");
												return false;
											}

											if (!confirm("Are you sure you want to create the class with these information?")) {
												return false;
											}

											let url = $(this).attr("action");
											$
													.ajax({
														type : "PUT",
														url : url,
														data : {
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
																alert("success");
																location.href = "/univ/course/class_list";
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