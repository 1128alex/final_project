<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Function -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-2"></div>
	<div class="col-8 d-flex">
		<div class="col-4 chatRoomList greyBorder mt-4 px-0 noneSelectable">
			<div class="d-flex justify-content-between align-items-center">
				<h2 class="m-3">Chat List</h2>
				<div>
					<button type="button" id="createChatBtn" class="mr-2 btn button">New
						Chat</button>
					<!-- <button type="button" id="createChatBtn" class="btn button"
						data-toggle="modal" data-target="#modal">New Chat</button> -->
				</div>
			</div>

			<table class="table roomListTable">
				<tbody>
					<c:forEach var="room" items="${roomList}">
						<c:choose>
							<c:when test="${currentRoom.id eq room.id}">
								<tr class="linkRow selectedChatRoom" data-room-id="${room.id}">
									<td>${room.roomName}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="linkRow" data-room-id="${room.id}">
									<td>${room.roomName}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="col-8 greyBorder mt-4 px-0">
			<div class="ml-2 py-2 chatRoomTitle">
				<c:choose>
					<c:when test="${fn:length(currentRoom.roomName) > 50}">
						<h3>${fn:substring(currentRoom.roomName, 0, 48)}...</h3>
					</c:when>
					<c:otherwise>
						<h3>${currentRoom.roomName}</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="chatBox" class="chatRoomBox greyborder px-2">
				<c:forEach var="chat" items="${chatList}">
					<fmt:formatDate value="${chat.createdAt}" var="currentDate"
						pattern="d" />
					<c:if test="${currentDate ne lastDate}">
						<div class="d-flex justify-content-center">
							-----
							<fmt:formatDate value="${chat.createdAt}" pattern="d MMM yyyy" />
							-----
						</div>
					</c:if>
					<c:choose>
						<c:when test="${chat.writer eq loggedEmail}">
							<div class="d-flex justify-content-end my-2">
								<div class="d-flex align-items-end mr-1">
									<fmt:formatDate value="${chat.createdAt}" pattern="h:mm a" />
								</div>
								<div>
									<%-- <div class="d-flex justify-content-end">
										<b>${chat.writer}</b>
									</div> --%>
									<div class="chatBalloon myChat">
										<c:set var="currentChatId" value="${chat.id}"></c:set>
										<div>
											<div>${chat.content}</div>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex my-2">
								<div class="mr-2">
									<img alt="" src="${chat.profileUrl}" class="profileImgBox"
										height="30px" width="30px">
								</div>
								<div>
									<div>
										<b>${chat.firstName += ' ' += chat.lastName}</b>
									</div>
									<div class="d-flex">
										<div class="chatBalloon">
											<c:set var="currentChatId" value="${chat.id}"></c:set>
											<div>${chat.content}</div>
										</div>
										<div class="d-flex align-items-end ml-1">
											<fmt:formatDate value="${chat.createdAt}" pattern="h:mm a" />
										</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<c:set value="${currentDate}" var="lastDate"></c:set>
				</c:forEach>
				<div id="currentDateHolder" hidden="hidden">${currentDate}</div>
			</div>
			<div class="d-flex justify-content-end">
				<input type="text" id="content" class="form-control sharpBorder">
				<button type="button" id="sendBtn" class="btn button sharpBorder">Send</button>
			</div>
		</div>
	</div>
	<div class="col-2"></div>
	<div id="dataHolder" data-email="${loggedEmail}"
		data-room-id="${currentRoom.id}" data-current-id="${currentChatId}"></div>
</div>

<%-- <div class="modal fade" id="modal" data-backdrop="static"
	data-refresh="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="d-flex justify-content-end">
				<button id="closeBtn" class="btn button" data-dismiss="modal">Close</button>
			</div>
			<h3 class="text-center">Make a Chat room with...</h3>
			<div class="ml-2">
				<h4>Selected</h4>
				<hr>
				<div id="recieverList" class="d-flex"></div>
				<hr>
			</div>
			<div class="mt-3 d-flex justify-content-center">
				<label class="mr-2"><input type="radio" name="type"
					checked="checked" value="student">Student</label> <label><input
					type="radio" name="type" value="professor">Professor</label>
			</div>
			<div class="d-flex">
				<input type="text" id="nameSearch" class="form-control sharpBorder"
					placeholder="Search for name">
				<button type="button" id="searchBtn" class="btn button sharpBorder">Search</button>
			</div>
			<div id="userListBox">
				<table class="table" id="userListTable">
					<c:forEach var="user" items="${userList}">
						<tr class="linkRow">
							<td><input type="checkbox"></td>
							<td>${user.email}</td>
							<td>${user.firstName += ' ' += user.lastName}</td>
							<c:if test="${user.studentNum ne null}">
								<td>${user.studentNum}</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="d-flex justify-content-end">
				<button id="createBtn" class="btn button">Create</button>
			</div>
		</div>
	</div>
