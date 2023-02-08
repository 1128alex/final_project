<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex justify-content-center">
	<div class="col-9">
		<div class="box d-flex">
			<c:forEach var="i" begin="1" end="10">
				<a href="#" id="classBox${i}" class="classBox mx-3 mt-4 mb-2"
					data-id="${i}">
					<div class="classBoxTitle"></div>
					<div class=""></div>
				</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-3 d-flex justify-content-center">
		<div class="classAside mt-4"></div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('.classBox').on('click', function() {
			let classBoxId = $(this).data("id");
			alert(classBoxId);
		})
	})
</script>