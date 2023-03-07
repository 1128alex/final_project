package com.univ;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.univ.user.model.User;

@RequestMapping("/univ")
@Controller
public class MainController {

	@GetMapping()
	public String showMainView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");

//		if (user == null) {
//			return "redirect:/univ/user/sign_in";
//		}

		if (user.getType().equals("student")) {
			model.addAttribute("view", "main/main");
		} else if (user.getType().equals("professor")) {
			model.addAttribute("view", "main/profMain");
		}

		model.addAttribute("user", user);

		return "template/layout";
	}

	@GetMapping("/citations")
	public String showCitationsView(Model model) {
		model.addAttribute("view", "main/citation");
		return "template/layout";
	}

}
