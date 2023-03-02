package com.univ.mail;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/univ/mail")
@Controller
public class MailController {

	@GetMapping("/email_inbox")
	public String emailInboxView(Model model) {
		model.addAttribute("view", "mail/mailInbox");

		return "template/layout";
	}

	@GetMapping("/send_email")
	public String sendEmailView(Model model) {
		model.addAttribute("view", "mail/sendEmail");

		return "template/layout";
	}
}
