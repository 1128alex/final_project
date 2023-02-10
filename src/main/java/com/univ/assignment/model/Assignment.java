package com.univ.assignment.model;

import java.util.Date;

public class Assignment {
	private int classId;
	private Integer asgmtId;
	private String asgmtType;
	private String asgmtName;
	private String content;
	private String filePath;
	private int maxScore;
	private Date dueDate;
	private Date createdAt;
	private Date updatedAt;

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public Integer getAsgmtId() {
		return asgmtId;
	}

	public void setAsgmtId(Integer asgmtId) {
		this.asgmtId = asgmtId;
	}

	public String getAsgmtType() {
		return asgmtType;
	}

	public void setAsgmtType(String asgmtType) {
		this.asgmtType = asgmtType;
	}

	public String getAsgmtName() {
		return asgmtName;
	}

	public void setAsgmtName(String asgmtName) {
		this.asgmtName = asgmtName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
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
