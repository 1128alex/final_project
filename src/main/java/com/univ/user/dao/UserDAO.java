package com.univ.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.user.model.User;

@Repository
public interface UserDAO {
	public User selectUserByIdPassword(@Param("userId") String userId, @Param("email") String email,
			@Param("password") String password);

	public int checkDuplicate(String userId);

	public int insertUser(User user);

	public Integer selectMaxStudentNum();
}
