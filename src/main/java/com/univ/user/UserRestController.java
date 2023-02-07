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
import org.springframework.web.multipart.MultipartFile;

import com.univ.common.EncryptUtils;
import com.univ.common.FileManagerService;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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

		String email = null;
		if (userId.contains("@") && userId.contains(".")) {
			email = userId;
			userId = null;
		}

		String hashedPassword = EncryptUtils.md5(password);

		Map<String, Object> result = new HashMap<>();

		// get user information from database
		User user = userBO.getUserByIdPassword(userId, email, hashedPassword);

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

	@GetMapping("/duplicate_check")
	public Map<String, Object> idDuplicateCheck(@RequestParam("email") String email) {
		Map<String, Object> result = new HashMap<>();

		return result;
	}

	@PostMapping("/sign_up")
	public Map<String, Object> signUp(@ModelAttribute User user, @RequestParam("birthYear") int birthYear,
			@RequestParam("birthMonth") int birthMonthInfo, @RequestParam("birthDay") int birthDay,
			@RequestParam(value = "profileFile", required = false) MultipartFile profileFile,
			HttpServletRequest request) throws ParseException {

		Map<String, Object> result = new HashMap<>();

		if (user.getType().equals("student")) {
			// Creating Student Number
			// Current Year
			Integer studentNumYear = Integer.parseInt(LocalDate.now().toString().substring(2, 4));

			// Faculty Number(Random number)
			String facultyNum = "01";

			// Making a studentNumber
			String studentNum = userBO.getStudentNum(studentNumYear, facultyNum);
			user.setStudentNum(studentNum);
		}

		// Combining Birth Information
		Date birth = toDate(birthDay, birthMonthInfo, birthYear);

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		String profileUrl = null;
		if (profileFile != null) {
			profileUrl = fileManagerService.saveFile(user.getEmail(), profileFile);
		}

		int emailRowCount = userBO.checkDuplicate(user.getEmail());

		if (emailRowCount >= 1) {
			result.put("code", 2);
			return result;
		}

		// Set the model values
		user.setBirth(birth);
		user.setPassword(hashedPassword);
		user.setProfileUrl(profileUrl);

		// Add the information to Database
		int rowCount = userBO.addUser(user);

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

	public Date toDate(int birthDay, int birthMonth, int birthYear) throws ParseException {
		String birthStr = birthDay + "/" + birthMonth + "/" + birthYear;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		return sdf.parse(birthStr);
	}
}