<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex h-100">
	<div class="col-6 bg-info">
		<h1>${user.userId}</h1>
		<h1>${userId}</h1>
		<h1>${user.type}</h1>
		<h1>${user.studentNum}</h1>
	</div>
	<div class="col-6 bg-primary"></div>
</div>

<script>
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>