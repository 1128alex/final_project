package com.univ.assignment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.assignment.model.Assignment;
import com.univ.assignment.model.AssignmentUserCombined;
import com.univ.assignment.model.SubmittedAsgmt;

@Repository
public interface AssignmentDAO {
	public List<Assignment> selectAsgmtListByClassId(int classId);

	public int insertAssignment(Assignment assignment);

	public Assignment selectAsgmtByClassIdAsgmtId(@Param("classId") int classId, @Param("asgmtId") int asgmtId);

	public int updateAssignment(Assignment assignment);

	public int deleteAssignment(@Param("classId") int classId, @Param("asgmtId") int asgmtId);

	public int insertSubmittedAssignment(SubmittedAsgmt submittedAsgmt);

	public int checkDuplicatedSubmittedAsgmt(@Param("classId") int classId, @Param("asgmtId") int asgmtId,
			@Param("studentNum") String studentNum);

	public List<AssignmentUserCombined> selectSubmittedAsgmtUserList(@Param("classId") int classId,
			@Param("asgmtId") int asgmtId);

	public AssignmentUserCombined selectSubmittedAsgmtUserById(int id);

	public int updateGradeSubmittedAsgmt(@Param("id") int id, @Param("score") int score,
			@Param("feedback") String feedback);

}
