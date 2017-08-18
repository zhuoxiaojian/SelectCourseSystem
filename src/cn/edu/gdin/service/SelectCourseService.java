package cn.edu.gdin.service;

import cn.edu.gdin.dao.SelectCourseDao;
import cn.edu.gdin.entity.SelectCourse;

public class SelectCourseService {
	private SelectCourseDao selectCourseDao;
	public void setSelectCourseDao(SelectCourseDao selectCourseDao) {
		this.selectCourseDao = selectCourseDao;
	}
	
	public void select_cour(SelectCourse sc){
		this.selectCourseDao.sele_cour(sc);
	}
	
	public void sele_cour(String stunum,String cno){
		this.selectCourseDao.sele_cour(stunum, cno);
	}
	
	
	public int select_cno(String cno,String stunum){
		return this.selectCourseDao.sele_cno(cno,stunum);
	}
	public <T> void addLog(T entity){
		this.selectCourseDao.addLog(entity);
	}
}
