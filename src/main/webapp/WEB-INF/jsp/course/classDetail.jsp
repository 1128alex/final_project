<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="text-center mt-3">${currentClass.courseCode += " - " += currentCourse.courseName}</h1>
		<h2 class="mt-3">Description</h2>
		<div class="d-flex justify-content-between">
			<span>${currentCourse.description}</span><br> <a href=""
				class="btn button text-white">Student List</a>
		</div>
		<h2 class="mt-3">Class Time</h2>
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
		<div class="d-flex">
			<div class="col-6 border-right">
				<h1>
					<a href="" class="noDecoA">Class Board</a>
				</h1>
				<table class="table table-bordered">
					<tr>
						<th>Posts</th>
					</tr>
				</table>
			</div>
			<div class="col-6 border-left">
				<h1>
					<a
						href="/univ/assignment/assignment_list?classId=${currentClass.id}"
						class="noDecoA">Assignments</a>
				</h1>
				<table class="table">
					<thead>
						<tr>
							<th>Assignment name</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="" class="asmntA">Assignmnet1</a></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-3"></div>

</div>