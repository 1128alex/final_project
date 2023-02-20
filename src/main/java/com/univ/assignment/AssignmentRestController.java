package com.univ.assignment;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.univ.assignment.bo.AssignmentBO;
import com.univ.assignment.model.Assignment;
import com.univ.assignment.model.SubmittedAsgmt;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/assignment")
@RestController
public class AssignmentRestController {
	@Autowired
	private AssignmentBO assignmentBO;

	@PutMapping("/add_assignment")
	public Map<String, Object> addAssignment(@ModelAttribute Assignment assignment,
			@RequestParam("maxScoreString") String maxScoreString,
			@RequestParam(value = "files", required = false) List<MultipartFile> files,
			@RequestParam(value = "dueDateString", required = false) String dueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		int rowCount = assignmentBO.addAssignment(assignment, maxScoreString, files, dueDateString, session);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while adding the assignment.");
		}

		return result;
	}

	@PutMapping("/edit_assignment")
	public Map<String, Object> editAssignment(@ModelAttribute Assignment assignment,
			@RequestParam("maxScoreString") String maxScoreString,
			@RequestParam(value = "files", required = false) List<MultipartFile> files,
			@RequestParam(value = "dueDateString", required = false) String dueDateString, HttpSession session)
			throws ParseException {
		Map<String, Object> result = new HashMap<>();

		int rowCount = assignmentBO.editAssignment(assignment, maxScoreString, files, dueDateString, session);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while editing the assignment.");
		}

		return result;
	}

	@DeleteMapping("/delete_assignment")
	public Map<String, Object> deleteAssignment(@RequestParam("classId") int classId,
			@RequestParam("asgmtId") int asgmtId) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = assignmentBO.deleteAssignment(classId, asgmtId);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while deleting class.");
		}

		return result;
	}

	// SubmittedAssignment
	@PutMapping("/submit_assignment")
	public Map<String, Object> submitAssignment(@RequestParam("resubmit") boolean re,
			@ModelAttribute SubmittedAsgmt submittedAsgmt,
			@RequestParam(value = "files", required = false) List<MultipartFile> files, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = assignmentBO.submitAssignment(re, submittedAsgmt, files, session);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while submitting assignment");
		}

		return result;
	}

	@PutMapping("/grade_assignment")
	public Map<String, Object> gradeAssignment(@RequestParam("subAsgmtId") int subAsgmtId,
			@RequestParam(value = "score", required = false) Integer score,
			@RequestParam(value = "feedback", required = false) String feedback,
			@RequestParam("access") boolean access) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = assignmentBO.gradeSubmittedAsgmt(subAsgmtId, score, feedback, access);

		if (rowCount > 0) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while grading Assignment");
		}

		return result;
	}

}
