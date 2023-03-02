package com.univ.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.chat.bo.ChatBO;
import com.univ.chat.model.Chat;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ/chat")
@Controller
public class ChatController {
	@Autowired
	private ChatBO chatBO;

	@GetMapping("/room")
	public String roomView(@RequestParam("roomId") int roomId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String loggedEmail = user.getEmail();

		List<Chat> chatList = chatBO.getMessageList(roomId);

		model.addAttribute("loggedEmail", loggedEmail);
		model.addAttribute("chatList", chatList);
		model.addAttribute("view", "chat/chat");

		return "template/layout";
	}
}
