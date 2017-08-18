package cn.edu.gdin.service;

import java.util.List;

import cn.edu.gdin.dao.CourseDao;
import cn.edu.gdin.entity.Course;

public class CourseService {
	private CourseDao courseDao ;
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	
	public List courseInfo(){
		return this.courseDao.findCourse();
	}
	public Course findCno(String cno){
		return this.courseDao.findCno(cno);
	}
}
