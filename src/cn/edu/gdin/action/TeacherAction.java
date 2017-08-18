package cn.edu.gdin.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edu.gdin.entity.Teacher;
import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.TeacherService;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherAction extends ActionSupport{
	private static final Logger logger = Logger.getLogger(TeacherAction.class);
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	
	private Teacher teacher;
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	private Map<String, Object> result = new HashMap<String, Object>();

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	} 
	/*课程中查看老师的信息*/
	public String Teach_info(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String tenum = request.getParameter("tenum");
		Teacher teacher = this.teacherService.Teac_info(tenum);
		if(teacher!=null){
			/*ActionContext.getContext().getSession().put("teacher", teacher);
		   return SUCCESS;*/
			result.put("success", true);
			result.put("teacher",teacher);
			return "JSONRESULT";
		}else{
			/*return INPUT;*/
			result.put("success", false);
			return "JSONRESULT";
		}
	}
	
	public String Tea_Info(){
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		Teacher teacher1 = this.teacherService.Teac_info(tenum);
		if(teacher1!=null){
			ActionContext.getContext().getSession().put("teacher", teacher1);
		return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	
	public String Up_TeIn(){
		if(teacher!=null){
		   this.teacherService.update_tea(teacher);
		   UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "个人信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		    this.teacherService.addLog(ul);
		    logger.info(Goals.getAName()+":个人信息修改成功");
		   return SUCCESS;
		}else{
			 UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "个人信息修改失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			    this.teacherService.addLog(ul);
			    logger.info(Goals.getAName()+":个人信息修改失败");
			return INPUT;
		}
	}
	
	/*老师查看选了他的课的学生信息*/
	public String Find_Sele_StuIn(){
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		lfss = this.teacherService.Find_Sele_StuI(tenum);
		if(lfss!=null){
		return SUCCESS;
		}else{
			return INPUT;
		}
		
	}
	
	private List lfss;
	public void setLfss(List lfss) {
		this.lfss = lfss;
	}
	public List getLfss() {
		return lfss;
	}
}
