package com.univ.assignment;

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
import com.univ.assignment.model.AssignmentUserCombined;
import com.univ.assignment.model.SubmittedAsgmt;
import com.univ.course.bo.CourseBO;
import com.univ.course.model.Class;
import com.univ.course.model.ClassCourseCombined;
import com.univ.course.model.Course;
import com.univ.user.model.User;

@RequestMapping("/univ/assignment")
@Controller
public class AssignmentController {
	@Autowired
	private CourseBO courseBO;
	@Autowired
	private AssignmentBO assignmentBO;

	@GetMapping("/assignment_list")
	public String assignmentListView(@RequestParam(value = "classId", required = false) Integer classId, Model model,
			HttpSession session) {
		model.addAttribute("view", "assignment/assignmentList");

		User user = (User) session.getAttribute("user");
		model.addAttribute("type", user.getType());

		if (user.getType().equals("student")) {
			List<ClassCourseCombined> combinedList = courseBO.getClassCourseListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		} else if (user.getType().equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

		model.addAttribute("classId", classId);
		if (classId == 0) {
			if (user.getType().equals("student")) {
				List<Assignment> assignmentList = assignmentBO.getAsgmtListByEmail(user.getEmail());
				model.addAttribute("assignmentList", assignmentList);
			} else if (user.getType().equals("professor")) {
				List<Assignment> assignmentList = assignmentBO.getAsgmtListByEmailProf(user.getEmail());
				model.addAttribute("assignmentList", assignmentList);
			}
		} else {

			List<Assignment> assignmentList = assignmentBO.getAsgmtListByClassId(classId);
			model.addAttribute("assignmentList", assignmentList);
		}

		return "template/layout";
	}

	@GetMapping("/add_assignment")
	public String addAssignmentView(@RequestParam("classId") int classId, Model model, HttpSession session) {
		model.addAttribute("view", "assignment/addAssignment");

		User user = (User) session.getAttribute("user");

		if (user.getType().equals("student")) {
			List<ClassCourseCombined> combinedList = courseBO.getClassCourseListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		} else if (user.getType().equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

		model.addAttribute("classId", classId);

		return "template/layout";
	}

	@GetMapping("/assignment_detail")
	public String assignmentDetailView(@RequestParam("classId") int classId, @RequestParam("asgmtId") int asgmtId,
			Model model, HttpSession session) {

		Assignment assignment = assignmentBO.getAsgmtByClassIdAsgmtId(classId, asgmtId);
		Class _class = courseBO.getClassById(classId);
		Course course = courseBO.getCourseByCourseCode(_class.getCourseCode());
		User user = (User) session.getAttribute("user");
		String type = user.getType();

		model.addAttribute("course", course);
		model.addAttribute("assignment", assignment);
		model.addAttribute("classId", classId);
		model.addAttribute("asgmtId", asgmtId);
		if (type.equals("student")) {
			model.addAttribute("view", "assignment/assignmentDetail");

			SubmittedAsgmt submittedAsgmt = assignmentBO.getSubmittedAsgmt(classId, asgmtId, user.getEmail());
			if (submittedAsgmt != null) {
				model.addAttribute("submittedAsgmt", submittedAsgmt);
			}
		} else if (type.equals("professor")) {
			model.addAttribute("view", "assignment/profAssignmentDetail");

			List<AssignmentUserCombined> submittedAsgmtList = assignmentBO.getSubmittedAsgmtUserList(_class.getId(),
					assignment.getAsgmtId());
			model.addAttribute("submittedAsgmtList", submittedAsgmtList);

		}

		return "template/layout";
	}

	@GetMapping("/edit_assignment")
	public String editAssignmentView(@RequestParam("classId") int classId, @RequestParam("asgmtId") int asgmtId,
			Model model) {

		Assignment assignment = assignmentBO.getAsgmtByClassIdAsgmtId(classId, asgmtId);

		model.addAttribute("assignment", assignment);
		model.addAttribute("view", "assignment/editAssignment");

		return "template/layout";
	}

	@GetMapping("/grade_assignment")
	public String gradeAssignmentView(@RequestParam("subAsgmtId") int subAsmgtId, Model model) {

		AssignmentUserCombined submittedAsgmt = assignmentBO.getSubmittedAsgmtUserById(subAsmgtId);
		Assignment assignment = assignmentBO.getAsgmtByClassIdAsgmtId(submittedAsgmt.getClassId(),
				submittedAsgmt.getAsgmtId());
		model.addAttribute("assignment", assignment);
		model.addAttribute("submittedAsgmt", submittedAsgmt);
		model.addAttribute("view", "assignment/gradeAssignment");

		return "template/layout";
	}
}
