package com.univ.chat.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.chat.dao.ChatDAO;
import com.univ.chat.model.Chat;
import com.univ.chat.model.ChatRoom;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class ChatBO {

	@Autowired
	private ChatDAO chatDAO;

	public int addMessage(int roomId, String writer, String content) {
		return chatDAO.insertMessage(roomId, writer, content);
	}

	public List<Chat> getMessageList(int roomId) {
		return chatDAO.selectMessageList(roomId);
	}

	public List<Chat> getNewMessage(int roomId, int currentId) {
		return chatDAO.selectNewMessage(roomId, currentId);
	}

	public ChatRoom getChatRoomByRoomId(int roomId) {
		return chatDAO.selectChatRoomByRoomId(roomId);
	}

	public List<ChatRoom> getChatRoomListByEmail(String loggedEmail) {
		return chatDAO.selectChatRoomListByEmail(loggedEmail);
	}

	public int createChatRoom(String members, String roomName, HttpSession session) {
		User user = (User) session.getAttribute("user");

		String memberString = user.getEmail() + "/" + members;

		if (roomName == "") {
			roomName = memberString.replace("/", ", ");
		}

		return chatDAO.insertChatRoom(memberString, roomName);
	}

	public int getRecentChatRoomId() {
		return chatDAO.selectRecentChatRoomId();
	}

}
