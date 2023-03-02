package com.univ.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.chat.bo.ChatBO;
import com.univ.chat.model.Chat;

@RequestMapping("/chat")
@RestController
public class ChatRestController {
	@Autowired
	private ChatBO chatBO;

	@GetMapping("add_message")
	public Map<String, Object> addMessage(@RequestParam("roomId") int roomId, @RequestParam("writer") String writer,
			@RequestParam("content") String content) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = chatBO.addMessage(roomId, writer, content);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while adding message.");
		}

		return result;
	}

	@GetMapping("get_new_message")
	public Map<String, Object> getNewMessage(@RequestParam("roomId") int roomId,
			@RequestParam("currentId") int currentId) {
		Map<String, Object> result = new HashMap<>();

		List<Chat> chatList = chatBO.getNewMessage(roomId, currentId);

		result.put("code", 1);
		result.put("newChatList", chatList);

		return result;
	}
}
