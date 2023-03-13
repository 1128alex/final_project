package com.univ.user.dao;

import java.util.List;

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

	public User selectUserByEmail(String email);

	public User selectVerifyQuestion(String email);

	public int verifyQuestion(@Param("email") String email, @Param("question") String question,
			@Param("answer") String answer);

	public int resetPassword(@Param("email") String email, @Param("password") String password);

	public List<User> selectUserListByTypeName(@Param("type") String type, @Param("search") String search,
			@Param("loggedEmail") String loggedEmail);

	public int updateUser(@Param("prevEmail") String prevEmail, @Param("user") User user);
}
