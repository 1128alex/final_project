package com.univ.user;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

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
		int year = LocalDate.now().getYear();

		model.addAttribute("year", year);
		model.addAttribute("view", "user/signUp");

		return "template/loginLayout";
	}

	@GetMapping("/log_out")
	public String logOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("user");

		return "redirect:/univ/user/sign_in";
	}

	@GetMapping("/find_password")
	public String findPasswordView(Model model) {
		model.addAttribute("view", "user/userVerification");

		return "template/loginLayout";
	}

	@GetMapping("/reset_password")
	public String resetPasswordView(@RequestParam("email") String email, Model model) {
		model.addAttribute("email", email);
		model.addAttribute("view", "user/resetPassword");

		return "template/loginLayout";
	}
}
