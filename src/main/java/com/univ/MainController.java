package com.univ;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ")
@Controller
public class MainController {
	@GetMapping()
	public String showMain(Model model, HttpSession session) {
		model.addAttribute("view", "main/main");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/univ/user/sign_in";
		}

		model.addAttribute("user", user);

		return "template/layout";
	}

	@GetMapping("/citations")
	public String showCitations(Model model) {
		model.addAttribute("view", "main/citation");
		return "template/layout";
	}
}
