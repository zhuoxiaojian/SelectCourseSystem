package cn.edu.gdin.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import cn.edu.gdin.entity.Student;

public class StudentDao extends HibernateDaoSupport{

	public Student find(Object values){
		String str = " from Student where stunum = ?";
		List list = this.getHibernateTemplate().find(str, values);
		if(list.size()>0){
			return  (Student) list.get(0);
		}
		return null;
	}
	
	public boolean updateStuInfo(Student student){
		
		try{
		this.getHibernateTemplate().saveOrUpdate(student);
		return true;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	};
	public <T> void addLog(T entity){
		this.getHibernateTemplate().saveOrUpdate(entity);
	}
	
}
