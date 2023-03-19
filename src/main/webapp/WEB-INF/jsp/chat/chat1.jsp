<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Formatting-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="ml-2 py-2 chatRoomTitle d-flex justify-content-between">
				<div class="col-9 unselectable">
					<h3>${currentRoom.roomName}</h3>
				</div>
				<c:if test="${currentRoom.roomName ne null}">
					<a class="dropdown-toggle hover-pointer mr-2"
						data-toggle="dropdown"> <img class="profileImgBox"
						src="/static/img/noprofile.png" height="30" width="30">
					</a>
					<div class="dropdown-menu col-3">
						<c:forEach var="member" items="${memberList}">
							<div class="dropdown-item px-0">
								<div class="d-flex align-items-center">
									<img alt="profile" class="profileImgBox mx-2"
										src="${member.profileUrl}" height="30" width="30">
									<div>${member.firstName += ' ' += member.lastName}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div id="chatBox" class="chatRoomBox greyborder px-2">
				<c:forEach var="chat" items="${chatList}">
					<fmt:formatDate value="${chat.createdAt}" var="currentDate"
						pattern="d" />
					<c:if test="${currentDate ne lastDate}">
						<div class="d-flex justify-content-center">
							-----
							<fmt:formatDate value="${chat.createdAt}" pattern="MMMM d, yyyy" />
							-----
						</div>
					</c:if>
					<c:choose>
						<c:when test="${chat.writer eq loggedEmail}">
							<div class="d-flex justify-content-end my-2">
								<div class="d-flex align-items-end mr-1 unselectable">
									<fmt:formatDate value="${chat.createdAt}" pattern="h:mm a" />
								</div>
								<div>
									<%-- <div class="d-flex justify-content-end">
										<b>${chat.writer}</b>
									</div> --%>
									<div class="chatBalloon myChat px-2">
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
								<div class="mr-2 unselectable">
									<img alt="" src="${chat.profileUrl}" class="profileImgBox"
										height="30px" width="30px">
								</div>
								<div>
									<div>
										<b class="unselectable">${chat.firstName += ' ' += chat.lastName}</b>
									</div>
									<div class="d-flex">
										<div class="chatBalloon px-2">
											<c:set var="currentChatId" value="${chat.id}"></c:set>
											<div>${chat.content}</div>
										</div>
										<div class="d-flex align-items-end ml-1 unselectable">
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
			<div id="timezoneStatus">
				<div>Server Timezone: ${serverTimeZone}</div>
				<div>Server Offset: ${serverOffset}</div>
				<div>Timezone: ${timezone}</div>
				<div>Offset: ${offset}</div>
				<div id="timezoneStatusJS">JavaScript:</div>
			</div>
			<c:if test="${currentRoom.roomName ne null}">
				<div class="d-flex">
					<input type="text" id="content" class="form-control sharpBorder">
					<button type="button" id="sendBtn" class="btn button sharpBorder">Send</button>
				</div>
			</c:if>
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
						var offset = new Date().getTimezoneOffset();
						$('#timezoneStatusJS').append(offset);

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

						let pause = false;
						setInterval(
								function() {
									if (pause == false) {
										if (roomId == '') {
											return;
										}
										pause = true;
										if (currentId == '') {
											currentId = 0;
										}
										let currentDate = $(
												'#currentDateHolder').text();

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
																let hours = createdAt
																		.getHours()
																		- offset
																		/ 60;
																let ampm = "AM";
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
																		"January",
																		"Febuary",
																		"March",
																		"April",
																		"May",
																		"June",
																		"July",
																		"August",
																		"September",
																		"October",
																		"November",
																		"December" ];
																var month = createdAt
																		.getMonth();
																var year = createdAt
																		.getFullYear();
																if (currentDate != date) {
																	$(
																			'#chatBox')
																			.append(
																					'<div class="d-flex justify-content-center">-----'
																							+ monthNames[month]
																							+ " "
																							+ date
																							+ ", "
																							+ year
																							+ '-----</div>');

																	$(
																			'#currentDateHolder')
																			.text(
																					date);
																}

																if (data.newChatList[i].writer == writer) {
																	$(
																			'#chatBox')
																			.append(
																					'<div class="d-flex justify-content-end my-2"><div class="d-flex align-items-end mr-1 unselectable"><div>'
																							+ hours
																							+ ':'
																							+ minutes
																							+ " "
																							+ ampm
																							+ '</div></div><div class="chatBalloon myChat px-2"><c:set var="currentChatId" value="${chat.id}"></c:set><div>'
																							+ data.newChatList[i].content
																							+ '</div></div></div>');

																} else if (data.newChatList[i].writer != writer) {
																	$(
																			'#chatBox')
																			.append(
																					'<div class="d-flex my-2"><div class="mr-2 unselectable"><img alt="" src="'+data.newChatList[i].profileUrl+'" class="profileImgBox" height="30px" width="30px"></div><div><div><b class="unselectable">'
																							+ data.newChatList[i].firstName
																							+ ' '
																							+ data.newChatList[i].lastName
																							+ '</b></div><div class="d-flex"><div class="chatBalloon px-2"><c:set var="currentChatId" value="${chat.id}"></c:set><div>'
																							+ data.newChatList[i].content
																							+ '</div></div><div class="d-flex align-items-end ml-1 unselectable">'
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
															pause = false;
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
									}
								}, 1);

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