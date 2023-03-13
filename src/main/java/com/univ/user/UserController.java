package com.univ.user;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.user.model.User;

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
	public String resetPasswordView(@RequestParam("email") String email, Model model,
			@RequestParam(value = "signedIn", required = false) Integer signedIn) {
		model.addAttribute("email", email);
		if (signedIn != null) {
			model.addAttribute("signedIn", signedIn);
		} else {
			model.addAttribute("signedIn", 0);
		}
		model.addAttribute("view", "user/resetPassword");

		return "template/loginLayout";
	}

	@GetMapping("/profile")
	public String profileView(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/univ/user/sign_in";
		}

		model.addAttribute("user", user);
		model.addAttribute("view", "user/profile");

		return "template/layout";
	}

	@GetMapping("/edit_profile")
	public String editProfileView(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/univ/user/sign_in";
		}

		int birthYear = user.getBirth().getYear();
		int birthMonth = user.getBirth().getMonth();
		int birthDate = user.getBirth().getDate();
		model.addAttribute("birthYear", birthYear + 1900);

		if (birthMonth == 3 || birthMonth == 5 || birthMonth == 8 || birthMonth == 10) {
			model.addAttribute("birthMonth", (birthMonth + 1) + "30");
		} else if (birthMonth == 1) {
			model.addAttribute("birthMonth", (birthMonth + 1) + "28");
		} else {
			model.addAttribute("birthMonth", (birthMonth + 1) + "31");
		}

		model.addAttribute("birthDate", birthDate);

		int year = LocalDate.now().getYear();
		model.addAttribute("year", year);

		model.addAttribute("user", user);
		model.addAttribute("view", "user/editProfile");

		return "template/layout";
	}
}
