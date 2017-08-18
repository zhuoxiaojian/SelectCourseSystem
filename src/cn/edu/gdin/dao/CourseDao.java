package cn.edu.gdin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.entity.Course;

public class CourseDao extends HibernateDaoSupport{

	
	@SuppressWarnings({ "rawtypes" })
	public List findCourse(){
		String str = " from Course";
		return this.getHibernateTemplate().find(str);
	}
	
	
	public Course findCno(String cno){
		return (Course) this.getHibernateTemplate().get(Course.class, cno);
	}
}
