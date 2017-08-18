package cn.edu.gdin.Adao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.Adao.AdminCommonDao;
import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.Course;
import cn.edu.gdin.entity.SelectCourse;

public class AdminCommonDaoImpl extends HibernateDaoSupport implements AdminCommonDao{
	
	@SuppressWarnings("unchecked")
	public <T> List<T> findAll(Class<T> entityclass) {
		String hql = "from " + entityclass.getName();
		return this.getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public <T> T findById(Class<T> entityClass, String id) {
		return (T) this.getHibernateTemplate().get(entityClass, id);
	}

	public <T> void remove(T entity) {
		this.getHibernateTemplate().delete(entity);
	}

	public <T> void sava(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	public <T> void update(T entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> getIncidentData(Class<T> entityclass,int page, int rows) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<T> list=new ArrayList<T>();
		
		try {
			String hql="from "+entityclass.getName();
			
			Query query = session.createQuery(hql);		
					 
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


	public <T> Long getTotal(Class<T> entityclass) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Long total = null;
		try {
			String hql=" from "+entityclass.getName();
			Query query = session.createQuery(hql);
			total=(long) query.list().size();
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}			
		
		return total;
	}

	public SelectCourse findByTwoId(String id1, String id2) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		SelectCourse selectCourse1 = null;
		try {
			String hql=" from SelectCourse where cno = ? and stunum = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, id1);
			query.setParameter(1, id2);
			selectCourse1 = (SelectCourse) query.list().get(0);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return selectCourse1;
	}

	/*根据某个参数进行统计*/
	public <T> Long findByParam(Class<T> entityclass, String name,
			String param) {
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Long count  = null;
		try{
			String hql="select COUNT(*) from "+entityclass.getName()+" where "+name+"=?";
			Query query = session.createQuery(hql);
			query.setParameter(0, param);
			count =  (long) ((Long) query.uniqueResult()).intValue();
			session.getTransaction().commit();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			session.close();
		}
		return count;
	}

	public <T> Object[] getColumnName(Class<T> entityclass) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		 Object[] string = null;
		 String sql = "";
		try{
			
			if(entityclass.getSimpleName().equals("SelectCourse")){
				sql = "select COLUMN_NAME from information_schema.columns where table_name='select_course'and table_schema='SCdatabase'";
			}else{
				sql = "select COLUMN_NAME from information_schema.columns where table_name='"+entityclass.getSimpleName()+"'and table_schema='SCdatabase'";
			}
			SQLQuery query = session.createSQLQuery(sql);
		   string = query.list().toArray();
	      session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}	
		return string;
	}


	

	public <T> Long getByParamTotal(Class<T> entityclass,String param0,String param1) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Long total = null;
		String hql = "";
		Query query = null;
		try {
			if(param1!=null&&param1!=""){
				if("SelectCourse".equals(entityclass.getSimpleName())){
					if("Result".equals(param0)){
						
						 hql = "from SelectCourse where "+param0+" > "+param1;
						}else{
						hql="from SelectCourse where "+param0+" like '%"+param1+"%'";
						}
				}if(param1!=null&&param1!=""&&"Cteacher".equals(param0)){
					hql = "from Course as c where c.teacher.tenum like '% "+param1+"%'";
				}
				
				
				else{
				 hql="from "+entityclass.getSimpleName()+" where "+param0+" like '%"+param1+"%'";
				}
				 query = session.createQuery(hql);	
				
			
			}if(param1==null||param1==""){
				hql = "from "+entityclass.getSimpleName();
				query = session.createQuery(hql);
			}
			
			total=(long) query.list().size();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}			
		
		return total;
	}

	public <T> List<T> getByParamData(Class<T> entityclass,
			String param0, String param1) {
		
			SessionFactory sessionFactory = getSessionFactory();
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			List<T> list=new ArrayList<T>();
			String hql = "";
			Query query = null;
			try {
				
				if(param1!=null&&param1!=""){
				if("SelectCourse".equals(entityclass.getSimpleName())){
					if("Result".equals(param0)){
						
					 hql = "from SelectCourse where "+param0+" > "+param1;
					}else{
					hql="from SelectCourse where "+param0+" like '%"+param1+"%'";
					}
				}else{
				 hql="from "+entityclass.getSimpleName()+" where "+param0+" like '%"+param1+"%'";
				}
				 query = session.createQuery(hql);		
				 list=query.list();
		        
				}if(param1==null||param1==""){
					hql="from "+entityclass.getSimpleName();
					 query = session.createQuery(hql);	
					 list=query.list();
				}
				 
				session.getTransaction().commit();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				session.close();
			}		
			return list;
		}

	public <T> List<T> Register(Class<T> entityclass, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		SessionFactory sessionFaction = getSessionFactory();
		Session session = sessionFaction.openSession();
		List<T> list = new ArrayList<T>();
		Query query = null;
		session.beginTransaction();
		try{
		String sql = " from "+entityclass.getSimpleName() +" where "+param0+" = ?";
		query = session.createQuery(sql);
		query.setParameter(0, param1);
		list = query.list();
		session.getTransaction().commit();
		}catch (Exception e) {
			// TODO: handle exception
		}finally{
             session.close();				
		}
		return list;
	}

	public <T> T findId(Class<T> entityclass, Integer id) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		@SuppressWarnings("unchecked")
		T t = (T) session.get(entityclass, id);
		
		session.getTransaction().commit();
		
		session.close();
		
		
		return t;
	}

