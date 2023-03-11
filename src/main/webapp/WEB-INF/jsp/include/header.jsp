<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="col-3">
	<a href="/univ/citations" class="text-white">See the image
		citations</a>
</div>
<div class="logo col-6">
	<div class="d-flex justify-content-center">
		<c:if test="${type ne 'admin'}">
			<a href="/univ/course/class_list"> <img alt="logoImg"
				src="/static/img/logoFinalized-onlyLogo.png" height="120"
				class="mt-3">
			</a>
		</c:if>
		<c:if test="${type eq 'admin'}">
			<a href="/univ/admin"> <img alt="logoImg"
				src="/static/img/logoFinalized-onlyLogo.png" height="120"
				class="mt-3">
			</a>
		</c:if>
	</div>
</div>
<div class="col-3">
	<div class="d-flex justify-content-center align-items-center h-100">
		<a class="ml-5 dropdown-toggle hover-pointer" data-toggle="dropdown">
			<img alt="" class="profileImgBox" src="${user.profileUrl}"
			height="50" width="50"> <span class="ml-1">${user.firstName}</span>
		</a>
		<div class="dropdown-menu">
			<a class="dropdown-item"
				href="/univ/user/profile?email=${user.email}">My profile</a> <a
				class="dropdown-item" href="/univ/chat/room">Chat</a> <a
				class="dropdown-item" href="/univ/mail/email_inbox">Email</a> <a
				class="dropdown-item" href="#">Notification</a>
			<div role="separator" class="dropdown-divider"></div>
			<a class="dropdown-item" href="/univ/user/log_out">Log out</a>
		</div>
	</div>
</div>