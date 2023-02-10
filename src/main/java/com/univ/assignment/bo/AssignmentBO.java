package com.univ.assignment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.assignment.dao.AssignmentDAO;
import com.univ.assignment.model.Assignment;

@Service
public class AssignmentBO {
	@Autowired
	private AssignmentDAO assignmentDAO;

	public int addAssignment(Assignment assignment) {
		return assignmentDAO.insertAssignment(assignment);
	}
}
