<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="d-flex">
	<div class="col-3"></div>
	<div class="col-6">
		<h3>Writer</h3>
		<div id="emailHolder" data-email="${loggedEmail}">${loggedEmail}</div>
		<hr>
		<div id="chatBox">
			<c:forEach var="chat" items="${chatList}">
				<c:choose>
					<c:when test="${chat.writer eq loggedEmail}">
						<div class="d-flex justify-content-end">
							<div>
								<c:set var="currentChatId" value="${chat.id}"></c:set>
								<div>
									<b>${chat.writer}</b>
								</div>
								<div>${chat.content}</div>
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
			<input type="text" id="content" class="form-control">
			<button type="button" id="sendBtn" class="btn button">Send</button>
		</div>
	</div>
	<div class="col-3"></div>
	<div id="chatDataHolder" data-current-id="${currentChatId}"></div>
</div>


<script>
	$(document)
			.ready(
					function() {
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
					});
</script>