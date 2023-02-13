package com.univ.course.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.course.model.Class;
import com.univ.course.model.Course;

@Repository
public interface CourseDAO {

	public List<Course> selectCourseList();

	public List<Course> selectCourseListBySubjectCode(String subjectCode);

	public Course selectCourseByCourseCode(String courseCode);

	public int selectDuplicated(@Param("courseCode") String courseCode, @Param("profEmail") String profEmail);

	public int insertClass(Class newClass);

	public List<Class> selectClassList(String email);

	public Class selectClassByClassId(int classId);
}
