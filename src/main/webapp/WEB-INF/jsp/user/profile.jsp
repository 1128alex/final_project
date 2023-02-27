<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-4"></div>
	<div class="col-4">
		<div>
			<h1 class="mt-3">Profile</h1>
		</div>
		<hr>
		<div class="d-flex justify-content-between">
			<div class="w-50">
				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-2">Email</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>${user.email}</div>

				<c:if test="${user.type eq 'student'}">
					<div class="d-flex justify-content-between align-items-end">
						<h3 class="mt-4">Student Number</h3>
						<a href="#" class="underline mb-2"><small>Edit</small></a>
					</div>
					<div>${user.studentNum}</div>
				</c:if>

				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-4">First Name</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>${user.firstName}</div>
				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-4">Last Name</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>${user.lastName}</div>

				<h3 class="mt-4">Account Type</h3>
				<div>${user.type}</div>


				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-4">Birth</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>
					<fmt:formatDate value="${user.birth}" pattern="d MMM yyyy" />
				</div>

				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-4">Gender</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>${user.gender}</div>

				<c:if test="${user.type eq 'professor'}">
					<div class="d-flex justify-content-between align-items-end">
						<h3 class="mt-4">Subject</h3>
						<a href="#" class="underline mb-2"><small>Edit</small></a>
					</div>
					<div>${user.subject}</div>
				</c:if>
				<div class="my-4"></div>
			</div>

			<div class="col-5">
				<div class="d-flex justify-content-between align-items-end">
					<h3 class="mt-2">Profile Image</h3>
					<a href="#" class="underline mb-2"><small>Edit</small></a>
				</div>
				<div>
					<c:if test="${user.profileUrl ne null}">
						<img alt="profile" src="${user.profileUrl}" class="profileImgBox"
							height="200" width="200">
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<div class="col-4"></div>
</div>