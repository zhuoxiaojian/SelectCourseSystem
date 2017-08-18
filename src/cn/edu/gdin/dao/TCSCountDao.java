package cn.edu.gdin.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.Course;

/**
 * 老师查看自己已经发布的课程和有多少学生选
 * @author 卓小建
 * @version 1.1
 */
public class TCSCountDao extends HibernateDaoSupport{
	
	public List<TCS> Count(String tenum){
		List<TCS> ll = new ArrayList<TCS>();
		TCS tcs = null;
		String str = " from Course c where c.teacher.tenum = ?";
		List<Course> list = this.getHibernateTemplate().find(str,tenum);
		if(!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				tcs = new TCS();
				String cno = list.get(i).getCno();
				String sql = "SELECT COUNT(*) FROM SelectCourse sc where  sc.id.course.cno = ?";
				
				Session session = this.getHibernateTemplate().getSessionFactory()
						.openSession();
				Query query = session.createQuery(sql).setParameter(0, cno);
				
				
				if (!query.list().isEmpty()) {
					int count = ((Number) query.uniqueResult()).intValue();
					tcs.setStucount(count);
					
				}else{
					tcs.setStucount(0);
				}
				tcs.setCno(list.get(i).getCno());
				tcs.setCname(list.get(i).getCname());
				tcs.setCplace(list.get(i).getCplace());
				tcs.setCtime(list.get(i).getCtime());
				tcs.setCtype(list.get(i).getCtype());
				tcs.setChours(list.get(i).getChours());
				tcs.setCcredit(list.get(i).getCcredit());
				ll.add(tcs);
			    tcs = null;
			    session.close();
			}
		    System.gc();
			 return ll;	
		}else{
		    System.gc();
			return null;
		}
	}

	
	public List SInfo(String tenum,String cno){
	    String str = " from SelectCourse sc where sc.id.course.teacher.tenum = ? and sc.id.course.cno = ?";
		return this.getHibernateTemplate().find(str,new String[] {tenum,cno});
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<TCS> ACount(){
		List<TCS> ll = new ArrayList<TCS>();
		TCS tcs = null;
		String str = " from Course";
		List<Course> list = this.getHibernateTemplate().find(str);
		if(!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				tcs = new TCS();
				String cno = list.get(i).getCno();
				String sql = "SELECT COUNT(*) FROM SelectCourse sc where  sc.id.course.cno = ?";
				
				Session session = this.getHibernateTemplate().getSessionFactory()
						.openSession();
				Query query = session.createQuery(sql).setParameter(0, cno);
				
				if (!query.list().isEmpty()) {
					int count = ((Number) query.uniqueResult()).intValue();
					tcs.setStucount(count);
					
				}else{
					tcs.setStucount(0);
				}
				tcs.setCno(list.get(i).getCno());
				tcs.setCname(list.get(i).getCname());
				tcs.setCplace(list.get(i).getCplace());
				tcs.setCtime(list.get(i).getCtime());
				tcs.setCtype(list.get(i).getCtype());
				tcs.setChours(list.get(i).getChours());
				tcs.setCcredit(list.get(i).getCcredit());
				ll.add(tcs);
			    tcs = null;
			    session.close();
			}
			 return ll;	
		}else{
			return null;
		}
	}
	
	
}
