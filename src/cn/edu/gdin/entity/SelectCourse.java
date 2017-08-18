package cn.edu.gdin.entity;

/**
 * AbstractSelectCourse entity provides the base persistence definition of the
 * SelectCourse entity. @author MyEclipse Persistence Tools
 */

public  class SelectCourse implements java.io.Serializable {

	// Fields

	private SelectCourseId id;
	private Integer result;

	// Constructors

	/** default constructor */
	public SelectCourse() {
	}

	/** minimal constructor */
	public SelectCourse(SelectCourseId id) {
		this.id = id;
	}

	/** full constructor */
	public SelectCourse(SelectCourseId id, Integer result) {
		this.id = id;
		this.result = result;
	}

	// Property accessors

	public SelectCourseId getId() {
		return this.id;
	}

	public void setId(SelectCourseId id) {
		this.id = id;
	}

	public Integer getResult() {
		return this.result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	
}