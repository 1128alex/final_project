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
			<h1 class="mt-3">Profile</h1>
			<a href="/univ/user/edit_profile" class="underline"><small>Edit</small></a>
		</div>
		<hr>
		<div class="d-flex justify-content-between">
			<div class="w-50">
				<h3 class="mt-2">Email</h3>
				<div>${user.email}</div>

				<c:if test="${user.type eq 'student'}">
					<h3 class="mt-4">Student Number</h3>
					<div>${user.studentNum}</div>
				</c:if>

				<h3 class="mt-4">Name</h3>
				<div>${user.firstName += ' ' += user.lastName}</div>

				<h3 class="mt-4">Account Type</h3>
				<c:if test="${user.type eq 'student'}">
					<div>Student</div>
				</c:if>
				<c:if test="${user.type eq 'professor'}">
					<div>Professor</div>
				</c:if>


				<h3 class="mt-4">Birth</h3>

				<div>
					<fmt:formatDate value="${user.birth}" pattern="d MMM yyyy" />
				</div>

				<h3 class="mt-4">Gender</h3>

				<div>${user.gender}</div>

				<c:if test="${user.type eq 'professor'}">
					<h3 class="mt-4">Subject</h3>

					<div>${user.subject}</div>
				</c:if>
				<div class="my-4"></div>
			</div>

			<div class="col-5">
				<h3 class="mt-2">Profile Image</h3>

				<div>
					<c:if test="${user.profileUrl ne null}">
						<img alt="profile" src="${user.profileUrl}" class="profileImgBox"
							height="200" width="200">
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="col-3"></div>
</div>