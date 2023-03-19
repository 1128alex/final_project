package com.univ.assignment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.assignment.model.Assignment;
import com.univ.assignment.model.AssignmentUserCombined;
import com.univ.assignment.model.SubmittedAsgmt;

@Repository
public interface AssignmentDAO {
	public List<Assignment> selectAsgmtListByClassId(@Param("classId") int classId, @Param("pageNum") int pageNum);

	public int selectCountAsgmtListByClassId(int classId);

	public int insertAssignment(Assignment assignment);

	public Assignment selectAsgmtByClassIdAsgmtId(@Param("classId") int classId, @Param("asgmtId") int asgmtId);

	public int updateAssignment(Assignment assignment);

	public int deleteAssignment(@Param("classId") int classId, @Param("asgmtId") int asgmtId);

	public int insertSubmittedAssignment(SubmittedAsgmt submittedAsgmt);

	public int updateSubmittedAssignment(SubmittedAsgmt submittedAsgmt);

	public SubmittedAsgmt selectSubmittedAsgmt(@Param("classId") int classId, @Param("asgmtId") int asgmtId,
			@Param("email") String email);

	public List<AssignmentUserCombined> selectSubmittedAsgmtUserList(@Param("classId") int classId,
			@Param("asgmtId") int asgmtId);

	public AssignmentUserCombined selectSubmittedAsgmtUserById(int id);

	public int updateGradeSubmittedAsgmt(@Param("id") int id, @Param("score") Integer score,
			@Param("feedback") String feedback, @Param("access") boolean access);

	public List<Assignment> selectAsgmtListByEmailByDueDate(String email);

	public List<Assignment> selectAsgmtListByEmail(@Param("email") String email, @Param("pageNum") int pageNum);

	public int selectCountAsgmtListByEmail(String email);

	public List<Assignment> selectAsgmtListByEmailProf(@Param("email") String email, @Param("pageNum") int pageNum);

	public int selectCountAsgmtListByEmailProf(String email);

}
