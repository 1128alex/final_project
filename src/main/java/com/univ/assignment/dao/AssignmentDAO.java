package com.univ.assignment.dao;

import org.springframework.stereotype.Repository;

import com.univ.assignment.model.Assignment;

@Repository
public interface AssignmentDAO {
	public int insertAssignment(Assignment assignment);
}
