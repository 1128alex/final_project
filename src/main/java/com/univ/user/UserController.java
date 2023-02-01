package com.univ.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/univ/user")
@Controller
public class UserController {

	@GetMapping("/sign_in")
	public String signInView(Model model) {
		model.addAttribute("view", "user/signIn");
		return "template/loginLayout";
	}

	@GetMapping("/sign_up")
	public String signUpView(Model model) {
		model.addAttribute("view", "user/signUp");
		return "template/loginLayout";
	}

}
