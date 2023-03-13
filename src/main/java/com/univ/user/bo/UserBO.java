package com.univ.user.bo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.univ.common.EncryptUtils;
import com.univ.common.FileManagerService;
import com.univ.user.dao.UserDAO;
import com.univ.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private FileManagerService fileManagerService;

	public User getUserByIdPassword(String userId, String password) {
		String email = null;
		if (userId.contains("@") && userId.contains(".")) {
			email = userId;
			userId = null;
		}

		String hashedPassword = EncryptUtils.md5(password);

		return userDAO.selectUserByIdPassword(userId, email, hashedPassword);
	}

	public int addUser(User user, int birthYear, int birthMonthInfo, int birthDay, MultipartFile profileFile)
			throws ParseException {

		if (user.getType().equals("student")) {
			// Creating Student Number
			// Current Year
			Integer currentYear = Integer.parseInt(LocalDate.now().toString().substring(2, 4));

			// Faculty Number(Random number)
			String facultyNum = "01";

			// Making a studentNumber
			String studentNum = userDAO.selectStudentNum(currentYear, facultyNum);
			user.setStudentNum(studentNum);
		}
		// Combining Birth Information
		Date birth = toDate(birthDay, birthMonthInfo, birthYear);

		// Hash password
		String hashedPassword = EncryptUtils.md5(user.getPassword());

		String profileUrl = "/images/no_profile/noprofile.png";
		if (profileFile != null) {
			profileUrl = fileManagerService.saveFile(user.getEmail(), profileFile);
		}

		// Set the model values
		user.setBirth(birth);
		user.setPassword(hashedPassword);
		user.setProfileUrl(profileUrl);

		// Add the information to Database
		return userDAO.insertUser(user);
	}

	public String getStudentNum(Integer year, String faculty) {
		return userDAO.selectStudentNum(year, faculty);
	}

	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}

	public static Date toDate(int birthDay, int birthMonth, int birthYear) throws ParseException {
		String birthStr = birthDay + "/" + birthMonth + "/" + birthYear;

		SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
		return sdf.parse(birthStr);
	}

	public User getVerifyQuestion(String email) {
		return userDAO.selectVerifyQuestion(email);
	}

	public int verifyQuestion(String email, String question, String answer) {
		return userDAO.verifyQuestion(email, question, answer);
	}

	public int resetPassword(String email, String password) {
		String hashedPassword = EncryptUtils.md5(password);

		return userDAO.resetPassword(email, hashedPassword);
	}

	public List<User> getUserListByTypeName(String type, String search, String loggedEmail) {
		return userDAO.selectUserListByTypeName(type, search, loggedEmail);
	}

	public int updateUser(String prevEmail, User user, int birthYear, int birthMonthInfo, int birthDay,
			MultipartFile profileFile) throws ParseException {

		// Combining Birth Information
		Date birth = toDate(birthDay, birthMonthInfo, birthYear);

		String profileUrl = "/images/no_profile/noprofile.png";
		if (profileFile != null) {
			profileUrl = fileManagerService.saveFile(user.getEmail(), profileFile);
		}

		// Set the model values
		user.setBirth(birth);
		user.setProfileUrl(profileUrl);

		// Add the information to Database
		return userDAO.updateUser(prevEmail, user);

	}

	public int checkDuplicate(String email) {
		return userDAO.checkDuplicate(email);
	}
}