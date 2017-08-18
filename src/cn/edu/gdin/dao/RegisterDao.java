package cn.edu.gdin.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.edu.gdin.entity.IpCount;
import cn.edu.gdin.entity.Register;

public class RegisterDao extends HibernateDaoSupport{

	public Register register(Register register){
		String str = " from Register where username = ? and password = ?";
		@SuppressWarnings("unchecked")
		List<Register> list = this.getHibernateTemplate().find(str,new String[] {register.getUsername(),register.getPassword()});
		if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}		
	}
	
	public Register FindPwd(String username){
	    String str = " from Register where username = ?";
	    List<Register> list = this.getHibernateTemplate().find(str, username);
	    if(list.isEmpty()){
			return null;
		}else{
			return list.get(0);
		}		
	}
	
	public void UdpatePwd(Register register){
		this.getHibernateTemplate().saveOrUpdate(register);
	}
	public void savorupda(IpCount ipCount){
		this.getHibernateTemplate().saveOrUpdate(ipCount);
	}
	public <T> void addLog(T entity){
		this.getHibernateTemplate().saveOrUpdate(entity);
	}
}
