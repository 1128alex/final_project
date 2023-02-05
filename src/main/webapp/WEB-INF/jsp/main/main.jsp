<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="d-flex h-100">
	<div class="col-6 bg-info">
		<h1>${user.email}</h1>
		<h1>${user.type}</h1>
		<h1>${user.studentNum}</h1>
		<h1>${user.profileUrl}</h1>
		<img alt="profileImg" src="${user.profileUrl}" id="profileImgBox">
	</div>
	<div class="col-6 bg-primary"></div>
</div>
