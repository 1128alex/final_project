package com.univ.course.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.course.dao.CourseDAO;
import com.univ.course.model.Course;

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

	public int addClass(Class newClass) {
		return courseDAO.insertClass(newClass);
	}

}
