package com.univ.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
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
		} else if (user == null) {
			result.put("code", 500);
			result.put("errorMessage", "Wrong ID or password. Please check again.");
		}

		return result;
	}

	@GetMapping("/duplicate_check")
	public Map<String, Object> idDuplicateCheck(@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = userBO.checkDuplicate(email);

		if (rowCount == 0) {
			result.put("code", 0);
		} else if (rowCount >= 1) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
		}

		return result;
	}

	@PostMapping("/sign_up_student")
	public Map<String, Object> signUpStud(@ModelAttribute User user, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			HttpServletRequest request) throws ParseException {

		// Creating Student Number
		// Current Year
		Integer studentNumYear = Integer.parseInt(LocalDate.now().toString().substring(2, 4));

		// Faculty Number(Random number)
		String facultyNum = "01";

		// Making a studentNumber
		String studentNum = userBO.getStudentNum(studentNumYear, facultyNum);

		// Combining Birth Information
		int birthMonth = birthMonthInfo / 100;
		String birthStr = birthDay + "/" + birthMonth + "/" + birthYear;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date birth = sdf.parse(birthStr);

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		// Set the model values
		user.setType("student");
		user.setStudentNum(studentNum);
		user.setBirth(birth);
		user.setPassword(hashedPassword);

		// Add the information to Database
		int rowCount = userBO.addUser(user);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		} else {
			result.put("code", 500);
			result.put("errormessage", "failed to sign up");
		}

		return result;
	}

	@PostMapping("/sign_up_professor")
	public Map<String, Object> signUpProf(@ModelAttribute User user, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			HttpServletRequest request) throws ParseException {

		// Combining Birth Information
		int birthMonth = birthMonthInfo / 100;
		String birthStr = birthDay + "/" + birthMonth + "/" + birthYear;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date birth = sdf.parse(birthStr);

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		// Set the model values
		user.setType("professor");
		user.setBirth(birth);
		user.setPassword(hashedPassword);

		// Add the information to Database
		int rowCount = userBO.addUser(user);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		} else {
			result.put("code", 500);
			result.put("errormessage", "failed to sign up");
		}

		return result;
	}

}