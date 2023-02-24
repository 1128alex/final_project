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
		<div class="d-flex justify-content-between align-items-end">
			<div>
				<h3 class="mt-3">${postCombined.title}</h3>
				<span>${postCombined.firstName += " " += postCombined.lastName}</span>
			</div>
			<c:if test="${postCombined.updatedAt eq postCombined.createdAt}">
				<span>Posted at <fmt:formatDate
						value="${postCombined.createdAt}" pattern="d MMM yyyy" />
				</span>
			</c:if>
			<c:if test="${postCombined.updatedAt ne postCombined.createdAt}">
				<span>Updated at <fmt:formatDate
						value="${postCombined.updatedAt}" pattern="d MMM yyyy" /></span>
			</c:if>
		</div>
		<hr>
		<div class="contentBox">${postCombined.content}</div>

		<hr>

		<h4 class="mt-3">Comment</h4>
		<c:forEach var="comment" items="${commentList}">
			<b>${comment.firstName += " " += comment.lastName}</b>
			<span>${comment.content}</span>
		</c:forEach>

		<hr>

		<div class="d-flex">
			<input type="text" class="form-control" id="content" name="content"
				placeholder="Comment">
			<button type="button" id="commentBtn" class="btn button">Comment</button>
		</div>

		<hr>

		<h3 class="mt-3">Post List</h3>
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
	<div id="dataHolder" data-class-id="${postCombined.classId}"
		data-post-id="${postCombined.postId}"></div>
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
				$('#commentBtn').on(
						'click',
						function() {
							let classId = $('#dataHolder').data('class-id');
							let postId = $('#dataHolder').data('post-id');
							let content = $('#content').val();

							$.ajax({
								type : "POST",
								url : "/board/add_comment",
								data : {
									"classId" : classId,
									"postId" : postId,
									"content" : content
								},
								success : function(data) {
									if (data.code == 1) {
										alert("success");
										location.reload();
									} else {
										alert("error " + data.code + ": "
												+ data.errorMessage);
									}
								},
								error : function(e) {
									alert("error: " + e);
								}
							})
						})
			})
</script>