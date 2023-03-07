<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h3 class="text-center">Make a Chat room with...</h3>
		<div class="ml-2">
			<h4>Selected</h4>
			<hr>
			<div>
				<ul id="memberList" class="d-flex">
				</ul>
			</div>
			<hr>
		</div>
		<div class="mt-3 d-flex justify-content-center">
			<div id="typeHolder" data-type="${type}"></div>
			<c:choose>
				<c:when test="${type eq 'professor'}">
					<label class="mr-2"><input type="radio" name="type"
						id="studCheck" value="student">Student</label>
					<label><input type="radio" name="type" checked="checked"
						id="profCheck" value="professor">Professor</label>
				</c:when>
				<c:otherwise>
					<label class="mr-2"><input type="radio" name="type"
						id="studCheck" checked="checked" value="student">Student</label>
					<label><input type="radio" name="type" id="profCheck"
						value="professor">Professor</label>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="d-flex">
			<input type="text" id="search" class="form-control sharpBorder"
				placeholder="Search with email or name" value="${search}">
			<button type="button" id="searchBtn" class="btn button sharpBorder">Search</button>
		</div>
		<div id="userListBox">
			<table class="table" id="userListTable" data-check="${type}">
				<c:forEach var="user" items="${userList}" varStatus="status">
					<tr class="linkRow" data-index="${status.current}"
						data-email="${user.email}">
						<td>${user.email}</td>
						<td>${user.firstName += ' ' += user.lastName}</td>
						<c:if test="${user.studentNum ne null}">
							<td>${user.studentNum}</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
		<h4>Room Name</h4>
		<div class="d-flex justify-content-center">
			<input type="text" id="roomName" class="form-control">
		</div>
		<div class="d-flex justify-content-end">
			<button id="createBtn" class="btn button">Create</button>
		</div>
	</div>
	<div class="col-3"></div>
</div>

<script>
	$(document)
			.ready(
					function() {
						let type = $('#typeHolder').data('type');
						if (type == '') {
							type = "student";
						}
						$('input[name=type]').on('change', function() {
							type = $(this).val();
						})

						let memberList = new Array();

						if ($('#userListTable').data('check') != '') {
							let member = localStorage.getItem("member").split(
									',');

							if (member != '') {
								for (let i = 0; i < member.length; i++) {
									memberList.push(member[i]);
									$('#memberList')
											.append(
													'<a href="#" class="deleteBtn noDecoA" data-email="' + member[i] + '"><li class="mx-3 d-flex align-items-center">'
															+ member[i]
															+ '<img class="ml-1" src="/static/img/75519.png" height="10"></li></a>');

									var elements = document
											.getElementsByTagName('tr');
									for (let j = 0; j < elements.length; j++) {

										if (elements[j].innerHTML
												.includes(member[i])) {
											elements[j].classList
													.add('selectedRow');
										}
									}
								}
							}
						}
						addEventListener("keydown", function(e) {
							if (e.key === "Enter") {
								$('#searchBtn').click();
							}
						});
						$('#searchBtn')
								.on(
										'click',
										function() {
											let search = $('#search').val();
											localStorage.setItem("member",
													memberList);

											location.href = "/univ/chat/create_chat?type="
													+ type
													+ "&search="
													+ search;

										});
						$('.linkRow')
								.on(
										'click',
										function() {
											let email = $(this).data('email');
											let index = $(this).data('index');

											if ($(this).hasClass('selectedRow')) {
												$(this).removeClass(
														'selectedRow');

												var elements = document
														.getElementsByTagName('li');
												for (let j = 0; j < elements.length; j++) {
													if (elements[j].innerHTML
															.includes(email)) {
														elements[j].remove();
													}
												}
												for (let i = 0; i < memberList.length; i++) {
													if (memberList[i] == (email)) {
														memberList.splice(i, 1);
														i--;
													}
												}
											} else {
												$(this).addClass('selectedRow');
												$('#memberList')
														.append(
																'<a href="#" class="deleteBtn noDecoA" data-email="' + email + '"><li class="mx-3 d-flex align-items-center">'
																		+ email
																		+ '<img class="ml-1" src="/static/img/75519.png" height="10"></li></a>');
												memberList.push(email);
											}
										});
						$('#memberList')
								.on(
										'click',
										'.deleteBtn',
										function(e) {
											e.preventDefault();

											let email = $(this).data('email');

											var liElements = document
													.getElementsByTagName('li');
											for (let i = 0; i < liElements.length; i++) {
												if (liElements[i].innerHTML
														.includes(email)) {
													liElements[i].remove();
												}
											}

											var trElements = document
													.getElementsByTagName('tr');
											for (let j = 0; j < trElements.length; j++) {
												if (trElements[j].innerHTML
														.includes(email)) {
													trElements[j].classList
															.remove('selectedRow');
												}
											}

											for (let k = 0; k < memberList.length; k++) {
												if (memberList[k] == (email)) {
													memberList.splice(k, 1);
													k--;
												}
											}
										});

						$('#createBtn')
								.on(
										'click',
										function() {
											let roomName = $('#roomName').val();

											let memberString = "";
											for (let i = 0; i < memberList.length; i++) {
												memberString += memberList[i]
														+ '/';
											}
											$
													.ajax({
														type : "GET",
														url : "/chat/create_chat_room",
														data : {
															"memberString" : memberString,
															"roomName" : roomName
														},
														success : function(data) {
															if (data.code == 1) {
																location.href = "/univ/chat/room?roomId="
																		+ data.roomId;
															} else {
																alert("error "
																		+ data.code
																		+ ": "
																		+ data.errorMessage);
															}
														},
														error : function(e) {
														}
													});
										});
					});
</script>