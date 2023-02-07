package com.univ.course.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.univ.course.model.Course;

@Repository
public interface CourseDAO {

	public List<Course> selectCourseList();

	public List<Course> selectCourseListBySubjectCode(String subjectCode);

	public int insertClass(Class newClass);
}
