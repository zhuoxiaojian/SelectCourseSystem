package cn.edu.gdin.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractCourse entity provides the base persistence definition of the Course
 * entity. @author MyEclipse Persistence Tools
 */

public  class Course implements java.io.Serializable {

	// Fields

	private String cno;
	private Teacher teacher;
	private String cname;
	private String ctype;
	private String ctime;
	private String cplace;
	private String chours;
	private String ccredit;
	private Set selectCourses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Course() {
	}

	/** minimal constructor */
	public Course(String cno, Teacher teacher, String cname,
			String ctype, String ctime) {
		this.cno = cno;
		this.teacher = teacher;
		this.cname = cname;
		this.ctype = ctype;
		this.ctime = ctime;
	}

	/** full constructor */
	public Course(String cno, Teacher teacher, String cname,
			String ctype, String ctime, String cplace, String chours,
			String ccredit, Set selectCourses) {
		this.cno = cno;
		this.teacher = teacher;
		this.cname = cname;
		this.ctype = ctype;
		this.ctime = ctime;
		this.cplace = cplace;
		this.chours = chours;
		this.ccredit = ccredit;
		this.selectCourses = selectCourses;
	}

	// Property accessors

	public String getCno() {
		return this.cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCtype() {
		return this.ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCtime() {
		return this.ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	public String getCplace() {
		return this.cplace;
	}

	public void setCplace(String cplace) {
		this.cplace = cplace;
	}

	public String getChours() {
		return this.chours;
	}

	public void setChours(String chours) {
		this.chours = chours;
	}

	public String getCcredit() {
		return this.ccredit;
	}

	public void setCcredit(String ccredit) {
		this.ccredit = ccredit;
	}

	public Set getSelectCourses() {
		return this.selectCourses;
	}

	public void setSelectCourses(Set selectCourses) {
		this.selectCourses = selectCourses;
	}

}