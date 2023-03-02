package com.univ.chat.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.chat.dao.ChatDAO;
import com.univ.chat.model.Chat;

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

}
