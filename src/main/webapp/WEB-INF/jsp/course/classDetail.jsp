<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-2"></div>
	<div class="col-7">
		<h1>${currentClass.courseCode += " - " += currentCourse.courseName}</h1>
		<h2>Description</h2>
		<span>${currentCourse.description}</span><br>
		<h2>Class Time</h2>
		<div class="w-75">
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
								<c:when test="${currentClass.monStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.monStartTime > 12}">${currentClass.monStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.monStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.monStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.tueStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.tueStartTime > 12}">${currentClass.tueStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.tueStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.tueStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.wedStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.wedStartTime > 12}">${currentClass.wedStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.wedStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.wedStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.thuStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.thuStartTime > 12}">${currentClass.thuStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.thuStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.thuStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.friStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.friStartTime > 12}">${currentClass.friStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.friStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.friStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
					</tr>
				</tbody>
			</table>
		</div>


		<%-- 	<table class="table table-bordered">
			<c:if test="${currentClass.monStartTime ne 0}">
				<tr>
					<th>Monday</th>
					<td><c:choose>
							<c:when test="${currentClass.monStartTime > 12}">${currentClass.monStartTime-12 += ":00 PM"}</c:when>
							<c:when test="${currentClass.monStartTime eq 12}">12:00 PM</c:when>
							<c:otherwise>${currentClass.monStartTime += ":00 AM"}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:if>

			<c:if test="${currentClass.tueStartTime ne 0}">
				<tr>
					<th>Tuesday</th>
					<td><c:choose>
							<c:when test="${currentClass.tueStartTime > 12}">${currentClass.tueStartTime-12 += ":00 AM"}</c:when>
							<c:when test="${currentClass.tueStartTime eq 12}">12:00 PM</c:when>
							<c:otherwise>${currentClass.tueStartTime += ":00 PM"}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:if>
			<c:if test="${currentClass.wedStartTime ne 0}">
				<tr>
					<th>Wednesday</th>
					<td><c:choose>
							<c:when test="${currentClass.wedStartTime > 12}">${currentClass.wedStartTime-12 += ":00 AM"}</c:when>
							<c:when test="${currentClass.wedStartTime eq 12}">12:00 PM</c:when>
							<c:otherwise>${currentClass.wedStartTime += ":00 PM"}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:if>
			<c:if test="${currentClass.thuStartTime ne 0}">
				<tr>
					<th>Thursday</th>
					<td><c:choose>
							<c:when test="${currentClass.thuStartTime > 12}">${currentClass.thuStartTime-12 += ":00 PM"}</c:when>
							<c:when test="${currentClass.thuStartTime eq 12}">12:00 PM</c:when>
							<c:otherwise>${currentClass.thuStartTime += ":00 AM"}</c:otherwise>
						</c:choose>
				</tr>
			</c:if>
			<c:if test="${currentClass.friStartTime ne 0}">
				<tr>
					<th>Friday</th>
					<td><c:choose>
							<c:when test="${currentClass.friStartTime > 12}">${currentClass.friStartTime-12 += ":00 PM"}</c:when>
							<c:when test="${currentClass.friStartTime eq 12}">12:00 PM</c:when>
							<c:otherwise>${currentClass.friStartTime += ":00 AM"}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:if>
		</table> --%>


		<h1>${currentClass.id}</h1>
		<h1>${currentClass.courseCode}</h1>
		<h1>${currentClass.profEmail}</h1>
		<h1>${currentClass.maxNum}</h1>
		<h1>${currentClass.registerDueDate}</h1>
		<c:if test="${currentClass.monStartTime ne 0}">
			<h1>${currentClass.monStartTime}</h1>
		</c:if>
		<h1>${currentClass.tueStartTime}</h1>
		<h1>${currentClass.wedStartTime}</h1>
		<h1>${currentClass.thuStartTime}</h1>
		<h1>${currentClass.friStartTime}</h1>
		<h1>${currentCourse.courseCode}</h1>
		<h1>${currentCourse.courseName}</h1>
		<h1>${currentCourse.description}</h1>
		<h1>${currentCourse.price}</h1>
	</div>
	<div class="col-3 classAsideArea">
		<h1 class="mt-4 ml-4">My Classes</h1>
		<div class="classAside mt-4 ml-4"></div>
	</div>

</div>