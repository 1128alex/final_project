package com.univ.course.model;

import com.univ.user.model.User;

public class ClassInfoCombined {

	private User user;

	private Course course;

	private Class _class;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Class get_class() {
		return _class;
	}

	public void set_class(Class _class) {
		this._class = _class;
	}

}
