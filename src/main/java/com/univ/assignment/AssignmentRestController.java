package com.univ.assignment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.univ.assignment.bo.AssignmentBO;
import com.univ.assignment.model.Assignment;

@RequestMapping("/assignment")
@RestController
public class AssignmentRestController {
	@Autowired
	private AssignmentBO assignmentBO;

	@GetMapping("/add_assignnment")
	public Map<String, Object> addAssignment(@ModelAttribute Assignment assignment,
			@RequestParam(value = "filePath", required = false) MultipartFile filePath,
			@RequestParam("dueDateString") String dueDateString) {
		Map<String, Object> result = new HashMap<>();

		String profileUrl = null;
		if (profileFile != null) {
			profileUrl = fileManagerService.saveFile(user.getEmail(), profileFile);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(dueDateString);
		Date dueDate = sdf.parse(dueDateString);
		assignment.setDueDate(dueDate);
		assignmentBO.addAssignment(assignment);

		return result;
	}
}
