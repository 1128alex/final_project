package com.univ.chat.bo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.chat.dao.ChatDAO;
import com.univ.chat.model.ChatRoom;
import com.univ.chat.model.ChatUserCombined;
import com.univ.user.model.User;

@Service
public class ChatBO {

	@Autowired
	private ChatDAO chatDAO;

	public int addMessage(int roomId, String writer, String content) {
		return chatDAO.insertMessage(roomId, writer, content);
	}

	public List<ChatUserCombined> getMessageList(int roomId) {
		return chatDAO.selectMessageList(roomId);
	}

	public List<ChatUserCombined> getNewMessage(int roomId, int currentId) {
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

		String memberString = "/" + user.getEmail() + "/" + members;

		if (roomName == "") {
			roomName = memberString.replace("/", ", ");
			roomName = roomName.substring(2, roomName.length() - 2);
		}

		return chatDAO.insertChatRoom(memberString, roomName);
	}

	public int getRecentChatRoomId() {
		return chatDAO.selectRecentChatRoomId();
	}

}
