package com.univ.assignment;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/univ/assignment")
@Controller
public class AssignmentController {
	@GetMapping("/assignment_list")
	public String assignmentListView(@RequestParam("classId") int classId, Model model) {
		model.addAttribute("view", "assignment/assignmentList");
		model.addAttribute("classId", classId);

		return "template/layout";
	}

	@GetMapping("/add_assignemnt")
	public String addAssignmentView(@RequestParam("classId") int classId, Model model) {
		model.addAttribute("view", "assignment/addAssignment");
		model.addAttribute("classId", classId);

		return "template/layout";
	}
}
