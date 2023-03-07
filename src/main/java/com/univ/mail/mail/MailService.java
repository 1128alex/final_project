package com.univ.mail.mail;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.univ.mail.model.MailTo;
import com.univ.user.model.User;

@Component
public class MailService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(MailTo mail, HttpSession session) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail.getAddress());

		User user = (User) session.getAttribute("user");
		message.setFrom(user.getEmail());

		message.setSubject(mail.getTitle());
		message.setText(mail.getMessage());

		mailSender.send(message);
	}
}
