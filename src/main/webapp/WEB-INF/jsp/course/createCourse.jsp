<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Add Class</h2>
		<div>
			<h4>Class</h4>
			<select id="subjectCode" name="subjectCode" class="form-control">
				<option value="0">-- Subject --</option>
				<option value="CS">Computer Science</option>
				<option value="ECON">Economics</option>
				<option value="MATH">Math</option>
			</select> <select>
				<option>-- Course --</option>
				<c:forEach var="${courseList}" items="course">
					<option>${course}</option>
				</c:forEach>

			</select>
			<h4>Description</h4>
			<textarea id="description" name="description" class="form-control"
				placeholder="" rows="6" draggable="false"></textarea>



		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
	});
</script>