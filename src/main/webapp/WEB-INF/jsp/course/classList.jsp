<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div>
	<div class="d-flex justify-content-center">
		<div class="col-12">
			<div>
				<h1 class="mt-4 ml-4">My Classes</h1>
			</div>
			<hr>
			<div class="box d-flex">
				<c:forEach var="combined" items="${combinedList}" varStatus="status">
					<a href="/univ/course/class_detail?classId=${combined._class.id}"
						id="classBox${status.count}" class="classBox mx-3 mt-4 mb-2"
						data-id="${combined._class.id}">
						<div class="classBoxTitle">
							<div class="d-flex justify-content-center">
								<h2 class="text-white">${combined._class.courseCode}</h2>
							</div>
							<div class="d-flex justify-content-center">
								<h4 id="courseNameBox" class="text-center text-white">${combined.course.courseName}</h4>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="my-3"></div>
		</div>
	</div>
</div>