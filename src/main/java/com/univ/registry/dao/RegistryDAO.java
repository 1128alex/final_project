package com.univ.registry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.registry.model.Registry;

@Repository
public interface RegistryDAO {
	public int insertToClass(@Param("classId") int classId, @Param("email") String email);

	public List<Registry> selectRegistryListByEmail(String email);

	public int selectDuplicatedClass(@Param("classId") int classId, @Param("email") String email);

	public int countRegistryByClassId(int classId);

	public int checkTime(@Param("email") String email, @Param("monTime") int monTime,
			@Param("tueTime") int tueTime, @Param("wedTime") int wedTime, @Param("thuTime") int thuTime,
			@Param("friTime") int friTime);

}