</div>
 --%>
<script>
	$(document)
			.ready(
					function() {
						const element = document.getElementById("chatBox");
						element.scrollTop = element.scrollHeight;

						let roomId = $('#dataHolder').data("room-id");
						let currentId = $('#dataHolder').data("current-id");
						let writer = $('#dataHolder').data("email");

						addEventListener("keydown", function(e) {
							if (e.key === "Enter") {
								$('#sendBtn').click();
							}
						});
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
															"roomId" : roomId,
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
									if (roomId == '') {
										return;
									}
									if (currentId == '') {
										currentId = 0;
									}
									let currentDate = $('#currentDateHolder')
											.text();
									$
											.ajax({
												type : "GET",
												url : "/chat/get_new_message",
												data : {
													"roomId" : roomId,
													"currentId" : currentId
												},
												success : function(data) {
													if (data.code == 1) {
														for (let i = 0; i < data.newChatList.length; i++) {
															let createdAt = new Date(
																	data.newChatList[i].createdAt);
															var hours = createdAt
																	.getHours();
															var ampm = "AM";
															if (hours >= 12) {
																ampm = "PM"
																hours -= 12;
															}
															if (hours == 0) {
																hours += 12;
															}

															var minutes = createdAt
																	.getMinutes();
															if (minutes < 10) {
																minutes = "0"
																		+ minutes;
															}
															var date = createdAt
																	.getDate();

															const monthNames = [
																	"Jan",
																	"Feb",
																	"Mar",
																	"Apr",
																	"May",
																	"Jun",
																	"Jul",
																	"Aug",
																	"Sep",
																	"Oct",
																	"Nov",
																	"Dec" ];
															var month = createdAt
																	.getMonth();
															var year = createdAt
																	.getFullYear();
															if (currentDate != date) {
																$('#chatBox')
																		.append(
																				'<div class="d-flex justify-content-center">-----'
																						+ date
																						+ " "
																						+ monthNames[month]
																						+ " "
																						+ year
																						+ '-----</div>');
															}

															if (data.newChatList[i].writer == writer) {
																$('#chatBox')
																		.append(
																				'<div class="d-flex justify-content-end my-2"><div class="d-flex align-items-end mr-1"><div>'
																						+ hours
																						+ ':'
																						+ minutes
																						+ " "
																						+ ampm
																						+ '</div></div><div class="chatBalloon myChat"><c:set var="currentChatId" value="${chat.id}"></c:set><div>'
																						+ data.newChatList[i].content
																						+ '</div></div></div>');

															} else if (data.newChatList[i].writer != writer) {
																$('#chatBox')
																		.append(
																				'<div class="d-flex my-2"><div class="mr-2"><img alt="" src="'+data.newChatList[i].profileUrl+'" class="profileImgBox" height="30px" width="30px"></div><div><div><b>'
																						+ data.newChatList[i].firstName
																						+ ' '
																						+ data.newChatList[i].lastName
																						+ '</b></div><div class="d-flex"><div class="chatBalloon"><c:set var="currentChatId" value="${chat.id}"></c:set><div>'
																						+ data.newChatList[i].content
																						+ '</div></div><div class="d-flex align-items-end ml-1">'
																						+ hours
																						+ ':'
																						+ minutes
																						+ " "
																						+ ampm
																						+ '</div></div></div></div>');
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
								}, 200);

						$('#createChatBtn').on('click', function() {
							let nameSearch = $('#nameSearch').val();
							location.href = "/univ/chat/create_chat";
						});

						$('.linkRow').on('click', function() {
							let roomId = $(this).data('room-id');
							location.href = "/univ/chat/room?roomId=" + roomId;
						});

					});
</script>