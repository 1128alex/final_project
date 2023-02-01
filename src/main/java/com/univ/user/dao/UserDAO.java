package com.univ.user.dao;

import org.springframework.stereotype.Repository;

import com.univ.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(User user);

	public Integer selectMaxStudentNum();
}
