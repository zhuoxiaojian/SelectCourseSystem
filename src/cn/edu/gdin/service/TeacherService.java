package cn.edu.gdin.service;

import java.util.List;

import cn.edu.gdin.dao.TeacherDao;
import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.entity.Teacher;

public class TeacherService {

	private TeacherDao teacherDao;
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}
	
	public Teacher Teac_info(String tenum){
		return this.teacherDao.Tea_info(tenum);
	}
	
	
	public void update_tea(Teacher teacher){
		this.teacherDao.Update_TeaInfo(teacher);
	}
	
	/*老师查看选了他的课的学生信息*/
	public List<SelectCourse> Find_Sele_StuI(String tenum){
		return this.teacherDao.Find_Sele_Stu(tenum);
	}
	public <T> void addLog(T entity){
		this.teacherDao.addLog(entity);
	}
}
