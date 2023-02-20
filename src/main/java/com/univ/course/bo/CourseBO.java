package com.univ.course.bo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.univ.course.dao.CourseDAO;
import com.univ.course.model.Class;
import com.univ.course.model.ClassCourseCombined;
import com.univ.course.model.Course;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

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

	public List<ClassCourseCombined> getFilteredCourseList(String searchKeyword, String courseName, String subjectCode,
			String courseLevel, int pageNum) {
		return courseDAO.selectFilteredCourseList(searchKeyword, courseName, subjectCode, courseLevel, pageNum);
	}

	public Course getCourseByCourseCode(String courseCode) {
		return courseDAO.selectCourseByCourseCode(courseCode);
	}

	public int addClass(Class newClass, String registerDueDateString, HttpSession session) throws ParseException {

		User user = (User) session.getAttribute("user");
		String profEmail = user.getEmail();
		newClass.setProfEmail(profEmail);

		Date registerDueDate = new SimpleDateFormat("yyyy/MM/dd").parse(registerDueDateString);
		newClass.setRegisterDueDate(registerDueDate);

		int dupCount = courseDAO.selectDuplicated(newClass.getCourseCode(), profEmail);

		if (dupCount == 1) {
			return 2;
		}

		return courseDAO.insertClass(newClass);
	}

	public int editClass(Class newClass, int classId, String prevCourseCode, String registerDueDateString,
			HttpSession session) throws ParseException {

		newClass.setId(classId);

		User user = (User) session.getAttribute("user");
		String profEmail = user.getEmail();
		newClass.setProfEmail(profEmail);

		Date registerDueDate = new SimpleDateFormat("yyyy/MM/dd").parse(registerDueDateString);
		newClass.setRegisterDueDate(registerDueDate);

		int dupCount = 0;
		if (prevCourseCode.equals(newClass.getCourseCode()) == false) {
			dupCount = courseDAO.selectDuplicated(newClass.getCourseCode(), profEmail);
		}

		if (dupCount == 1) {
			return 2;
		}

		return courseDAO.updateClass(newClass);
	}

	public List<Class> getClassList() {
		return courseDAO.selectClassList();
	}

	public List<Class> getClassListByCourseCode(String courseCode) {
		return courseDAO.selectClassListByCourseCode(courseCode);
	}

	public List<Class> getClassListByEmail(String email) {
		return courseDAO.selectClassListByEmail(email);
	}

	public Class getClassById(int classId) {
		return courseDAO.selectClassByClassId(classId);
	}

	public int deleteClass(int classId) {
		return courseDAO.deleteClass(classId);
	}

	public int countFilteredCourseList(String searchKeyword, String courseName, String subjectCode,
			String courseLevel) {

		return courseDAO.countFilteredCourseList(searchKeyword, courseName, subjectCode, courseLevel);
	}

}
