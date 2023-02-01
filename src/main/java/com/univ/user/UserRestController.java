package com.univ.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.common.EncryptUtils;

@RequestMapping("/user")
@RestController
public class UserRestController {
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {

		String hashedPassword = EncryptUtils.md5(password);

		Map<String, Object> result = new HashMap<>();
		return result;
	}
}
