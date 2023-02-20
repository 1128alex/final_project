<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-4"></div>
	<div class="col-4">
		<div class="d-flex justify-content-between align-items-end">
			<h1 class="my-3">Assignment Detail</h1>
			<div class="mr-3">
				<a
					href="/univ/assignment/edit_assignment?classId=${assignment.classId}&asgmtId=${assignment.asgmtId}"
					class="btn button text-white">Edit</a>
			</div>
		</div>
		<h2 class="text-center mt-3">${assignment.asgmtName}</h2>
		<div class="d-flex justify-content-end">
			<span>${assignment.asgmtType}</span>
		</div>
		<c:if
			test="${assignment.asgmtType eq 'Graded Assignment'|| assignment.asgmtType eq 'Test'}">
			<div class="d-flex justify-content-end">
				<span>Out of ${assignment.maxScore}</span>
			</div>
		</c:if>
		<h3>Description</h3>
		<span>${assignment.content}</span>
		<h3 class="mt-4">File Attachments</h3>
		<div id="fileBox"></div>
		<div id="fileDataHolder" data-file-string="${assignment.filePath}"></div>

	</div>
	<div class="col-4"></div>
</div>

<script>
	$(document).ready(
			function() {
				let fileString = $('#fileDataHolder').data("file-string");
				if (fileString == '') {
					$('#fileBox').append("<span>No file attachments</span>");
				} else {
					let files = fileString.split(" ");

					for (let i = 0; i < files.length - 1; i++) {
						let fileName = files[i].split("/").pop();

						$('#fileBox').append(
								"<a href=\"" + files[i] + "\" class=\"noDecoA\" download>"
										+ fileName + "</a><br>");
					}
				}
			});
</script>
