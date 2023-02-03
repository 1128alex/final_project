package com.univ.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.user.dao.UserDAO;
import com.univ.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;

	public User getUserByIdPassword(String userId, String email, String password) {
		return userDAO.selectUserByIdPassword(userId, email, password);
	}

	public int checkDuplicate(String userId) {
		return userDAO.checkDuplicate(userId);
	}

	public int addUser(User user) {
		return userDAO.insertUser(user);
	}

	public Integer getMaxStudentNum() {
		return userDAO.selectMaxStudentNum();
	}
}