package com.univ.registry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.registry.model.Registry;

@Repository
public interface RegistryDAO {
	public int insertToClass(@Param("classId") int classId, @Param("studentNum") String studentNum);

	public List<Registry> selectRegistryListByStudentNum(String studentNum);

	public int selectDuplicatedClass(@Param("classId") int classId, @Param("studentNum") String studentNum);
}
