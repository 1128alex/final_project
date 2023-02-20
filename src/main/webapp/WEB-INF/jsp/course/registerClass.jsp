<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-7">
		<h2 class="mt-3 font-weight-bold">Add Class</h2>
		<div class="mt-3">
			<h4>Select Course</h4>
			<b>Filter</b>
			<div class="d-flex">
				<div id="subjectCodeHolder" data-subject-code="${subjectCode}"></div>
				<select id="subjectCode" name="subjectCode"
					class="form-control col-5 mr-2">
					<option value="0">-- Subject --</option>
					<option value="CS">Computer Science</option>
					<option value="ECON">Economics</option>
					<option value="MATH">Math</option>
				</select>
				<div id="courseLevelHolder" data-course-level="${courseLevel}"></div>
				<select id="courseLevel" name="courseLevel"
					class="form-control col-5 ml-2">
					<option value="0">-- Level --</option>
					<c:forEach var="i" begin="1" end="4">
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
			<div class="d-flex 	align-items-end">
				<div class="d-flex align-items-end w-75">
					<div id="courseNameHolder" data-course-name="${courseName}"></div>
					<select id="courseName" name="courseName" class="form-control mt-2">
						<option value="0">-- Course --</option>
						<c:forEach var="course" items="${courseList}" varStatus="status">
							<option id="${course.courseCode}" value="${course.courseCode}"
								class="courses courses${status.index}">
								${course.courseCode += " - " += course.courseName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="mt-2 d-flex justify-content-between w-75">
				<input type="text" class="form-control" id="searchKeyword"
					value="${searchKeyword}" placeholder="Search with keywords">
				<div>
					<button type="button" id="clearBtn" class="btn button ml-3">Clear</button>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button type="button" id="searchBtn" class="btn button"
					onkeypress="click">Search</button>
			</div>
		</div>
		<div hidden="hidden" id="endValue" data-end-value="${length}"></div>

		<div class="mt-3">
			<table class="table table-bordered mt-1">
				<thead>
					<tr>
						<th>Course Code</th>
						<th>Course Name</th>
						<th>Professor</th>
						<th>Time</th>
						<th>Price</th>
						<th>Register Due Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="combined" items="${combinedList}"
						varStatus="status">
						<tr class="linkRow" id="classIdHolder"
							data-class-id="${combined.id}">
							<td>${combined.courseCode}</td>
							<td>${combined.courseName}</td>
							<td>${combined.firstName += " " += combined.lastName}</td>
							<td><table id="smallClassTimeTable">
									<thead>
										<tr>
											<th class="text-center">Mon</th>
											<th class="text-center">Tue</th>
											<th class="text-center">Wed</th>
											<th class="text-center">Thu</th>
											<th class="text-center">Fri</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:choose>
												<c:when test="${combined.monStartTime ne 0}">
													<td class="text-center">${combined.monStartTime += ":00"}</td>
												</c:when>
												<c:otherwise>
													<td class="text-center p-1">
														<div class="text-center">
															No<br>Class
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${combined.tueStartTime ne 0}">
													<td class="text-center">${combined.tueStartTime += ":00"}</td>

												</c:when>
												<c:otherwise>
													<td class="text-center p-1">
														<div class="text-center">
															No<br>Class
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${combined.wedStartTime ne 0}">
													<td class="text-center">${combined.wedStartTime += ":00"}</td>
												</c:when>
												<c:otherwise>
													<td class="text-center p-1">
														<div class="text-center">
															No<br>Class
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${combined.thuStartTime ne 0}">
													<td class="text-center">${combined.thuStartTime += ":00"}</td>
												</c:when>
												<c:otherwise>
													<td class="text-center p-1">
														<div class="text-center">
															No<br>Class
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${combined.friStartTime ne 0}">
													<td class="text-center">${combined.friStartTime += ":00"}</td>
												</c:when>
												<c:otherwise>
													<td class="text-center p-1">
														<div class="text-center">
															No<br>Class
														</div>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>

									</tbody>
								</table></td>
							<td><fmt:formatNumber value="${combined.price}"
									type="currency" currencySymbol="$" /></td>
							<td><fmt:formatDate value="${combined.registerDueDate}"
									pattern="dd/MM/YYYY" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex justify-content-center align-items-center my-3">
				<button type="button" id="prevBtn" class="btn button mr-4"
					value="${pageNum - 1}">Prev</button>
				<div id="pageLengthHolder" data-page-length="${pageLength}"></div>
				<c:forEach var="i" begin="1" end="${pageLength}">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<span
								class="coursePage mx-2 underline font-weight-bold"
								id="coursePage${i}" data-course-page="${i}">${i}</span>
						</c:when>
						<c:otherwise>
							<span class="coursePage mx-2" id="coursePage${i}"
								data-course-page="${i}">${i}</span>
						</c:otherwise>
					</c:choose>


				</c:forEach>
				<button type="button" id="nextBtn" class="btn button ml-4"
					value="${pageNum + 1}">Next</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(document)
			.ready(
					function() {
						let subjectCode = $('#subjectCodeHolder').data(
								'subject-code');
						$('#subjectCode').val(subjectCode).prop('selected',
								true);
						if (subjectCode == "") {
							$('#subjectCode').val('0');
						}

						let courseLevel = $('#courseLevelHolder').data(
								'course-level');
						$('#courseLevel').val(courseLevel).prop('selected',
								true);
						if (courseLevel == "") {
							$('#courseLevel').val('0');
						}

						let courseName = $('#courseNameHolder').data(
								'course-name');
						$('#courseName').val(courseName).prop('selected', true);
						if (courseName == "") {
							$('#courseName').val('0');
						}

						$('#courseLevel').on('click', function() {
							if ($('#subjectCode').val() == '0') {
								alert("Please select the subject code.");
								return;
							}
						});
						$('#clearBtn').on('click', function() {
							$('#subjectCode').val('0');
							$('#courseLevel').val('0');
							$('#courseName').val('0');
							$('#searchKeyword').val('');

							$('.courses').removeClass("d-none"); // All non hidden
						});
						$('#subjectCode, #courseLevel').on(
								'change',
								function() {
									$('#courseName').val('0');

									let subjectCode = $('#subjectCode').val();
									let courseLevel = $('#courseLevel').val();
									$('.courses').addClass("d-none"); // All hidden
									if (subjectCode == '0') {
										$('.courses').removeClass("d-none"); // All non hidden
										$('#courseLevel').val('0');
										return;
									}
									if ($('#courseLevel').val() != '0') {
										subjectCode = ''.concat(subjectCode,
												courseLevel);
									}

									let endValue = $('#endValue').data(
											"end-value");
									for (i = endValue - 1; i >= 0; i--) {
										if ($(''.concat('.courses', i)).val()
												.startsWith(subjectCode)) {
											$(''.concat('.courses', i))
													.removeClass("d-none");
										}
									}
								});
						$('#registerDueDate').datepicker({
							dateFormat : 'yy/mm/dd',
							minDate : 0
						});
						addEventListener("keydown", function(e) {
							if (e.key === "Enter") {
								$('#searchBtn').click();
							}
						});
						$('#searchBtn')
								.on(
										'click',
										function(e) {
											let searchKeyword = $(
													'#searchKeyword').val();
											let subjectCode = $('#subjectCode')
													.val();
											let courseLevel = $('#courseLevel')
													.val();
											let courseName = $('#courseName')
													.val().split(' - ');

											let parameterString = "";

											parameterString += "searchKeyword="
													+ searchKeyword;
											if (courseName != '0') {
												parameterString += "&courseName="
														+ courseName;
											} else if (courseName == '0') {
												if (subjectCode != '0') {
													parameterString += "&subjectCode="
															+ subjectCode;
												}
												if (courseLevel != '0') {
													parameterString += "&courseLevel="
															+ courseLevel;
												}
											}
											location.href = "/univ/course/register_class?"
													+ parameterString;
										});
						$('.linkRow')
								.on(
										'click',
										function() {
											let classIdHolder = $(this).data(
													'class-id');

											location.href = "/univ/course/register_class_detail?classId="
													+ classIdHolder;
										});
						$('.coursePage')
								.on(
										'click',
										function() {
											let searchKeyword = $(
													'#searchKeyword').val();
											let subjectCode = $('#subjectCode')
													.val();
											let courseLevel = $('#courseLevel')
													.val();
											let courseName = $('#courseName')
													.val().split(' - ');
											let pageNum = $(this).data(
													'course-page');

											let parameterString = "";

											parameterString += "searchKeyword="
													+ searchKeyword;
											if (courseName != '0') {
												parameterString += "&courseName="
														+ courseName;
											} else if (courseName == '0') {
												if (subjectCode != '0') {
													parameterString += "&subjectCode="
															+ subjectCode;
												}
												if (courseLevel != '0') {
													parameterString += "&courseLevel="
															+ courseLevel;
												}
											}
											parameterString += "&pageNum="
													+ pageNum;

											location.href = "/univ/course/register_class?"
													+ parameterString;

										});
						$('#prevBtn,#nextBtn')
								.on(
										'click',
										function() {
											let pageNum = $(this).val();
											if (pageNum == 0
													|| pageNum == $(
															'#pageLengthHolder')
															.data('page-length') + 1) {
												return;
											}
											$('#coursePage' + pageNum).click();
										})
					});
</script>