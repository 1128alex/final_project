<%@page import="com.univ.course.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-4">
		<h2 class="mt-3 font-weight-bold">Add Class</h2>
		<div>
			<div class="mt-3">
				<h4>Class</h4>
				<div class="d-flex">
					<select id="subjectCode" name="subjectCode"
						class="form-control col-6">
						<option value="0">-- Subject --</option>
						<option value="CS">Computer Science</option>
						<option value="ECON">Economics</option>
						<option value="MATH">Math</option>
					</select> <select id="subjectLevel" name="subjectLevel"
						class="form-control col-6">
						<option value="0">-- Level --</option>
						<c:forEach var="i" begin="1" end="4">
							<option>${i}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div hidden="hidden" id="endValue" data-end-value="${length}"></div>
			<select id="subjectName" name="subjectName"
				class="form-control col-8">
				<option value="0">-- Course --</option>
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<option id="${course.courseCode}"
						class="courses courses${status.index}">
						${course.courseCode += " - " += course.courseName}</option>
				</c:forEach>
			</select>
			<div class="mt-3">
				<div class="d-flex">
					<div>
						<h4>Maximum Students</h4>
						<input type="number" id="maxNum" name="maxNum"
							class="form-control col-8">
					</div>
					<div>
						<h4>Registration Due Date</h4>
						<input type="text" id="registerDueDate" name="registerDueDate"
							class="form-control col-11">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#subjectLevel').on('click', function() {
			if ($('#subjectCode').val() == "0") {
				alert("Please select the subject code.");
				return;
			}
		});
		$('#subjectCode, #subjectLevel').on('change', function() {
			$('#subjectName').val('0');

			let subjectCode = $('#subjectCode').val();
			let subjectLevel = $('#subjectLevel').val();
			$('.courses').addClass("d-none"); // All hidden
			if (subjectCode == "0") {
				$('.courses').removeClass("d-none"); // All non hidden
				return;
			}
			if ($('#subjectLevel').val() != "0") {
				subjectCode = ''.concat(subjectCode, subjectLevel);
			}

			let endValue = $('#endValue').data("end-value");
			for (i = endValue - 1; i >= 0; i--) {
				if ($(''.concat('.courses', i)).val().startsWith(subjectCode)) {
					$(''.concat('.courses', i)).removeClass("d-none");
				}
			}
		});
		$('#registerDueDate').datepicker();
	});
</script>