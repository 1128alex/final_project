package com.univ.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.univ.course.bo.CourseBO;
import com.univ.course.model.Course;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ/course")
@Controller
public class CourseController {
	@Autowired
	private CourseBO courseBO;

	@GetMapping("/create_course")
	public String showCreateClassView(Model model) {

		model.addAttribute("view", "course/createClass");

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		return "template/layout";
	}

	@GetMapping("/class_list")
	public String showClassListView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		String userType = user.getType();
		if (userType.equals("student")) {
			model.addAttribute("view", "course/classList");
		} else if (userType.equals("professor")) {
			model.addAttribute("view", "course/profClassList");
		}

		return "template/layout";
	}

}