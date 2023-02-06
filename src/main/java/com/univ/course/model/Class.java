package com.univ.course.model;

import java.util.Date;

public class Class {
	private String courseCode;
	private String profEmail;
	private int maxNum;
	private Date registerDueDate;
	private Date monStartTime;
	private Date tuesStartTime;
	private Date wednesStartTime;
	private Date thursStartTime;
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

	public Date getTuesStartTime() {
		return tuesStartTime;
	}

	public void setTuesStartTime(Date tuesStartTime) {
		this.tuesStartTime = tuesStartTime;
	}

	public Date getWednesStartTime() {
		return wednesStartTime;
	}

	public void setWednesStartTime(Date wednesStartTime) {
		this.wednesStartTime = wednesStartTime;
	}

	public Date getThursStartTime() {
		return thursStartTime;
	}

	public void setThursStartTime(Date thursStartTime) {
		this.thursStartTime = thursStartTime;
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
