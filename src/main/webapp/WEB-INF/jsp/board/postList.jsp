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
		<h1 class="mt-3">Post List</h1>
		<div class="d-flex justify-content-end">
			<a href="/univ/board/add_post?classId=${classId}"
				class="btn button text-white">Add Post</a>
		</div>
		<table class="table">
			<thead class="text-center">
				<tr>
					<th style="width: 70%">Title</th>
					<th>Poster</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${postList}">
					<tr class="linkRow" data-class-id="${post.classId}"
						data-post-id="${post.postId}">
						<td>${post.title}</td>
						<td class="text-center">${post.firstName += " " += post.lastName}</td>
						<td class="text-center"><fmt:formatDate
								value="${post.updatedAt}" pattern="d MMM yyyy" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document).ready(
			function() {
				$('.linkRow').on(
						'click',
						function() {
							let classId = $(this).data("class-id");
							let postId = $(this).data("post-id");

							location.href = "/univ/board/post_detail?classId="
									+ classId + "&postId=" + postId;
						});
			});
</script>