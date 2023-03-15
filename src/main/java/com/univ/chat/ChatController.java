package com.univ.chat;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

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
			Calendar now = Calendar.getInstance();
			String timeZone = now.getTimeZone().getID();
			model.addAttribute("timezone", timeZone);

			TimeZone tz = TimeZone.getTimeZone(timeZone);
			int offset = tz.getOffset(new Date().getTime()) / 1000 / 60 / 60;
			model.addAttribute("offset", offset);

			ChatRoom currentRoom = chatBO.getChatRoomByRoomId(roomId);
			List<User> memberList = userBO.getChatMemberList(currentRoom.getMembers());
			model.addAttribute("memberList", memberList);

			List<ChatUserCombined> chatList = chatBO.getMessageList(roomId, offset);
			model.addAttribute("currentRoom", currentRoom);
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
