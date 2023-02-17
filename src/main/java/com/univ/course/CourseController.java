package com.univ.course;

import java.util.ArrayList;
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
import com.univ.course.model.ClassInfoCombined;
import com.univ.course.model.Course;
import com.univ.user.bo.UserBO;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/univ/course")
@Controller
public class CourseController {
	@Autowired
	private UserBO userBO;
	@Autowired
	private CourseBO courseBO;
	@Autowired
	private AssignmentBO assignmentBO;

	@GetMapping("/create_class")
	public String createClassView(Model model) {

		model.addAttribute("view", "course/createClass");

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		return "template/layout";
	}

	@GetMapping("/class_list")
	public String classListView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		String userType = user.getType();

		List<Class> classList = courseBO.getClassListByEmail(user.getEmail());
		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("userType", userType);
		model.addAttribute("view", "course/classList");
		model.addAttribute("classes", classList);
		model.addAttribute("courses", courseList);

		return "template/layout";
	}

	@GetMapping("/class_detail")
	public String classDetailView(@RequestParam("classId") int classId, Model model, HttpSession session) {

		Class currentClass = courseBO.getClassById(classId);
		Course currentCourse = courseBO.getCourseByCourseCode(currentClass.getCourseCode());
		List<Assignment> assignment = assignmentBO.getAsgmtListByClassId(classId);

		User user = (User) session.getAttribute("user");
		String profEmail = user.getEmail();

		model.addAttribute("profEmail", profEmail);

		model.addAttribute("currentClass", currentClass);
		model.addAttribute("currentCourse", currentCourse);
		model.addAttribute("assignments", assignment);
		model.addAttribute("view", "course/classDetail");

		return "template/layout";
	}

	@GetMapping("/edit_class")
	public String editClassView(@RequestParam("classId") int classId, Model model, HttpSession session) {

		Class classInfo = courseBO.getClassById(classId);

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		for (Course course : courseList) {
			if (course.getCourseCode().equals(classInfo.getCourseCode())) {
				model.addAttribute("courseName", course.getCourseCode() + " - " + course.getCourseName());
			}
		}

		model.addAttribute("classInfo", classInfo);
		model.addAttribute("view", "course/editClass");

		return "template/layout";
	}

	@GetMapping("/register_class")
	public String editClassView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "courseName", required = false) String courseName,
			@RequestParam(value = "subjectCode", required = false) String subjectCode,
			@RequestParam(value = "courseLevel", required = false) String courseLevel, Model model,
			HttpSession session) {

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		if (searchKeyword == null) {
			searchKeyword = "";
		}

		List<ClassInfoCombined> combinedList = new ArrayList<>();

		List<Course> filteredCourseList = courseBO.getFilteredCourseList(searchKeyword, courseName, subjectCode,
				courseLevel);

		for (Course course : filteredCourseList) {
			List<Class> classList = courseBO.getClassListByCourseCode(course.getCourseCode());
			for (Class _class : classList) {
				User user = userBO.getUserByEmail(_class.getProfEmail());

				ClassInfoCombined combined = new ClassInfoCombined();
				combined.setUser(user);
				combined.set_class(_class);
				combined.setCourse(course);
				combinedList.add(combined);
			}
		}

		model.addAttribute("courseName", courseName);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("combinedList", combinedList);
		model.addAttribute("view", "course/registerClass");

		return "template/layout";
	}

	@GetMapping("/register_class_detail")
	public String registerClassDetailView(@RequestParam("classId") int classId, Model model) {

		model.addAttribute("view", "course/registerClassDetail");
		model.addAttribute("classId", classId);

		return "template/layout";
	}
}