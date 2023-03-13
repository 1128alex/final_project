<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h4 class="mt-3">
			<a href="/univ/board/post_list?classId=${classId}"
				class="underline noDecoA">Back to post list</a>
		</h4>
		<h1 class="mt-3">Add post to Class</h1>

		<select id="classId" name="classId" class="form-control sharpBorder">
			<option value="0">--- Course ---</option>
			<c:forEach var="combined" items="${combinedList}">
				<option value="${combined.id}">${combined.courseCode += ' - ' +=
						combined.courseName}</option>
			</c:forEach>
		</select>


		<h3 class="mt-3">Title</h3>
		<input type="text" id="title" name="title" class="form-control">
		<h4 class="mt-2">Content</h4>
		<textarea rows="5" cols="" id="content" name="content"
			class="form-control"></textarea>
		<div class="d-flex justify-content-end mt-2">
			<input type="file" id="filePath3" name="filePath" multiple="multiple">
		</div>
		<div class="d-flex justify-content-end mt-2">
			<button type="button" id="postBtn" class="btn button">Post</button>
		</div>
		<hr>
		<div>
			<h3>Current Posts</h3>
			<table class="table">
				<thead class="text-center">
					<tr>
						<th>Title</th>
						<th>Poster</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
	<div class="col-3"></div>
	<div id="classIdHolder" data-class-id="${classId}"></div>
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
						$('#postBtn')
								.on(
										'click',
										function() {

											if (classId == 0) {
												alert('Please specify the class you are going to post at.')
												return;
											}

											let title = $('#title').val();
											if (title == '') {
												alert("Please write the title of the post.");
												return;
											}
											let content = $('#content').val();
											if (content == '') {
												if (!confirm("Are you sure you want to create the post without any content?")) {
													return;
												}
											}

											let inputFileList = new Array();
											for (let i = 0; i < $('#filePath3')[0].files.length; i++) {
												inputFileList
														.push($('#filePath3')[0].files[i]);
											}

											let formData = new FormData();
											formData.append("classId", classId);
											formData.append("title", title);
											formData.append("content", content);
											for (let i = 0; i < inputFileList.length; i++) {
												formData.append("files",
														inputFileList[i]);
											}

											$
													.ajax({
														type : "POST",
														url : "/board/add_post",
														data : formData,
														enctype : "multipart/form-data",
														processData : false,
														contentType : false,
														success : function(data) {
															if (data.code == 1) {
																alert("success");
																location.href = "/univ/board/post_list?classId="
																		+ classId;
															} else {
																alert("error "
																		+ data.code
																		+ ": "
																		+ data.errorMessage);
															}
														},
														error : function(e) {
															alert("error: " + e);
														}
													});
										});
					});
</script>