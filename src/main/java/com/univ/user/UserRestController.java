package com.univ.user;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.common.EncryptUtils;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;

	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("userId") String userId, @RequestParam("password") String password,
			HttpServletRequest request) {

		Map<String, Object> result = new HashMap<>();

		String email = null;
		if (userId.contains("@") && userId.contains(".")) {
			email = userId;
			userId = null;
		}

		String hashedPassword = EncryptUtils.md5(password);

		// get user information from database
		User user = userBO.getUserByIdPassword(userId, email, hashedPassword);

		if (user != null) {
			String type = user.getType();
			result.put("code", 1);
			result.put("type", type);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("userId", user.getUserId());
		} else if (user == null) {
			result.put("code", 500);
			result.put("errorMessage", "Wrong ID or password. Please check again.");
		}

		return result;
	}

	@GetMapping("/duplicate_check")
	public Map<String, Object> idDuplicateCheck(@RequestParam("userId") String userId) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = userBO.checkDuplicate(userId);

		if (rowCount >= 1) {
			result.put("code", 1);
		} else if (rowCount == 0) {
			result.put("code", 0);
		} else {
			result.put("code", 500);
		}

		return result;
	}

	@PostMapping("/sign_up_student")
	public Map<String, Object> signUpStud(@ModelAttribute User user, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			HttpServletRequest request) {

		// Creating Student Number
		// Current Year
		Integer studentNumYear = Integer.parseInt(LocalDate.now().toString().substring(2, 4));

		// Faculty Number(Random number)
		int facultyNum = 1;

		// Checking the last Student Number
		Integer maxStudentNum = userBO.getMaxStudentNum();

		// Making a Student number
		if (maxStudentNum == null) {
			maxStudentNum = (studentNumYear * 1000000) + (facultyNum * 10000) + 1;
		} else {
			maxStudentNum = maxStudentNum + 1;
		}

		// Combining Birth Information
		int birthMonth = birthMonthInfo / 100;
		String monthString = changeMonthName(birthMonth);
		String birth = birthDay + " / " + monthString + " / " + birthYear;

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		// Set the model values
		user.setType("student");
		user.setStudentNum(maxStudentNum);
		user.setUserName(firstName + " " + lastName);
		user.setBirth(birth);
		user.setPassword(hashedPassword);

		// Add the information to Database
		int rowCount = userBO.addUser(user);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("userId", user.getUserId());
		} else {
			result.put("code", 500);
			result.put("errormessage", "failed to sign up");
		}

		return result;
	}

	@PostMapping("/sign_up_professor")
	public Map<String, Object> signUpProf(@ModelAttribute User user, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			HttpServletRequest request) {

		// Combining Birth Information
		int birthMonth = birthMonthInfo / 100;
		String monthString = changeMonthName(birthMonth);
		String birth = birthDay + " / " + monthString + " / " + birthYear;

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		// Set the model values
		user.setType("professor");
		user.setUserName(firstName + " " + lastName);
		user.setBirth(birth);
		user.setPassword(hashedPassword);

		// Add the information to Database
		int rowCount = userBO.addUser(user);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("userId", user.getUserId());
		} else {
			result.put("code", 500);
			result.put("errormessage", "failed to sign up");
		}

		return result;
	}

	public String changeMonthName(int birthMonth) {
		switch (birthMonth) {
		case 1:
			return "January";
		case 2:
			return "February";
		case 3:
			return "March";
		case 4:
			return "April";
		case 5:
			return "May";
		case 6:
			return "June";
		case 7:
			return "July";
		case 8:
			return "August";
		case 9:
			return "September";
		case 10:
			return "October";
		case 11:
			return "November";
		case 12:
			return "December";
		default:
			return "Invalid month";
		}
	}

}