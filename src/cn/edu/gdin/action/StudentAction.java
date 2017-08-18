package cn.edu.gdin.action;

import java.util.Date;

import org.apache.log4j.Logger;

import cn.edu.gdin.entity.Student;
import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.StudentService;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class StudentAction extends ActionSupport{
	private static final Logger logger = Logger.getLogger(StudentAction.class);
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	private Student stu;
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public Student getStu() {
		return stu;
	}
	
	
	public String findStu(){
		try{
		String str = (String) ActionContext.getContext().getSession().get("username");
		Student stu = studentService.findInfo(str);
		
		if(stu!=null){
			ActionContext.getContext().getSession().put("stu", stu);
			return SUCCESS;
			
		}
		}catch (Exception e) {
			// TODO: handle exception
			return ERROR;
		}
		return ERROR;
		
	}
	
	public String modifyStu(){
		try{
		    Student student = new Student();
		    student = stu;
		if(this.studentService.modifyStuInfo(student)){
			ActionContext.getContext().getSession().put("message", "修改成功啊");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "个人信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		    this.studentService.addLog(ul);
		    logger.info(Goals.getAName()+":个人信息修改成功");
			return SUCCESS;
		}else{
			ActionContext.getContext().getSession().put("message", "修改失败啊");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "个人信息修改失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		    this.studentService.addLog(ul);
		    logger.info(Goals.getAName()+":个人信息修改失败");
			return ERROR;
		}
		
		}catch (Exception e) {
			// TODO: handle exception
			ActionContext.getContext().getSession().put("message", "修改失败啊");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "个人信息修改失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		    this.studentService.addLog(ul);
		    logger.error(Goals.getExceptionMessage(e));
			return ERROR;
		}
	}
}
