package com.univ.assignment;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.univ.assignment.bo.AssignmentBO;
import com.univ.assignment.model.Assignment;
import com.univ.common.FileManagerService;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/assignment")
@RestController
public class AssignmentRestController {
	@Autowired
	private AssignmentBO assignmentBO;
	@Autowired
	private FileManagerService fileManagerService;

	@PutMapping("/add_assignment")
	public Map<String, Object> addAssignment(@ModelAttribute Assignment assignment,
			@RequestParam("maxScoreString") String maxScoreString,
			@RequestParam(value = "file", required = false) MultipartFile[] files,
			@RequestParam(value = "dueDateString", required = false) String dueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		if (maxScoreString.equals("") == false) {
			int maxScore = (int) Integer.parseInt(maxScoreString);
			assignment.setMaxScore(maxScore);
		}

		if (files != null) {
			// saving and adding files to database
			String[] filePaths = new String[files.length];
			User user = (User) session.getAttribute("user");
			String email = user.getEmail();
			for (int i = 0; i < files.length; i++) {
				filePaths[i] = fileManagerService.saveFile(email, files[i]);
			}
			String filePath = null;
			for (int i = 0; i < filePaths.length; i++) {
				filePath = filePaths[i] + " ";
			}
			assignment.setFilePath(filePath);
		}

		if (dueDateString.equals("")) {
			// setting due date
			SimpleDateFormat sdf = new SimpleDateFormat(dueDateString);
			Date dueDate = sdf.parse(dueDateString);
			assignment.setDueDate(dueDate);
		}

		int rowCount = assignmentBO.addAssignment(assignment);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
		}

		return result;
	}
}
