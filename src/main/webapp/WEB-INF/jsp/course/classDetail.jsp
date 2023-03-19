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
		<h4 class="mt-3">
			<a href="/univ/course/class_list" class="underline noDecoA">Back
				to class list</a>
		</h4>
		<div class="d-flex justify-content-between align-items-end">
			<h1 class="text-center mt-3">${currentClass.courseCode += " - " += currentClass.courseName}</h1>
			<c:if test="${profEmail eq currentClass.profEmail}">
				<div class="mr-3">
					<a href="/univ/course/edit_class?classId=${currentClass.id}"
						class="btn button text-white">Edit</a>
				</div>
			</c:if>
		</div>
		<h4 class="mt-2">Professor: ${currentClass.firstName += ' ' +=
			currentClass.lastName += '(' += currentClass.profEmail += ')'}</h4>
		<hr>
		<h2 class="mt-3">Description</h2>
		<div class="d-flex justify-content-between">
			<span>${currentClass.description}</span><br>
		</div>
		<h2 class="mt-3">Class Time</h2>
		<div class="w-75">
			<table class="table table-bordered" id="classTable">
				<thead>
					<tr class="text-center">
						<th>Monday</th>
						<th>Tuesday</th>
						<th>Wednesday</th>
						<th>Thursday</th>
						<th>Friday</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-center">
						<td><c:choose>
								<c:when test="${currentClass.monStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.monStartTime > 12}">${currentClass.monStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.monStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.monStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.tueStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.tueStartTime > 12}">${currentClass.tueStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.tueStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.tueStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.wedStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.wedStartTime > 12}">${currentClass.wedStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.wedStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.wedStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.thuStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.thuStartTime > 12}">${currentClass.thuStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.thuStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.thuStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${currentClass.friStartTime ne 0}">
									<c:choose>
										<c:when test="${currentClass.friStartTime > 12}">${currentClass.friStartTime-12 += ":00 PM"}</c:when>
										<c:when test="${currentClass.friStartTime eq 12}">12:00 PM</c:when>
										<c:otherwise>${currentClass.friStartTime += ":00 AM"}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>No class</c:otherwise>
							</c:choose></td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="mt-4">
			<div class="d-flex justify-content-between align-items-end">
				<h2 class="mt-3">
					<a
						href="/univ/assignment/assignment_list?classId=${currentClass.id}"
						class="noDecoA">Assignments</a>
				</h2>
				<a class="underline"
					href="/univ/assignment/assignment_list?classId=${currentClass.id}">More
					Assignments</a>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>Assignment name</th>
						<th>Due Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="assignment" items="${assignmentList}">
						<tr>
							<td><a
								href="/univ/assignment/assignment_detail?classId=${currentClass.id}&asgmtId=${assignment.asgmtId}"
								class="asmntA">${assignment.asgmtName}</a></td>
							<td><fmt:formatDate value="${assignment.dueDate}"
									pattern="MMMM d, yyyy" /></td>
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
	</div>
	<div id="classIdHolder" data-class-id="${currentClass.id}"></div>
	<div class="col-3 classAsideArea">
		<div class="d-flex justify-content-between align-items-end">
			<h2 class="mt-3">
				<a href="/univ/board/post_list?classId=${currentClass.id}"
					class="noDecoA">Class Board</a>
			</h2>
			<a class="underline mb-2 mr-5"
				href="/univ/board/post_list?classId=${currentClass.id}">More
				Post</a>
		</div>
		<div class="classAside">
			<table class="table">
				<thead class="text-center">
					<tr>
						<th style="width: 70%">Title</th>
						<th>Poster</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${postList}">
						<tr class="linkRow" data-class-id="${post.classId}"
							data-post-id="${post.postId}">
							<td>${post.title}</td>
							<td class="text-center">${post.firstName += " " += post.lastName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let classId = $('#classIdHolder').data('class-id');
						$('.linkRow')
								.on(
										'click',
										function() {
											let postClassId = $(this).data(
													"class-id");
											let postId = $(this)
													.data("post-id");
											location.href = "/univ/board/post_detail?classId="
													+ postClassId
													+ "&postId="
													+ postId;
										});
						$('.coursePage')
								.on(
										'click',
										function() {
											let pageNum = $(this).data(
													'course-page');
											location.href = "/univ/course/class_detail?classId="
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