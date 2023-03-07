<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<ul class="nav nav-fill pt-2 noneSelectable">
	<li class="nav-item"><h4>
			<a href="/univ/course/class_list"
				class="nav-link text-white font-weight-bold">My Classes</a>
		</h4></li>
	<c:if test="${user.type eq 'student'}">
		<li class="nav-item"><h4>
				<a href="/univ/course/grade_class_list"
					class="nav-link text-white font-weight-bold">Grade</a>
			</h4></li>
	</c:if>
	<li class="nav-item"><h4>
			<a href="/univ/course/timetable"
				class="nav-link text-white font-weight-bold">Timetable</a>
		</h4></li>
	<!-- <li class="nav-item"><h4>
			<a href="#" class="nav-link text-white font-weight-bold">Programs</a>
		</h4></li>
	<li class="nav-item"><h4>
			<a href="#" class="nav-link text-white font-weight-bold">Professors</a>
		</h4></li> -->
	<li class="nav-item"><h4>
			<c:choose>
				<c:when test="${user.type eq 'student'}">
					<a href="/univ/course/register_class"
						class="nav-link text-white font-weight-bold">Register Class</a>
				</c:when>
				<c:when test="${user.type eq 'professor'}">
					<a href="/univ/course/create_class"
						class="nav-link text-white font-weight-bold">Create Class</a>
				</c:when>
			</c:choose>
		</h4></li>
</ul>