	public List<TCS> Count(String tenum, int page, int rows) {
		// TODO Auto-generated method stub
		List<TCS> ll = new ArrayList<TCS>();
		TCS tcs = null;
		String str = " from Course c where c.teacher.tenum = ?";
		@SuppressWarnings("unchecked")
		List<Course> list = this.getHibernateTemplate().find(str,tenum);
		if(!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				tcs = new TCS();
				String cno = list.get(i).getCno();
				String sql = "SELECT COUNT(*) FROM SelectCourse sc where  sc.id.course.cno = ?";
				
				Session session = this.getHibernateTemplate().getSessionFactory()
						.openSession();
				session.beginTransaction();
				Query query = session.createQuery(sql).setParameter(0, cno);
				query.setFirstResult((page - 1) * rows); 	 
			    query.setMaxResults(rows); 
			   
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
			    session.getTransaction().commit();
			    session.close();
			}
			
			System.gc();
			 return ll;	
		}else{
			System.gc();
			return null;
		}

	}

	public Long TotalCount(String tenum) {
		// TODO Auto-generated method stub
		List<TCS> ll = new ArrayList<TCS>();
		TCS tcs = null;
		String str = " from Course c where c.teacher.tenum = ?";
		@SuppressWarnings("unchecked")
		List<Course> list = this.getHibernateTemplate().find(str,tenum);
		if(!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				tcs = new TCS();
				String cno = list.get(i).getCno();
				String sql = "SELECT COUNT(*) FROM SelectCourse sc where  sc.id.course.cno = ?";
				
				Session session = this.getHibernateTemplate().getSessionFactory()
						.openSession();
				session.beginTransaction();
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
			    session.getTransaction().commit();
			    session.close();
			}
			System.gc();
			 return (long) ll.size();	
		}else{
			System.gc();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public List<SelectCourse> SInfo(String tenum, String cno) {
		// TODO Auto-generated method stub
		 String str = " from SelectCourse sc where sc.id.course.teacher.tenum = ? and sc.id.course.cno = ?";
	    return this.getHibernateTemplate().find(str,new String[] {tenum,cno});
	}

	public <T> List<T> getResultData(Class<T> entityclass, Object param0,
			Object param1, int page, int rows) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName()+" where "+param0+" = ?";
		SessionFactory sessionFactory = this.getHibernateTemplate().getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery(str);
		query.setParameter(0, param1);
		query.setFirstResult((page - 1) * rows); 	 
	    query.setMaxResults(rows); 
	    query.setCacheable(true);
	    @SuppressWarnings("unchecked")
		List<T> t = query.list();
	    session.getTransaction().commit();
		session.close();
		return t ;
	}

	public <T> Long TotalResultData(Class<T> entityclass, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName()+" where "+param0+" = ?";
		SessionFactory sessionFactory = this.getHibernateTemplate().getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery(str);
		query.setParameter(0, param1);
	    @SuppressWarnings("unchecked")
		List<T> t = query.list();
	    session.getTransaction().commit();
		session.close();
		return (long) t.size() ;
	}


	@SuppressWarnings("unchecked")
	public <T> List<T> getGDTwoParam(Class<T> entitycalss, Object param0,
			Object param1) {
		// TODO Auto-generated method stub
		String str = " from "+entitycalss.getSimpleName()+" where "+param0 +" = ?";
		SessionFactory sf = this.getHibernateTemplate().getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		query.setParameter(0, param1);
		List<T> t = query.list();
		s.getTransaction().commit();
		s.close();
		return t;
	}


	public <T> List<T> getResultTJ(Class<T> entityclass, Object param0,
			Object param1, Object param2) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName()+" where "+param0 +" between "+param1+" and "+param2;
		SessionFactory sf = this.getHibernateTemplate().getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		List<T> t = query.list();
		s.getTransaction().commit();
		s.close();
		return t;
	}

	public <T> List<T> getByMoreParams(Class<T> entityclass, int page,
			int rows, String... strings) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = this.getHibernateTemplate().getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String str = " from "+entityclass.getSimpleName() + " where 1=1";
			if(strings[1]!=null||strings[1]!=""){
				str = str + " and "+strings[0] +" like '%"+strings[1]+"%'";
				 System.out.println(str);
			}if(strings[3]!=null||strings[3]!=""){
				str = str + " and "+strings[2] +" like '%"+strings[3]+"%'";
				 System.out.println(str);
			}if(strings[5]!=null||strings[5]!=""){
				str = str + " and "+strings[4] +" like '%"+strings[5]+"%'";
				 System.out.println(str); 
			}
		
			Query query = session.createQuery(str);
			query.setFirstResult((page - 1) * rows); 	 
		    query.setMaxResults(rows); 
			List<T> t = query.list();
		    session.getTransaction().commit();
			session.close();
			return t ;
	}

	@SuppressWarnings("unchecked")
	public <T> Long TotalByMoreParams(Class<T> entityclass, String... strings) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = this.getHibernateTemplate().getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		String str = " from "+entityclass.getSimpleName() + " where 1=1";
			if(strings[1]!=null||strings[1]!=""){
				str = str + " and "+strings[0] +" like '%"+strings[1]+"%'";
			    System.out.println(str);
			}if(strings[3]!=null||strings[3]!=""){
				str = str + " and "+strings[2] +" like '%"+strings[3]+"%'";
			    System.out.println(str);
			}if(strings[5]!=null||strings[5]!=""){
				str = str + " and "+strings[4] +" like '%"+strings[5]+"%'";
			    System.out.println(str);
			}
		
			Query query = session.createQuery(str);
			List<T> t = query.list();
		    session.getTransaction().commit();
			session.close();
			return (long) t.size() ;
	}

	/**
	 * 成绩排名
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> SortResultByCourse(String cno) {
		// TODO Auto-generated method stub
		String sql = "from SelectCourse where id.course.cno = ? order by result desc";
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query sq = s.createQuery(sql);
		sq.setParameter(0, cno);
		List<T> list = sq.list();
		s.getTransaction().commit();
		s.close();
		return list;
	}



	@SuppressWarnings("unchecked")
	public <T> List<T> SortResultByStuclass(String stuclass,String cno) {
		// TODO Auto-generated method stub
		String sql = "from SelectCourse where id.student.stuclass = ? and id.course.cno = ? order by result desc";
		System.out.println(sql);
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query sq = s.createQuery(sql);
		sq.setParameter(0, stuclass);
		sq.setParameter(1, cno);
		List<T> list = sq.list();
		s.getTransaction().commit();
		s.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> getUserIpByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, int page, int rows) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		query.setFirstResult((page-1)*rows);
		query.setMaxResults(rows);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return list;
	}

	@SuppressWarnings("unchecked")
	public <T> Long TotalUserIpByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return (long) list.size();
	}

	public <T> List<T> getUserLogByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6,
			int page, int rows) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}if(!"".equals(obj6)||obj6!=null){
			str = str + " and "+obj5+" like '%"+obj6+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		query.setFirstResult((page-1)*rows);
		query.setMaxResults(rows);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return list;
	}

	public <T> Long TotalUserLogByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}if(!"".equals(obj6)||obj6!=null){
			str = str + " and "+obj5+" like '%"+obj6+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return (long) list.size();
	}

	public <T> List<T> getEntityByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6,
			int page, int rows) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}if(!"".equals(obj6)||obj6!=null){
			str = str + " and "+obj5+" like '%"+obj6+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		query.setFirstResult((page-1)*rows);
		query.setMaxResults(rows);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return list;
	}

	public <T> Long TotalEntityByParam(Class<T> entityclass, Object obj1,
			Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
		// TODO Auto-generated method stub
		String str = " from "+entityclass.getSimpleName() +" where 1=1 ";
		if(!"".equals(obj2)||obj2!=null){
			str = str + " and "+obj1+" like '%"+obj2+"%'";
		}if(!"".equals(obj4)||obj4!=null){
			str = str + " and "+obj3 + " like '%"+obj4+"%'";
		}if(!"".equals(obj6)||obj6!=null){
			str = str + " and "+obj5+" like '%"+obj6+"%'";
		}
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
		Query query = s.createQuery(str);
		List<T> list = query.list();
		s.getTransaction().commit();
		s.close();
		return (long) list.size();
	}

	public <T> String getMaxNum(String str,String str1) {
		// TODO Auto-generated method stub
		String sql = " select Max("+str+") from "+str1;
		String ss = "";
		SessionFactory sf = getSessionFactory();
		Session s = sf.openSession();
		s.beginTransaction();
	    ss =s.createQuery(sql).uniqueResult().toString();
		s.getTransaction().commit();
		s.close();
		return ss;
	}

}
