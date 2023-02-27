package com.univ.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.mail.mail.MailService;
import com.univ.mail.model.MailTo;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/mail")
public class MailRestController {

	@Autowired
	private MailService mailService;

	@GetMapping("/send_email")
	public MailTo sendMail(@RequestParam("to") String email, @RequestParam("title") String title,
			@RequestParam("message") String message, HttpSession session) {
		MailTo mail = new MailTo();

		mail.setAddress(email);
		mail.setTitle(title);
		mail.setMessage(message);

		mailService.sendMail(mail, session);

		return mail;
	}
}