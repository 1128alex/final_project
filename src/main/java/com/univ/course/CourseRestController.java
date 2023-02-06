package com.univ.course;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.univ.course.bo.CourseBO;

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
}
