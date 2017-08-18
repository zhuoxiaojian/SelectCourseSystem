package cn.edu.gdin.entity;

/**
 * AbstractSelectCourseId entity provides the base persistence definition of the
 * SelectCourseId entity. @author MyEclipse Persistence Tools
 */

public  class SelectCourseId implements java.io.Serializable {

	// Fields

	private Student student;
	private Course course;

	// Constructors

	/** default constructor */
	public SelectCourseId() {
	}

	/** full constructor */
	public SelectCourseId(Student student, Course course) {
		this.student = student;
		this.course = course;
	}

	// Property accessors

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return this.course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof SelectCourseId))
			return false;
		SelectCourseId castOther = (SelectCourseId) other;

		return ((this.getStudent() == castOther.getStudent()) || (this
				.getStudent() != null && castOther.getStudent() != null && this
				.getStudent().equals(castOther.getStudent())))
				&& ((this.getCourse() == castOther.getCourse()) || (this
						.getCourse() != null && castOther.getCourse() != null && this
						.getCourse().equals(castOther.getCourse())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getStudent() == null ? 0 : this.getStudent().hashCode());
		result = 37 * result
				+ (getCourse() == null ? 0 : this.getCourse().hashCode());
		return result;
	}

}