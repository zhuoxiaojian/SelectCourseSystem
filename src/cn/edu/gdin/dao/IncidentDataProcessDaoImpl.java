package cn.edu.gdin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.edu.gdin.entity.Course;
import cn.edu.gdin.entity.Teacher;

public class IncidentDataProcessDaoImpl implements IncidentDataProcessDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public List getIncidentData(int page,int rows,String str) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List list=new ArrayList();
		
		try {
			String hql="from Course c where c.teacher.tenum=?";
			
			Query query = session.createQuery(hql).setParameter(0, str);			
					 
	        query.setFirstResult((page - 1) * rows); 	 
	        query.setMaxResults(rows); 
			list=query.list();
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}		
		return list;
	}
	
	public Long getTotal(String str){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Long total = null;
		try {
			String hql=" from Course c where c.teacher.tenum=?";
			Query query = session.createQuery(hql).setParameter(0, str);
			total=(long) query.list().size();
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}			
		
		return total;
	}
	
	public void deleteData(String id){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			String sql=" delete FROM Course where cno='"+id+"'";
			Query query = session.createSQLQuery(sql);
			query.executeUpdate();
		
		
			session.getTransaction().commit();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}		
        return;
	}
	
	public void addData(Course course){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		try {
			Course temp=new Course();
			temp.setCno(course.getCno());						
			temp.setCname(course.getCname());
			temp.setCtype(course.getCtype());
			temp.setCplace(course.getCplace());
			temp.setCtime(course.getCtime());
			temp.setChours(course.getChours());
			temp.setCcredit(course.getCcredit());
			Teacher teacher = new Teacher();
			teacher.setTenum(course.getTeacher().getTenum());
			temp.setTeacher(teacher);
			session.save(temp);	
			session.getTransaction().commit();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}				
		return;
	}
	
	public void editData(Course course){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		try {
			Course temp=new Course();
			temp.setCno(course.getCno());						
			temp.setCname(course.getCname());
			temp.setCtype(course.getCtype());
			temp.setCplace(course.getCplace());
			temp.setCtime(course.getCtime());
			temp.setChours(course.getChours());
			temp.setCcredit(course.getCcredit());
			Teacher teacher = new Teacher();
			teacher.setTenum(course.getTeacher().getTenum());
			temp.setTeacher(teacher);
			session.update(temp);
			session.getTransaction().commit();			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}				
		return;
	}

	public <T> void addLog(T enityclass) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(enityclass);
		session.getTransaction().commit();
		session.close();
	}

	public <T> String getMaxNum(String str,String str1) {
		// TODO Auto-generated method stub
		String sql = " select Max("+str+") from "+str1;
		String sq = "";
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		 sq = s.createQuery(sql).uniqueResult().toString();
		s.getTransaction().commit();
		s.close();
		return sq;
	}

}
