package com.univ.course.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.course.dao.CourseDAO;
import com.univ.course.model.Course;

import com.univ.course.model.Class;

@Service
public class CourseBO {

	@Autowired
	private CourseDAO courseDAO;

	public List<Course> getCourseList() {
		return courseDAO.selectCourseList();
	}

	public List<Course> getCourseListBySubjectCode(String subjectCode) {
		return courseDAO.selectCourseListBySubjectCode(subjectCode);
	}

	public Course getCourseByCourseCode(String courseCode) {
		return courseDAO.selectCourseByCourseCode(courseCode);
	}

	public int checkDuplicatedClass(String courseCode, String profEmail) {
		return courseDAO.selectDuplicated(courseCode, profEmail);
	}

	public int addClass(Class newClass) {
		return courseDAO.insertClass(newClass);
	}

	public int updateClass(Class newClass) {
		return courseDAO.updateClass(newClass);
	}

	public List<Class> getClassList(String email) {
		return courseDAO.selectClassList(email);
	}

	public Class getClassById(int classId) {
		return courseDAO.selectClassByClassId(classId);
	}

}
