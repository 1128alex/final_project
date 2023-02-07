package com.univ.course;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.course.bo.CourseBO;
import com.univ.course.model.Class;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/course")
@RestController
public class CourseRestController {
	@Autowired
	private CourseBO courseBO;

	@GetMapping("/find_subject_classes")
	public Map<String, Object> findSubjectClasses(Model model) {
		Map<String, Object> result = new HashMap<>();

		return result;
	}

	@GetMapping("/filter_courses_by_subject")
	public Map<String, Object> filterCoursesBySubject(
			@RequestParam(value = "subjectCode", required = false) String subjectCode, Model model,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		result.put("code", 1);

		return result;
	}

	// https://gilmatnote.tistory.com/11
	@PutMapping("/create_class")
	public Map<String, Object> createClass(@ModelAttribute Class newClass,
			@RequestParam("registerDueDateString") String registerDueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		User user = (User) session.getAttribute("user");
		String profEmail = user.getEmail();
		newClass.setProfEmail(profEmail);

		Date registerDueDate = new SimpleDateFormat("yyyy/MM/dd").parse(registerDueDateString);
		newClass.setRegisterDueDate(registerDueDate);

		int dupCount = courseBO.checkDuplicatedClass(newClass.getCourseCode(), profEmail);

		if (dupCount == 1) {
			result.put("code", 2);
			result.put("errorMessage", "Your class with this ID already exists.");
			return result;
		}

		int rowCount = courseBO.addClass(newClass);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while creating new class.");
		}

		return result;
	}

}
