package cn.edu.gdin.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.entity.SelectCourse;

public class SelectCourseDao extends HibernateDaoSupport{

	public void sele_cour(SelectCourse sc){
		this.getHibernateTemplate().save(sc);
	}
	
	public void sele_cour(String stunum,String cno){
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		String str = "insert into select_course(stunum,cno) values('"+ stunum +"','"+cno+"')";
		s.createSQLQuery(str).executeUpdate();
		s.getTransaction().commit();
		s.close();
	}
	
	@SuppressWarnings("rawtypes")
	public int sele_cno(String cno,String stunum){
		String str = " from SelectCourse where id.course.cno = ? and id.student.stunum=?";
		List list = this.getHibernateTemplate().find(str,new String[] {cno,stunum});
		return list.size();
	}
	public <T> void addLog(T entity){
		this.getHibernateTemplate().saveOrUpdate(entity);
	}
}
