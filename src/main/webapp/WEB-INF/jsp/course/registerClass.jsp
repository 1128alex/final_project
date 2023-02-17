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
				<select id="subjectCode" name="subjectCode"
					class="form-control col-5 mr-2">
					<option value="0">-- Subject --</option>
					<option value="CS">Computer Science</option>
					<option value="ECON">Economics</option>
					<option value="MATH">Math</option>
				</select> <select id="courseLevel" name="courseLevel"
					class="form-control col-5 ml-2">
					<option value="0">-- Level --</option>
					<c:forEach var="i" begin="1" end="4">
						<option>${i}</option>
					</c:forEach>
				</select>
			</div>
			<div class="d-flex 	align-items-end">
				<div class="d-flex align-items-end w-75">
					<select id="courseName" name="courseName" class="form-control mt-2">
						<option value="0">-- Course --</option>
						<c:forEach var="course" items="${courseList}" varStatus="status">
							<option id="${course.courseCode}"
								class="courses courses${status.index}">
								${course.courseCode += " - " += course.courseName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="mt-2 d-flex justify-content-between w-75">
				<input type="text" class="form-control" id="searchKeyword"
					value="${searchKeyword }">
				<div>
					<button type="button" id="clearBtn" class="btn button ml-3">Clear</button>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button type="button" id="searchBtn" class="btn button">Search</button>
			</div>
		</div>
		<div hidden="hidden" id="endValue" data-end-value="${length}"></div>

		<div class="mt-3">
			<table class="table table-bordered">
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
						<tr class="linkRow" data-class-id-holder="${combined._class.id}">
							<td>${combined._class.courseCode}</td>
							<td>${combined.course.courseName}</td>
							<td>${combined.user.firstName += " " += combined.user.lastName}</td>
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
												<c:when test="${combined._class.monStartTime ne 0}">
													<td class="text-center">${combined._class.monStartTime += ":00"}</td>
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
												<c:when test="${combined._class.tueStartTime ne 0}">
													<td class="text-center">${combined._class.tueStartTime += ":00"}</td>

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
												<c:when test="${combined._class.wedStartTime ne 0}">
													<td class="text-center">${combined._class.wedStartTime += ":00"}</td>
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
												<c:when test="${combined._class.thuStartTime ne 0}">
													<td class="text-center">${combined._class.thuStartTime += ":00"}</td>
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
												<c:when test="${combined._class.friStartTime ne 0}">
													<td class="text-center">${combined._class.friStartTime += ":00"}</td>
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
							<td><fmt:formatNumber value="${combined.course.price}"
									type="currency" currencySymbol="$" /></td>
							<td><fmt:formatDate
									value="${combined._class.registerDueDate}" pattern="dd/MM/YYYY" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(
			function() {
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

							let endValue = $('#endValue').data("end-value");
							for (i = endValue - 1; i >= 0; i--) {
								if ($(''.concat('.courses', i)).val()
										.startsWith(subjectCode)) {
									$(''.concat('.courses', i)).removeClass(
											"d-none");
								}
							}
						});
				$('#registerDueDate').datepicker({
					dateFormat : 'yy/mm/dd',
					minDate : 0
				});
				$('#searchBtn').on(
						'click',
						function() {
							let subjectCode = $('#subjectCode').val();
							let courseLevel = $('#courseLevel').val();
							let courseName = $('#courseName').val()
									.split(' - ');
							let searchKeyword = $('#searchKeyword').val();

							let subjectCodeString = "";
							let courseLevelString = "";
							let courseNameString = "";
							let searchKeywordString = "";

							if (searchKeyword != '') {
								searchKeywordString = "searchKeyword="
										+ searchKeyword;
							}

							if (courseName != 0) {
								if (searchKeyword != '') {
									courseNameString = "&courseName="
											+ courseName[0];
								} else {
									courseNameString = "courseName="
											+ courseName[0];
								}
							} else {
								if (subjectCode != 0) {
									if (searchKeyword != '') {
										subjectCodeString = "&subjectCode="
												+ subjectCode;
									} else {
										subjectCodeString = "subjectCode="
												+ subjectCode;
									}
								}
								if (courseLevel != 0) {
									courseLevelString = "&courseLevel="
											+ courseLevel;
								}
							}

							location.href = "/univ/course/register_class?"
									+ searchKeywordString + courseNameString
									+ subjectCodeString + courseLevelString;
						});
				$('.linkRow').on('click', function() {
					let classIdHolder = $(this).data('class-id-holder');
					alert(classIdHolder);
				});
			});
</script>