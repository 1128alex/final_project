package com.univ.course;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.course.bo.CourseBO;

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
}
