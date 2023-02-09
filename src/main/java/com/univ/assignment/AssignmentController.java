package com.univ.assignment;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/univ/assignment")
@Controller
public class AssignmentController {
	@GetMapping("/assignment_list")
	public String assignmentListView(Model model) {
		model.addAttribute("view", "assignment/assignmentList");

		return "template/layout";
	}

	@GetMapping("/add_assignemnt")
	public String addAssignmentView(Model model) {
		model.addAttribute("view", "assignment/addAssignment");

		return "template/layout";
	}
}
