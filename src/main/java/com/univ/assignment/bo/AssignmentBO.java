package com.univ.assignment.bo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.univ.assignment.dao.AssignmentDAO;
import com.univ.assignment.model.Assignment;
import com.univ.assignment.model.AssignmentUserCombined;
import com.univ.assignment.model.SubmittedAsgmt;
import com.univ.common.FileManagerService;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class AssignmentBO {
	@Autowired
	private AssignmentDAO assignmentDAO;
	@Autowired
	private FileManagerService fileManagerService;

	public List<Assignment> getAsgmtListByClassId(int classId) {
		return assignmentDAO.selectAsgmtListByClassId(classId);
	}

	public int addAssignment(Assignment assignment, String maxScoreString, List<MultipartFile> files,
			String dueDateString, HttpSession session) throws ParseException {

		if (maxScoreString.equals("") == false) {
			int maxScore = (int) Integer.parseInt(maxScoreString);
			assignment.setMaxScore(maxScore);
		}

		if (files != null) {
			// saving and adding files to database
			String filePath = "";
			User user = (User) session.getAttribute("user");
			String email = user.getEmail();
			for (MultipartFile file : files) {
				filePath += fileManagerService.saveFile(email, file);
			}

			assignment.setFilePath(filePath);
		}

		if (dueDateString != null) {
			// setting due date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date dueDate = sdf.parse(dueDateString);
			assignment.setDueDate(dueDate);
		}

		return assignmentDAO.insertAssignment(assignment);
	}

	public Assignment getAsgmtByClassIdAsgmtId(int classId, int asgmtId) {
		return assignmentDAO.selectAsgmtByClassIdAsgmtId(classId, asgmtId);
	}

	public int editAssignment(Assignment assignment, String maxScoreString, List<MultipartFile> files,
			String dueDateString, HttpSession session) throws ParseException {

		if (maxScoreString.equals("") == false) {
			int maxScore = (int) Integer.parseInt(maxScoreString);
			assignment.setMaxScore(maxScore);
		}

		if (files != null) {
			// saving and adding files to database
			String[] filePaths = new String[files.size()];
			User user = (User) session.getAttribute("user");
			String email = user.getEmail();
			int index = 0;
			for (MultipartFile file : files) {
				filePaths[index++] = fileManagerService.saveFile(email, file);
			}

			String filePath = null;
			for (int i = 0; i < filePaths.length; i++) {
				if (i == 0) {
					filePath = filePaths[i] + " ";
				} else {
					filePath += filePaths[i] + " ";
				}
			}
			assignment.setFilePath(filePath);
		}

		if (dueDateString != null) {
			// setting due date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date dueDate = sdf.parse(dueDateString);
			assignment.setDueDate(dueDate);
		}

		return assignmentDAO.updateAssignment(assignment);
	}

	public int deleteAssignment(int classId, int asgmtId) {
		return assignmentDAO.deleteAssignment(classId, asgmtId);
	}

	public int submitAssignment(boolean re, SubmittedAsgmt submittedAsgmt, List<MultipartFile> files,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		String studentNum = user.getStudentNum();
		submittedAsgmt.setStudentNum(studentNum);

		if (files != null) {
			String[] filePaths = new String[files.size()];
			String email = user.getEmail();
			int index = 0;
			for (MultipartFile file : files) {
				filePaths[index++] = fileManagerService.saveFile(email, file);
			}

			String filePath = null;
			for (int i = 0; i < filePaths.length; i++) {
				if (i == 0) {
					filePath = filePaths[i] + " ";
				} else {
					filePath += filePaths[i] + " ";
				}
			}
			submittedAsgmt.setFilePath(filePath);
		}

		Assignment assignment = getAsgmtByClassIdAsgmtId(submittedAsgmt.getClassId(), submittedAsgmt.getAsgmtId());
		if (assignment.getAsgmtType().equals("Ungraded Assignment")) {
			submittedAsgmt.setAccess(true);
		} else {
			submittedAsgmt.setAccess(false);
		}

		if (re) {
			return assignmentDAO.updateSubmittedAssignment(submittedAsgmt);
		} else {
			return assignmentDAO.insertSubmittedAssignment(submittedAsgmt);
		}

	}

	public SubmittedAsgmt getSubmittedAsgmt(int classId, int asgmtId, String studentNum) {
		return assignmentDAO.selectSubmittedAsgmt(classId, asgmtId, studentNum);
	}

	public List<AssignmentUserCombined> getSubmittedAsgmtUserList(int classId, int asgmtId) {
		return assignmentDAO.selectSubmittedAsgmtUserList(classId, asgmtId);
	}

	public AssignmentUserCombined getSubmittedAsgmtUserById(int id) {
		return assignmentDAO.selectSubmittedAsgmtUserById(id);
	}

	public int gradeSubmittedAsgmt(int subAsgmtId, Integer score, String feedback, boolean access) {

		if (feedback.equals("")) {
			feedback = null;
		}

		return assignmentDAO.updateGradeSubmittedAsgmt(subAsgmtId, score, feedback, access);
	}

}
