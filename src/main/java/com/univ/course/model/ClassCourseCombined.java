package com.univ.course.model;

import java.util.Date;

public class ClassCourseCombined {
	private String courseCode;
	private String courseName;
	private String description;
	private int id;
	private String profEmail;
	private int maxNum;
	private Date registerDueDate;
	private int monStartTime;
	private int tueStartTime;
	private int wedStartTime;
	private int thuStartTime;
	private int friStartTime;
	private Date createdAt;
	private Date updatedAt;
	private String email;
	private String firstName;
	private String lastName;
	private String gender;
	private String subject;
	private Integer averageGrade;
	private Integer registerCount;

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProfEmail() {
		return profEmail;
	}

	public void setProfEmail(String profEmail) {
		this.profEmail = profEmail;
	}

	public int getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}

	public Date getRegisterDueDate() {
		return registerDueDate;
	}

	public void setRegisterDueDate(Date registerDueDate) {
		this.registerDueDate = registerDueDate;
	}

	public int getMonStartTime() {
		return monStartTime;
	}

	public void setMonStartTime(int monStartTime) {
		this.monStartTime = monStartTime;
	}

	public int getTueStartTime() {
		return tueStartTime;
	}

	public void setTueStartTime(int tueStartTime) {
		this.tueStartTime = tueStartTime;
	}

	public int getWedStartTime() {
		return wedStartTime;
	}

	public void setWedStartTime(int wedStartTime) {
		this.wedStartTime = wedStartTime;
	}

	public int getThuStartTime() {
		return thuStartTime;
	}

	public void setThuStartTime(int thuStartTime) {
		this.thuStartTime = thuStartTime;
	}

	public int getFriStartTime() {
		return friStartTime;
	}

	public void setFriStartTime(int friStartTime) {
		this.friStartTime = friStartTime;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Integer getAverageGrade() {
		return averageGrade;
	}

	public void setAverageGrade(Integer averageGrade) {
		this.averageGrade = averageGrade;
	}

	public Integer getRegisterCount() {
		return registerCount;
	}

	public void setRegisterCount(Integer registerCount) {
		this.registerCount = registerCount;
	}

}
