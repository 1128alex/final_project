package com.univ.user;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.univ.common.FileManagerService;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;

	@Autowired
	FileManagerService fileManagerService;

	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("userId") String userId, @RequestParam("password") String password,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		// get user information from database
		User user = userBO.getUserByIdPassword(userId, password);

		if (user != null) {
			String type = user.getType();
			result.put("code", 1);
			result.put("type", type);

			session.setAttribute("user", user);
		} else if (user == null) {
			result.put("code", 500);
			result.put("errorMessage", "Wrong ID or password. Please check again.");
		}

		return result;
	}

	@PostMapping("/sign_up")
	public Map<String, Object> signUp(@ModelAttribute User user, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			@RequestParam(value = "profileFile", required = false) MultipartFile profileFile,
			HttpServletRequest request) throws ParseException {
		Map<String, Object> result = new HashMap<>();

		int rowCount = userBO.addUser(user, birthYear, birthMonthInfo, birthDay, profileFile);
		if (rowCount == 2) {
			result.put("code", 2);
			result.put("errorMessage", "The account with this email exists already.");
		}
		if (rowCount > 0) {
			result.put("code", 1);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "failed to sign up");
		}

		return result;
	}

	@PostMapping("/get_verify_question")
	public Map<String, Object> getVerifyQuestion(@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();

		User user = userBO.getVerifyQuestion(email);

		if (user != null) {
			result.put("code", 1);
			result.put("question", user.getVerifyQuestion());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while getting verification question.");
		}
		return result;
	}

	@PostMapping("/verify_question")
	public Map<String, Object> verifyQuestion(@RequestParam("email") String email,
			@RequestParam("question") String question, @RequestParam("answer") String answer) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = userBO.verifyQuestion(email, question, answer);

		if (rowCount == 1) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while getting verification question.");
		}
		return result;
	}

	@PostMapping("/reset_password")
	public Map<String, Object> resetPassword(@RequestParam("email") String email,
			@RequestParam("password") String password) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = userBO.resetPassword(email, password);

		if (rowCount == 1) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while getting verification question.");
		}

		return result;
	}

}