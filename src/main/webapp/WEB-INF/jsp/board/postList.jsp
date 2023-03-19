<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h1 class="mt-3">Board for</h1>

		<div class="d-flex justify-content-between">
			<select id="classId" name="classId" class="form-control sharpBorder">
				<option value="0">--- Course ---</option>
				<c:forEach var="combined" items="${combinedList}">
					<option value="${combined.id}">${combined.courseCode += ' - ' +=
						combined.courseName}</option>
				</c:forEach>
			</select>
			<button type="button" id="searchBtn" class="btn button sharpBorder">Search</button>
		</div>


		<div class="d-flex justify-content-end">
			<a href="/univ/board/add_post?classId=${classId}"
				class="btn button text-white my-2">Add Post</a>
		</div>
		<table class="table">
			<thead class="text-center">
				<tr>
					<th>Course Code</th>
					<th style="width: 70%">Title</th>
					<th>Poster</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${postList}">
					<tr class="linkRow" data-class-id="${post.classId}"
						data-post-id="${post.postId}">
						<td class="text-center">${post.courseCode}</td>
						<td>${post.title}</td>
						<td class="text-center">${post.firstName += ' ' += post.lastName}</td>
						<td class="text-center"><fmt:formatDate
								value="${post.updatedAt}" pattern="MMMM d, yyyy" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-center align-items-center my-3">
			<button type="button" id="prevBtn" class="btn button mr-4"
				value="${pageNum - 1}">Prev</button>
			<div id="pageLengthHolder" data-page-length="${pageLength}"></div>
			<c:forEach var="i" begin="1" end="${pageLength}">
				<c:choose>
					<c:when test="${i eq pageNum}">
						<span class="coursePage mx-2 underline font-weight-bold"
							id="coursePage${i}" data-course-page="${i}">${i}</span>
					</c:when>
					<c:otherwise>
						<span class="coursePage mx-2" id="coursePage${i}"
							data-course-page="${i}">${i}</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<button type="button" id="nextBtn" class="btn button ml-4"
				value="${pageNum + 1}">Next</button>
		</div>
	</div>
	<div class="col-3"></div>
	<div id="classIdHolder" hidden="hidden" data-class-id="${classId}"></div>

</div>

<script>
	$(document)
			.ready(
					function() {
						let classId = $('#classIdHolder').data("class-id");
						$('#classId').val(classId).prop("selected", true);
						$('#classId').on('change', function() {
							classId = $('#classId').val();
						})
						$('#searchBtn')
								.on(
										'click',
										function() {
											classId = $('#classId').val();
											location.href = "/univ/board/post_list?classId="
													+ classId;
										})
						$('.linkRow')
								.on(
										'click',
										function() {
											let classId = $(this).data(
													"class-id");
											let postId = $(this)
													.data("post-id");

											location.href = "/univ/board/post_detail?classId="
													+ classId
													+ "&postId="
													+ postId;
										});
						$('.coursePage')
								.on(
										'click',
										function() {
											let pageNum = $(this).data(
													'course-page');
											location.href = "/univ/assignment/assignment_list?classId="
													+ classId
													+ "&pageNum="
													+ pageNum;
										});

						$('#prevBtn,#nextBtn')
								.on(
										'click',
										function() {
											let pageNum = $(this).val();
											if (pageNum == 0
													|| pageNum == $(
															'#pageLengthHolder')
															.data('page-length') + 1) {
												return;
											}
											$('#coursePage' + pageNum).click();
										})
					});
</script>