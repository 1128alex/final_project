package com.univ.course.model;

import java.util.Date;

public class Class {
	private String courseCode;
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

}
