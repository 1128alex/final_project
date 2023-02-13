package com.univ.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.assignment.bo.AssignmentBO;
import com.univ.assignment.model.Assignment;
import com.univ.course.bo.CourseBO;
import com.univ.course.model.Class;
import com.univ.course.model.Course;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ/course")
@Controller
public class CourseController {
	@Autowired
	private CourseBO courseBO;
	@Autowired
	private AssignmentBO assignmentBO;

	@GetMapping("/create_class")
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
			List<Class> classList = courseBO.getClassList(user.getEmail());
			List<Course> courseList = courseBO.getCourseList();
			model.addAttribute("view", "course/profClassList");
			model.addAttribute("classes", classList);
			model.addAttribute("courses", courseList);
		}

		return "template/layout";
	}

	@GetMapping("/class_detail")
	public String showClassDetailView(@RequestParam("classId") int classId, Model model) {

		Class currentClass = courseBO.getClassById(classId);
		Course currentCourse = courseBO.getCourseByCourseCode(currentClass.getCourseCode());
		List<Assignment> assignment = assignmentBO.getAsgmtListByClassId(classId);

		model.addAttribute("currentClass", currentClass);
		model.addAttribute("currentCourse", currentCourse);
		model.addAttribute("assignments", assignment);
		model.addAttribute("view", "course/classDetail");

		return "template/layout";
	}

}