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
		<div>
			<h1 class="mt-3">Profile</h1>
		</div>
		<div class="d-flex justify-content-between">
			<div>
				<h3 class="mt-3">Email</h3>
				<div>${user.email}</div>

				<h3 class="mt-3">Name</h3>
				<div>${user.firstName += " " += user.lastName}</div>

				<h3 class="mt-3">Account Type</h3>
				<div>${user.type}</div>

				<c:if test="${user.type eq 'student'}">
					<h3 class="mt-3">Student Number</h3>
					<div>${user.studentNum}</div>
				</c:if>

				<h3 class="mt-3">Birth</h3>
				<div>
					<fmt:formatDate value="${user.birth}" pattern="d MMM yyyy" />
				</div>

				<h3 class="mt-3">Gender</h3>
				<div>${user.gender}</div>

				<c:if test="${user.type eq 'professor'}">
					<h3 class="mt-3">Subject</h3>
					<div>${user.subject}</div>
				</c:if>
			</div>

			<div>
				<h3 class="mt-3">Profile Image</h3>
				<div>
					<img alt="profile" src="${user.profileUrl}" class="profileImgBox"
						height="200" width="200">
				</div>
			</div>
		</div>

	</div>
	<div class="col-3"></div>
</div>