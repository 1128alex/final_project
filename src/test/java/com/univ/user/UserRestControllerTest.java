package com.univ.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.univ.user.bo.UserBO;

@SpringBootTest
class UserRestControllerTest {

	@Autowired
	UserBO userBO;

	// src/main/클래스 > new > JUnit Test Case

	@Transactional // rollback
	@Test
	void 유저추가테스트() {
		// userBO.addUser("bbbb", "bbbb", "테스트", "test@test.com");
	}

}
