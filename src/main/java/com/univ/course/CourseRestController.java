package com.univ.course;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.univ.course.bo.CourseBO;
import com.univ.course.model.Class;

@RequestMapping("/course")
@RestController
public class CourseRestController {
	@Autowired
	private CourseBO courseBO;

	// Professor
	@GetMapping("/create_class")
	public Map<String, Object> createClass(@ModelAttribute Class newClass,
			@RequestParam("registerDueDateString") String registerDueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		int rowCount = courseBO.addClass(newClass, registerDueDateString, session);

		if (rowCount == 2) {
			result.put("code", 2);
			result.put("errorMessage", "Your class with this ID already exists.");
		} else if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while creating new class.");
		}

		return result;
	}

	// Professor
	@PutMapping("/edit_class")
	public Map<String, Object> editClass(@ModelAttribute Class newClass, @RequestParam("classId") int classId,
			@RequestParam("prevCourseCode") String prevCourseCode,
			@RequestParam("registerDueDateString") String registerDueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		int rowCount = courseBO.editClass(newClass, classId, prevCourseCode, registerDueDateString, session);
		if (rowCount == 2) {
			result.put("code", 2);
			result.put("errorMessage", "Your class with this ID already exists.");
		} else if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while creating new class.");
		}

		return result;
	}

	@DeleteMapping("/delete_class")
	public Map<String, Object> deleteClass(@RequestParam("classId") int classId) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = courseBO.deleteClass(classId);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while deleting class.");
		}

		return result;
	}

}
