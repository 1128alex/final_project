package com.univ;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.ObjectUtils;

@SpringBootTest
class UnivWebApplicationTests {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// key: alt + shift + x , t
	@Test
	void contextLoads() {
		logger.info("############# logger test");
	}

	@Test
	void addingTest() {
		logger.info("$$$$ add test start");
		int a = 10;
		int b = 20;

		assertEquals(30, a + b);

	}

	@Test
	void test() {
		String addUser = null;
		// assertNotNull(addUser);
		if (ObjectUtils.isEmpty(addUser)) {
			logger.info("비어있다");
		} else {
			logger.info("비어있지 않다.");
		}

		List<String> list = null;
		logger.info(ObjectUtils.isEmpty(list) + " ");
		;

	}
}
