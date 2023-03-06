<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-3">
	<a href="/univ/citations" class="text-white">See the image
		citations</a>
</div>
<div class="logo col-6">
	<div class="d-flex justify-content-center">
		<a href="/univ"> <img alt="logoImg"
			src="/static/img/logoFinalized-onlyLogo.png" height="120"
			class="mt-3">
		</a>
	</div>
</div>
<div class="col-3">
	<div class="d-flex justify-content-center align-items-center h-100">
		<button type="button" class="ml-5 dropdown-toggle btn button"
			data-toggle="dropdown">${user.firstName}</button>
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