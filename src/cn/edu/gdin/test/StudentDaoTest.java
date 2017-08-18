package cn.edu.gdin.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.gdin.Adao.AdminCommonDao;
import cn.edu.gdin.dao.StudentDao;
import cn.edu.gdin.entity.Student;

public class StudentDaoTest {

	@Test
	public void testStu(){
		
		StudentDao sd = new StudentDao();
		Student student = new Student("s0001","fjsl","Ů","kdf","fsf","adfd","dfsf","dfdf");
		
		sd.updateStuInfo(student);
	}
	
	@Test
	public void testSSH(){
		 ClassPathXmlApplicationContext context = 
				 new ClassPathXmlApplicationContext(
						 "applicationContext.xml");  
	     context.start();  
	     AdminCommonDao ad = (AdminCommonDao) 
	    		 context.getBean("adminCommonDao");  
	     System.out.println(ad);
	}
}
