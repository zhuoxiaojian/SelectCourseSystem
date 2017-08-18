package cn.edu.gdin.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractStudent entity provides the base persistence definition of the
 * Student entity. @author MyEclipse Persistence Tools
 */

public  class Student implements java.io.Serializable {

	// Fields

	private String stunum;
	private String stuname;
	private String stusex;
	private String stubirth;
	private String stuadim;
	private String stumajor;
	private String stuclass;
	private String stucollege;
	private Set selectCourses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String stunum, String stuname, String stusex,
			String stubirth, String stuadim, String stumajor, String stuclass,
			String stucollege) {
		this.stunum = stunum;
		this.stuname = stuname;
		this.stusex = stusex;
		this.stubirth = stubirth;
		this.stuadim = stuadim;
		this.stumajor = stumajor;
		this.stuclass = stuclass;
		this.stucollege = stucollege;
	}

	/** full constructor */
	public Student(String stunum, String stuname, String stusex,
			String stubirth, String stuadim, String stumajor, String stuclass,
			String stucollege, Set selectCourses) {
		this.stunum = stunum;
		this.stuname = stuname;
		this.stusex = stusex;
		this.stubirth = stubirth;
		this.stuadim = stuadim;
		this.stumajor = stumajor;
		this.stuclass = stuclass;
		this.stucollege = stucollege;
		this.selectCourses = selectCourses;
	}

	// Property accessors

	public String getStunum() {
		return this.stunum;
	}

	public void setStunum(String stunum) {
		this.stunum = stunum;
	}

	public String getStuname() {
		return this.stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	public String getStusex() {
		return this.stusex;
	}

	public void setStusex(String stusex) {
		this.stusex = stusex;
	}

	public String getStubirth() {
		return this.stubirth;
	}

	public void setStubirth(String stubirth) {
		this.stubirth = stubirth;
	}

	public String getStuadim() {
		return this.stuadim;
	}

	public void setStuadim(String stuadim) {
		this.stuadim = stuadim;
	}

	public String getStumajor() {
		return this.stumajor;
	}

	public void setStumajor(String stumajor) {
		this.stumajor = stumajor;
	}

	public String getStuclass() {
		return this.stuclass;
	}

	public void setStuclass(String stuclass) {
		this.stuclass = stuclass;
	}

	public String getStucollege() {
		return this.stucollege;
	}

	public void setStucollege(String stucollege) {
		this.stucollege = stucollege;
	}

	public Set getSelectCourses() {
		return this.selectCourses;
	}

	public void setSelectCourses(Set selectCourses) {
		this.selectCourses = selectCourses;
	}

	@Override
	public String toString() {
		return "Student [stunum=" + stunum + ", stuname=" + stuname
				+ ", stusex=" + stusex + ", stubirth=" + stubirth
				+ ", stuadim=" + stuadim + ", stumajor=" + stumajor
				+ ", stuclass=" + stuclass + ", stucollege=" + stucollege + "]";
	}

}