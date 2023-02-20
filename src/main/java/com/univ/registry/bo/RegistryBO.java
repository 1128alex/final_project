package com.univ.registry.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.registry.dao.RegistryDAO;
import com.univ.registry.model.Registry;

@Service
public class RegistryBO {
	@Autowired
	private RegistryDAO registryDAO;

	public int registerToClass(int classId, String studentNum) {

		int dupCount = registryDAO.selectDuplicatedClass(classId, studentNum);
		if (dupCount > 0) {
			return 2;
		}

		return registryDAO.insertToClass(classId, studentNum);
	}

	public List<Registry> getRegistryListByStudentNum(String studentNum) {
		return registryDAO.selectRegistryListByStudentNum(studentNum);
	}

	public int countRegistryByClassId(int classId) {
		return registryDAO.countRegistryByClassId(classId);
	}
}
