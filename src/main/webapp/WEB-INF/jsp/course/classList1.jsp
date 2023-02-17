<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div>
	<div class="d-flex justify-content-center">
		<div class="col-9">
			<div>
				<h1 class="mt-4 ml-4">My Classes</h1>
			</div>
			<div class="box d-flex">
				<c:forEach var="_class" items="${classes}" varStatus="status">
					<a href="/univ/course/class_detail?classId=${_class.id}"
						id="classBox${status.count}" class="classBox mx-3 mt-4 mb-2"
						data-id="${_class.id}">
						<div class="classBoxTitle">
							<div class="d-flex justify-content-center">
								<h2 class="text-white">${_class.courseCode}</h2>
							</div>
							<div class="d-flex justify-content-center">
								<c:forEach var="course" items="${courses}">
									<c:if test="${_class.courseCode eq course.courseCode}">
										<h4 id="courseNameBox" class="text-center text-white">${course.courseName}</h4>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="my-3"></div>
		</div>
		<div class="col-3 classAsideArea">
			<h1 class="mt-4 ml-4">My Classes</h1>
			<div class="classAside mt-4 ml-4"></div>
		</div>
	</div>
</div>