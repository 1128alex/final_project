package com.univ.assignment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.assignment.dao.AssignmentDAO;
import com.univ.assignment.model.Assignment;

@Service
public class AssignmentBO {
	@Autowired
	private AssignmentDAO assignmentDAO;

	public List<Assignment> getAsgmtListByClassId(int classId) {
		return assignmentDAO.selectAsgmtListByClassId(classId);
	}

	public int addAssignment(Assignment assignment) {
		return assignmentDAO.insertAssignment(assignment);
	}

	public Assignment getAsgmtByClassIdAsgmtId(int classId, int asgmtId) {
		return assignmentDAO.selectAsgmtByClassIdAsgmtId(classId, asgmtId);
	}

	public int editAssignment(Assignment assignment) {
		return assignmentDAO.updateAssignment(assignment);
	}

	public int deleteAsgmt(int classId, int asgmtId) {
		return assignmentDAO.deleteAsgmt(classId, asgmtId);
	}
}
