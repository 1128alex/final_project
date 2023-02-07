package com.univ.course.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Class {
	private String courseCode;
	private String profEmail;
	private int maxNum;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date registerDueDate;
	private Date monStartTime;
	private Date tueStartTime;
	private Date wedStartTime;
	private Date thuStartTime;
	private Date friStartTime;
	private Date createdAt;
	private Date updatedAt;

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
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

	public Date getMonStartTime() {
		return monStartTime;
	}

	public void setMonStartTime(Date monStartTime) {
		this.monStartTime = monStartTime;
	}

	public Date getTueStartTime() {
		return tueStartTime;
	}

	public void setTueStartTime(Date tueStartTime) {
		this.tueStartTime = tueStartTime;
	}

	public Date getWedStartTime() {
		return wedStartTime;
	}

	public void setWedStartTime(Date wedStartTime) {
		this.wedStartTime = wedStartTime;
	}

	public Date getThuStartTime() {
		return thuStartTime;
	}

	public void setThuStartTime(Date thuStartTime) {
		this.thuStartTime = thuStartTime;
	}

	public Date getFriStartTime() {
		return friStartTime;
	}

	public void setFriStartTime(Date friStartTime) {
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

}
