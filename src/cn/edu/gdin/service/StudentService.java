package cn.edu.gdin.service;

import cn.edu.gdin.dao.StudentDao;
import cn.edu.gdin.entity.Student;

public class StudentService {
	private StudentDao studentDao;
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Student findInfo(Object values){
		return studentDao.find(values);
	}
	
	public boolean modifyStuInfo(Student student){
	  return this.studentDao.updateStuInfo(student);
	
	}

	public <T> void addLog(T entity){
		this.studentDao.addLog(entity);
	}
}
