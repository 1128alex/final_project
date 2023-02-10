<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-4">Assignments</h1>
		<div class="d-flex justify-content-end">
			<a href="/univ/assignment/add_assignemnt?classId=${classId}"
				class="btn button text-white">Add Assignment</a>
		</div>

		<table class="table mt-1">
			<thead>
				<tr>
					<th>Assignment Name</th>
					<th>Submitted Students</th>
					<th>Due Date</th>
					<th>Average Grade</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<div class="col-3"></div>
</div>