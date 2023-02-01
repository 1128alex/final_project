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
			@RequestParam("lastName") String lastName) {

		user.setType("student");

		String now = LocalDate.now().toString();
		Integer studentNumYear = Integer.parseInt(now.substring(2, 4));
		int facultyNum = 1;
		Integer maxStudentNum = userBO.getMaxStudentNum();

		if (maxStudentNum == null) {
			maxStudentNum = (studentNumYear * 1000000) + (facultyNum * 10000) + 1;
		} else {
			maxStudentNum = maxStudentNum + 1;
		}

		user.setStudentNum(maxStudentNum);
		user.setUserName(firstName + " " + lastName);

		String hashedPassword = EncryptUtils.md5(user.getPassword());
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
