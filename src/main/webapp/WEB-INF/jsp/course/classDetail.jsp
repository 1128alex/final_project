<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-5">
		<h1>${currentClass.courseCode += " - " += currentCourse.courseName}</h1>
		<h2>Description</h2>
		<span>${currentCourse.description}</span><br>
		<h2>Class Time</h2>
		<span> <c:if test="${currentClass.monStartTime ne 0}">
				<c:choose>
					<c:when test="${currentClass.monStartTime > 12}">${"Monday: " += currentClass.monStartTime-12 += ":00 PM"}</c:when>
					<c:otherwise>${"Monday: " += currentClass.monStartTime += ":00 AM"}</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</span> <span> <c:if test="${currentClass.tueStartTime ne 0}">
				<c:choose>
					<c:when test="${currentClass.tueStartTime > 12}">${"Tuesday: " += currentClass.tueStartTime-12 += ":00 PM"}</c:when>
					<c:otherwise>${"Tuesday: " += currentClass.tueStartTime += ":00 AM"}</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</span> <span> <c:if test="${currentClass.monStartTime ne 0}">
				<c:choose>
					<c:when test="${currentClass.wedStartTime > 12}">${"Wednesday: " += currentClass.wedStartTime-12 += ":00 PM"}</c:when>
					<c:otherwise>${"Wednesday: " += currentClass.wedStartTime += ":00 AM"}</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</span> <span> <c:if test="${currentClass.thuStartTime ne 0}">
				<c:choose>
					<c:when test="${currentClass.thuStartTime > 12}">${"Thursday: " += currentClass.thuStartTime-12 += ":00 PM"}</c:when>
					<c:otherwise>${"Thursday: " += currentClass.thuStartTime += ":00 AM"}</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</span> <span> <c:if test="${currentClass.friStartTime ne 0}">
				<c:choose>
					<c:when test="${currentClass.friStartTime > 12}">${"Friday: " += currentClass.friStartTime-12 += ":00 PM"}</c:when>
					<c:otherwise>${"Friday: " += currentClass.friStartTime += ":00 AM"}</c:otherwise>
				</c:choose>
			</c:if>
		</span>

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
	<div class="col-4"></div>

</div>