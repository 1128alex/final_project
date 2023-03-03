<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-2"></div>
	<div class="col-8 d-flex">
		<div class="col-4 chatRoomList greyBorder mt-4">
			<div class="d-flex justify-content-between align-items-end">
				<h1>Chat Rooms</h1>
				<div>
					<button type="button" id="createChatBtn" class="btn button"
						data-toggle="modal" data-target="#modal">New Chat</button>
				</div>
			</div>
			<table class="table">
				<tr class="linkRow">
					<td>a</td>
				</tr>
				<tr class="linkRow">
					<td>b</td>
				</tr>
			</table>

		</div>
		<div class="col-8 greyBorder mt-4 px-0">
			<div class="ml-2">
				<h1>${currentRoom.roomName}</h1>
				<div id="emailHolder" data-email="${loggedEmail}">${loggedEmail}</div>
			</div>
			<hr>
			<div id="chatBox">
				<c:forEach var="chat" items="${chatList}">
					<c:choose>
						<c:when test="${chat.writer eq loggedEmail}">
							<div class="d-flex justify-content-end">
								<div>
									<c:set var="currentChatId" value="${chat.id}"></c:set>
									<div class="d-flex justify-content-end">
										<b>${chat.writer}</b>
									</div>
									<div class="d-flex justify-content-end">${chat.content}</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:set var="currentChatId" value="${chat.id}"></c:set>
							<div>
								<b>${chat.writer}</b>
							</div>
							<div>${chat.content}</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="d-flex justify-content-end">
				<input type="text" id="content" class="form-control sharpBorder">
				<button type="button" id="sendBtn" class="btn button sharpBorder">Send</button>
			</div>
		</div>
	</div>
	<div class="col-2"></div>
	<div id="chatDataHolder" data-current-id="${currentChatId}"></div>
</div>

<div class="modal fade" id="modal" data-backdrop="static">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content text-center">
			<div class="d-flex justify-content-end">
				<button id="closeBtn" class="btn button" data-dismiss="modal">Close</button>
			</div>
			<h1>Receiver</h1>
			<div id="recieverList"></div>
			<div class="d-flex">
				<label><input type="radio" name="type">Student</label> <label><input
					type="radio" name="type">Professor</label>
			</div>
			<div class="d-flex">
				<input type="text" id="nameSearch" class="form-control sharpBorder"
					placeholder="Search for name">
				<button type="button" id="searchBtn" class="btn button sharpBorder">Search</button>
			</div>

			<div id="userListBox"></div>
			<div class="d-flex justify-content-end">
				<button id="createBtn" class="btn button">Create</button>
			</div>


		</div>
	</div>
</div>


<script>
	$(document)
			.ready(
					function() {
						const element = document.getElementById("chatBox");
						element.scrollTop = element.scrollHeight;

						let roomId = 1;
						let currentId = $('#chatDataHolder').data("current-id");
						let writer = $('#emailHolder').data("email");

						$('#sendBtn')
								.on(
										'click',
										function() {
											let content = $('#content').val()
											$('#content').val('');

											if (writer == '') {
												alert("Please designate the receiver.");
												return;
											}
											if (content == '') {
												return;
											}

											$
													.ajax({
														type : "GET",
														url : "/chat/add_message",
														data : {
															"roomId" : 1,
															"writer" : writer,
															"content" : content
														},
														success : function(data) {
															if (data.code == 1) {
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

						setInterval(
								function() {
									if (currentId == '') {
										currentId = 0;
									}
									$
											.ajax({
												type : "GET",
												url : "/chat/get_new_message",
												data : {
													"roomId" : 1,
													"currentId" : currentId
												},
												success : function(data) {
													if (data.code == 1) {
														for (let i = 0; i < data.newChatList.length; i++) {
															if (data.newChatList[i].writer == writer) {
																$('#chatBox')
																		.append(
																				'<div class="d-flex justify-content-end"><div><div><b>'
																						+ data.newChatList[i].writer
																						+ '</b></div><div>'
																						+ data.newChatList[i].content
																						+ '</div></div></div>');

															} else if (data.newChatList[i].writer != writer) {
																$('#chatBox')
																		.append(
																				'<div><b>'
																						+ data.newChatList[i].writer
																						+ '</b></div><div>'
																						+ data.newChatList[i].content
																						+ '</div>');
															}
															const element = document
																	.getElementById("chatBox");
															element.scrollTop = element.scrollHeight;
															currentId = data.newChatList[i].id;
														}

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
								}, 300000);

						$('#searchBtn')
								.on(
										'click',
										function() {
											let type = $('input[name=type]')
													.val();
											let nameSearch = $('#nameSearch')
													.val();

											$
													.ajax({
														type : "GET",
														url : "/user/user_list",
														data : {
															"type" : type,
															"name" : nameSearch
														},
														success : function(data) {
															if (data.code == 1) {
																alert("success");

																for (let i = 0; i < data.userList
																		.length(); i++)
																	$(
																			'#userListBox')
																			.append();
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

						$('#createBtn').on('click', function() {

							$.ajax({
								type : "delete",
								url : "/post/delete",
								data : {},
								success : function(data) {
									if (data.code == 1) {
										location.reload(true);
									} else {
										alert(data.errorMessage);
									}
								},
								error : function(e) {
								}
							});
						});
					});
</script>