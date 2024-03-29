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

	public int registerToClass(int classId, String email) {

		int dupCount = registryDAO.selectDuplicatedClass(classId, email);
		if (dupCount > 0) {
			return 2;
		}

		return registryDAO.insertToClass(classId, email);
	}

	public List<Registry> getRegistryListByEmail(String email) {
		return registryDAO.selectRegistryListByEmail(email);
	}

	public int countRegistryByClassId(int classId) {
		return registryDAO.countRegistryByClassId(classId);
	}

	public int checkTime(String email, int monTime, int tueTime, int wedTime, int thuTime, int friTime) {
		return registryDAO.checkTime(email, monTime, tueTime, wedTime, thuTime, friTime);
	}

	public int dupCheck(int classId, String email) {
		return registryDAO.selectDuplicatedClass(classId, email);
	}

}
