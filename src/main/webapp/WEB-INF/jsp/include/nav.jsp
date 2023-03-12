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
			<a href="/univ/assignment/assignment_list?classId=0"
				class="nav-link text-white font-weight-bold">Assignments</a>
		</h4></li>
	<li class="nav-item"><h4>
			<a href="/univ/board/post_list?classId=0"
				class="nav-link text-white font-weight-bold">Board</a>
		</h4></li>
	<li class="nav-item"><h4>
			<a href="/univ/course/timetable"
				class="nav-link text-white font-weight-bold">Class Management</a>
		</h4></li>
	<!-- <li class="nav-item"><h4>
			<a href="#" class="nav-link text-white font-weight-bold">Programs</a>
		</h4></li>
	<li class="nav-item"><h4>
			<a href="#" class="nav-link text-white font-weight-bold">Professors</a>
		</h4></li> -->
</ul>