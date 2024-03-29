package com.univ.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.chat.bo.ChatBO;
import com.univ.chat.model.ChatRoom;
import com.univ.chat.model.ChatUserCombined;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

@RequestMapping("/univ/chat")
@Controller
public class ChatController {
	@Autowired
	private ChatBO chatBO;
	@Autowired
	private UserBO userBO;

	@GetMapping("/room")
	public String roomView(@RequestParam(value = "roomId", required = false) Integer roomId, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		String loggedEmail = user.getEmail();
		model.addAttribute("loggedEmail", loggedEmail);

		List<ChatRoom> roomList = chatBO.getChatRoomListByEmail(loggedEmail);
		model.addAttribute("roomList", roomList);

		if (roomId != null) {

			ChatRoom currentRoom = chatBO.getChatRoomByRoomId(roomId);
			model.addAttribute("currentRoom", currentRoom);

			List<User> memberList = userBO.getChatMemberList(currentRoom.getMembers());
			model.addAttribute("memberList", memberList);

			List<ChatUserCombined> chatList = chatBO.getMessageList(roomId);
			model.addAttribute("chatList", chatList);

		}

		model.addAttribute("view", "chat/chat");

		return "template/layout";
	}

	@GetMapping("/create_chat")
	public String createChatView(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "search", required = false) String search, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String loggedEmail = user.getEmail();

		if (type != null) {
			List<User> userList = userBO.getUserListByTypeName(type, search, loggedEmail);

			model.addAttribute("type", type);
			model.addAttribute("userList", userList);
		}

		model.addAttribute("search", search);
		model.addAttribute("view", "chat/newChat");

		return "template/layout";
	}
}
