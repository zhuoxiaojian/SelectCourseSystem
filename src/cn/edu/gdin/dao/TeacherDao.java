package cn.edu.gdin.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.entity.Teacher;

public class TeacherDao extends HibernateDaoSupport{

	public Teacher Tea_info(String tenum){
		return (Teacher) this.getHibernateTemplate().get(Teacher.class, tenum);
	}
	
	public void Update_TeaInfo(Teacher teacher){
		 this.getHibernateTemplate().saveOrUpdate(teacher);
		
	}
	
	/*老师查看选了他的课的学生信息*/
	public List<SelectCourse> Find_Sele_Stu(String tenum){
		String str = " from SelectCourse sc where sc.id.course.teacher.tenum = ?";
		return this.getHibernateTemplate().find(str,tenum);
	
	}
	
	public <T> void addLog(T entity){
		this.getHibernateTemplate().saveOrUpdate(entity);
	}
}
