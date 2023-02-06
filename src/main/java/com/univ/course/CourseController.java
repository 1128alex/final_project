package com.univ.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.univ.course.bo.CourseBO;
import com.univ.course.model.Course;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ/course")
@Controller
public class CourseController {
	@Autowired
	private CourseBO courseBO;

	@GetMapping("/create_course")
	public String showCreateClassView(Model model, HttpSession session) {

		model.addAttribute("view", "course/createCourse");

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		return "template/layout";
	}

}