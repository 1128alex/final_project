package com.univ.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.user.dao.UserDAO;
import com.univ.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	public User getUserByIdPassword(String studentNum, String email, String password) {
		return userDAO.selectUserByIdPassword(studentNum, email, password);
	}

	public int checkDuplicate(String email) {
		return userDAO.checkDuplicate(email);
	}

	public int addUser(User user) {
		return userDAO.insertUser(user);
	}

	public String getStudentNum(Integer year, String faculty) {
		return userDAO.selectStudentNum(year, faculty);
	}
}