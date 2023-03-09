package com.univ.course.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.course.model.Class;
import com.univ.course.model.ClassCourseCombined;
import com.univ.course.model.Course;

@Repository
public interface CourseDAO {

	public List<Course> selectCourseList();

	public List<Course> selectCourseListBySubjectCode(String subjectCode);

	public List<ClassCourseCombined> selectFilteredCourseList(@Param("searchKeyword") String searchKeyword,
			@Param("courseName") String courseName, @Param("subjectCode") String subjectCode,
			@Param("courseLevel") String courseLevel, @Param("pageNum") int pageNum);

	public Course selectCourseByCourseCode(String courseCode);

	public int selectDuplicated(@Param("courseCode") String courseCode, @Param("profEmail") String profEmail);

	public int insertClass(Class newClass);

	public int updateClass(Class newClass);

	public List<Class> selectClassList();

	public List<ClassCourseCombined> selectCombinedListByEmail(String email);

	public List<Class> selectClassListByEmail(String email);

	public List<Class> selectClassListByCourseCode(String courseCode);

	public Class selectClassByClassId(int classId);

	public int deleteClass(int classId);

	public int countFilteredCourseList(@Param("searchKeyword") String searchKeyword,
			@Param("courseName") String courseName, @Param("subjectCode") String subjectCode,
			@Param("courseLevel") String courseLevel);

	public ClassCourseCombined selectClassCourseByClassId(@Param("classId") int classId,
			@Param("studentNum") String studentNum);

	public ClassCourseCombined selectClassCourseByClassIdForDetail(int classId);

}
