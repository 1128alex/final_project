package com.univ.course;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.assignment.bo.AssignmentBO;
import com.univ.assignment.model.Assignment;
import com.univ.board.bo.BoardBO;
import com.univ.board.model.PostUserCombined;
import com.univ.course.bo.CourseBO;
import com.univ.course.model.Class;
import com.univ.course.model.ClassCourseCombined;
import com.univ.course.model.Course;
import com.univ.registry.bo.RegistryBO;
import com.univ.registry.model.Registry;
import com.univ.user.model.User;

@RequestMapping("/univ/course")
@Controller
public class CourseController {
	@Autowired
	private CourseBO courseBO;
	@Autowired
	private AssignmentBO assignmentBO;
	@Autowired
	private RegistryBO registryBO;
	@Autowired
	private BoardBO boardBO;

	@GetMapping("/create_class")
	public String createClassView(Model model, HttpSession session) {

		// timetable information
		User user = (User) session.getAttribute("user");
		String type = user.getType();
		model.addAttribute("type", type);

		List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
		model.addAttribute("combinedList", combinedList);

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		model.addAttribute("view", "course/createClass");

		return "template/layout";
	}

	@GetMapping("/class_list")
	public String classListView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		String type = user.getType();

		if (type.equals("student")) {
			List<ClassCourseCombined> combinedList = courseBO.getClassCourseListByStudentNum(user.getStudentNum());
			model.addAttribute("combinedList", combinedList);
		} else if (type.equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

		List<Assignment> assignmentList = assignmentBO.getAsgmtListByEmailByDueDate(type);
		model.addAttribute("assignmentList", assignmentList);
		model.addAttribute("type", type);
		model.addAttribute("view", "course/classList");

		return "template/layout";
	}

	@GetMapping("/class_detail")
	public String classDetailView(@RequestParam("classId") int classId, Model model, HttpSession session) {

		ClassCourseCombined currentClass = courseBO.getClassCourseByClassIdForDetail(classId);
		List<Assignment> assignmentList = assignmentBO.getAsgmtListByClassId(classId);

		User user = (User) session.getAttribute("user");

		List<PostUserCombined> postList = boardBO.getPostListByClassId(classId);

		model.addAttribute("postList", postList);

		model.addAttribute("profEmail", user.getEmail());
		model.addAttribute("userType", user.getType());

		model.addAttribute("currentClass", currentClass);
		model.addAttribute("assignmentList", assignmentList);
		model.addAttribute("view", "course/classDetail");

		return "template/layout";
	}

	@GetMapping("/edit_class")
	public String editClassView(@RequestParam("classId") int classId, Model model, HttpSession session) {

		// timetable information
		User user = (User) session.getAttribute("user");
		String type = user.getType();
		model.addAttribute("type", type);

		List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
		model.addAttribute("combinedList", combinedList);
		model.addAttribute("classId", classId);

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
			@RequestParam(value = "courseLevel", required = false) String courseLevel,
			@RequestParam(value = "pageNum", required = false) Integer pageNum, Model model) {

		List<Course> courseList = courseBO.getCourseList();
		model.addAttribute("courseList", courseList);
		model.addAttribute("length", courseList.size());

		if (searchKeyword == null) {
			searchKeyword = "";
		}

		if (pageNum == null) {
			pageNum = 1;
		}

		List<ClassCourseCombined> combinedList = courseBO.getFilteredCourseList(searchKeyword, courseName, subjectCode,
				courseLevel, pageNum);

		int pageLength = (int) Math
				.ceil(courseBO.countFilteredCourseList(searchKeyword, courseName, subjectCode, courseLevel) / 5.0);
		model.addAttribute("pageLength", pageLength);
		model.addAttribute("pageNum", pageNum);

		if (courseName != null) {
			model.addAttribute("courseName", courseName);
		}
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("combinedList", combinedList);
		model.addAttribute("view", "course/registerClass");

		return "template/layout";
	}

	@GetMapping("/register_class_detail")
	public String registerClassDetailView(@RequestParam("classId") int classId, Model model) {

		ClassCourseCombined combined = courseBO.getClassCourseByClassIdForDetail(classId);

		model.addAttribute("combined", combined);
		model.addAttribute("classId", classId);
		model.addAttribute("view", "course/registerClassDetail");

		return "template/layout";
	}

	@GetMapping("/grade_class_list")
	public String gradeClassListView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		List<ClassCourseCombined> combinedList = new ArrayList<>();

		List<Registry> registryList = registryBO.getRegistryListByStudentNum(user.getStudentNum());
		for (Registry registry : registryList) {
			ClassCourseCombined combined = courseBO.getClassCourseByClassId(registry.getClassId(),
					user.getStudentNum());
			if (combined != null) {
				combinedList.add(combined);
			}
		}
		model.addAttribute("combinedList", combinedList);
		model.addAttribute("view", "course/gradeClassList");

		return "template/layout";
	}

	@GetMapping("/timetable")
	public String timetableView(Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		String type = user.getType();
		model.addAttribute("type", type);

		if (type.equals("student")) {
			List<ClassCourseCombined> combinedList = new ArrayList<>();
			List<Registry> registryList = registryBO.getRegistryListByStudentNum(user.getStudentNum());
			for (Registry registry : registryList) {
				ClassCourseCombined combined = courseBO.getClassCourseByClassId(registry.getClassId(),
						user.getStudentNum());
				combinedList.add(combined);
			}
			model.addAttribute("combinedList", combinedList);
		} else if (type.equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

		model.addAttribute("view", "course/timetable");

		return "template/layout";
	}
}