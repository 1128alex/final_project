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
	public Map<String, Object> registerClass(@RequestParam("classId") int classId, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		User user = (User) session.getAttribute("user");

		int rowCount = registryBO.registerToClass(classId, user.getEmail());

		if (rowCount == 2) {
			result.put("code", 2);
			result.put("errorMessage", "This class is registered already.");
		} else if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "error while registering class");
		}

		return result;
	}
}
