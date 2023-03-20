package com.univ.registry;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.registry.bo.RegistryBO;
import com.univ.user.model.User;

@RequestMapping("/registry")
@RestController
public class RegistryRestController {
	@Autowired
	private RegistryBO registryBO;

	@GetMapping("/register_class")
	public Map<String, Object> registerClass(@RequestParam("classId") int classId, @RequestParam("monTime") int monTime,
			@RequestParam("tueTime") int tueTime, @RequestParam("wedTime") int wedTime,
			@RequestParam("thuTime") int thuTime, @RequestParam("friTime") int friTime, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		User user = (User) session.getAttribute("user");

		int dupCheck = registryBO.dupCheck(classId, user.getEmail());
		if (dupCheck != 0) {
			result.put("code", 2);
			result.put("errorMessage", "You are already registered in this class.");

			return result;
		}

		int timeRowCount = registryBO.checkTime(user.getEmail(), monTime, tueTime, wedTime, thuTime, friTime);
		if (timeRowCount != 0) {
			result.put("code", 3);
			result.put("errorMessage",
					"You already have a class in this time. Please choose a class with another time.");
			return result;
		}

		int rowCount = registryBO.registerToClass(classId, user.getEmail());

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "error while registering class");
		}

		return result;
	}
}
