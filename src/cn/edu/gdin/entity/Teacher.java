package cn.edu.gdin.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractTeacher entity provides the base persistence definition of the
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public  class Teacher implements java.io.Serializable {

	// Fields

	private String tenum;
	private String tename;
	private String tesex;
	private String tetitle;
	private String temajor;
	private Set courses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Teacher() {
	}

	/** minimal constructor */
	public Teacher(String tenum, String tename, String tesex,
			String tetitle, String temajor) {
		this.tenum = tenum;
		this.tename = tename;
		this.tesex = tesex;
		this.tetitle = tetitle;
		this.temajor = temajor;
	}

	/** full constructor */
	public Teacher(String tenum, String tename, String tesex,
			String tetitle, String temajor, Set courses) {
		this.tenum = tenum;
		this.tename = tename;
		this.tesex = tesex;
		this.tetitle = tetitle;
		this.temajor = temajor;
		this.courses = courses;
	}

	// Property accessors

	public String getTenum() {
		return this.tenum;
	}

	public void setTenum(String tenum) {
		this.tenum = tenum;
	}

	public String getTename() {
		return this.tename;
	}

	public void setTename(String tename) {
		this.tename = tename;
	}

	public String getTesex() {
		return this.tesex;
	}

	public void setTesex(String tesex) {
		this.tesex = tesex;
	}

	public String getTetitle() {
		return this.tetitle;
	}

	public void setTetitle(String tetitle) {
		this.tetitle = tetitle;
	}

	public String getTemajor() {
		return this.temajor;
	}

	public void setTemajor(String temajor) {
		this.temajor = temajor;
	}

	public Set getCourses() {
		return this.courses;
	}

	public void setCourses(Set courses) {
		this.courses = courses;
	}

}