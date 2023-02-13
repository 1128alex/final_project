package com.univ.assignment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.assignment.model.Assignment;

@Repository
public interface AssignmentDAO {
	public List<Assignment> selectAsgmtListByClassId(int classId);

	public int insertAssignment(Assignment assignment);

	public Assignment selectAsgmtByClassIdAsgmtId(@Param("classId") int classId, @Param("asgmtId") int asgmtId);
}
