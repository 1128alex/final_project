package com.univ.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.user.model.User;

@Repository
public interface UserDAO {
	public User selectUserByIdPassword(@Param("studentNum") String studentNum, @Param("email") String email,
			@Param("password") String password);

	public int checkDuplicate(String email);

	public int insertUser(User user);

	public String selectStudentNum(@Param("year") Integer year, @Param("faculty") String faculty);
}
