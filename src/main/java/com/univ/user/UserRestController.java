package com.univ.user;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.common.EncryptUtils;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@Autowired
	private UserBO userBO;

	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {

		String hashedPassword = EncryptUtils.md5(password);

		Map<String, Object> result = new HashMap<>();
		return result;
	}

	@PostMapping("/sign_up_student")
	public Map<String, Object> signUp(@ModelAttribute User user, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonth, @RequestParam("birthDay") int birthDay) {

		user.setType("student");

		// Creating Student Number
		// Current Year
		Integer studentNumYear = Integer.parseInt(LocalDate.now().toString().substring(2, 4));

		// Faculty Number(Random number)
		int facultyNum = 1;

		// Checking
		Integer maxStudentNum = userBO.getMaxStudentNum();

		if (maxStudentNum == null) {
			maxStudentNum = (studentNumYear * 1000000) + (facultyNum * 10000) + 1;
		} else {
			maxStudentNum = maxStudentNum + 1;
		}

		// Combining Birth Information
		String monthString = "";
		switch (birthMonth) {
		case 1:
			monthString = "January";
			break;
		case 2:
			monthString = "February";
			break;
		case 3:
			monthString = "March";
			break;
		case 4:
			monthString = "April";
			break;
		case 5:
			monthString = "May";
			break;
		case 6:
			monthString = "June";
			break;
		case 7:
			monthString = "July";
			break;
		case 8:
			monthString = "August";
			break;
		case 9:
			monthString = "September";
			break;
		case 10:
			monthString = "October";
			break;
		case 11:
			monthString = "November";
			break;
		case 12:
			monthString = "December";
			break;
		default:
			monthString = "Invalid month";
			break;
		}

		String birth = birthDay + " / " + monthString + " / " + birthYear;

		String hashedPassword = EncryptUtils.md5(user.getPassword());

		user.setStudentNum(maxStudentNum);
		user.setUserName(firstName + " " + lastName);
		user.setBirth(birth);
		user.setPassword(hashedPassword);

		int rowCount = userBO.addUser(user);

		Map<String, Object> result = new HashMap<>();

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errormessage", "failed to sign up");
		}

		return result;
	}

}
