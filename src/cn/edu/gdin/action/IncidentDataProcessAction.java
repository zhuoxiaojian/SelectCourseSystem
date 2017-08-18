package cn.edu.gdin.action;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.Course;
import cn.edu.gdin.entity.Teacher;
import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.CourseService;
import cn.edu.gdin.service.IncidentDataProcessService;
import cn.edu.gdin.service.TCSCountService;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;
import cn.edu.gdin.util.Struts2Utils;

public class IncidentDataProcessAction {
    public static final Logger logger = Logger.getLogger(IncidentDataProcessAction.class);
	private Map<String, Object> result = new HashMap<String, Object>(); 
	private String page;
	private String rows;

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	private IncidentDataProcessService incidentDataProcessService;

	public IncidentDataProcessService getIncidentDataProcessService() {
		return incidentDataProcessService;
	}

	public void setIncidentDataProcessService(
			IncidentDataProcessService incidentDataProcessService) {
		this.incidentDataProcessService = incidentDataProcessService;
	}     	

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	public String getIncidentData() {
		// JSONObject jsonObject = new JSONObject();
		String str = (String) ActionContext.getContext().getSession().get("username");
		
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		
		Long total=incidentDataProcessService.getTotal(str);
		@SuppressWarnings("unchecked")
		List<Course> list = incidentDataProcessService.getIncidentData(intPage, intRows, str);				

        result.put("total", total);//
        result.put("rows", list);//
      
		return "JSONRESULT";
	}
	public String getMaxNum(){
        String obj = incidentDataProcessService.getMaxNum("cno", "Course");
        result.put("MaxNum", obj);
		return "JSONRESULT";
	}
	public String deleteMethod(){
		String id =Struts2Utils.getHttpServletRequest().getParameter("cno");		
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		List<TCS> list1 = this.tCSCountService.stu_count(tenum);
		for(int i = 0;i<list1.size();i++){
			if(list1.get(i).getStucount()==0&&id.equals(list1.get(i).getCno())){
			       incidentDataProcessService.deleteData(id);
			       result.put("success",true);
			       UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "课程删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			       this.incidentDataProcessService.addLog(ul);
			       logger.info(Goals.getAName()+":课程删除成功");
			}else{
				   /*UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "课程删除失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			       this.incidentDataProcessService.addLog(ul);*/
				result.put("success",false);	
			}
		}
		return "JSONRESULT";
	}
	
	public String addMethod() throws ParseException{
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");	
		String cname = Struts2Utils.getHttpServletRequest().getParameter("cname");	
		String ctype = Struts2Utils.getHttpServletRequest().getParameter("ctype");	
		//String cteacher = Struts2Utils.getHttpServletRequest().getParameter("cteacher");	
		String ctime = Struts2Utils.getHttpServletRequest().getParameter("ctime");	
		String cplace = Struts2Utils.getHttpServletRequest().getParameter("cplace");	
		String chours = Struts2Utils.getHttpServletRequest().getParameter("chours");	
		String ccredit = Struts2Utils.getHttpServletRequest().getParameter("ccredit");		
		Course course=new Course();
		course.setCno(cno);
		course.setCname(cname);
		course.setCtype(ctype);
		Teacher teacher = new Teacher();
		teacher.setTenum(tenum);
		course.setTeacher(teacher);
		course.setCtime(ctime);
		course.setCplace(cplace);
		course.setChours(chours);
		course.setCcredit(ccredit);
		Course c = courseService.findCno(cno);
		if(c!=null){
			  UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "课程添加失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		      this.incidentDataProcessService.addLog(ul);
		      logger.info(Goals.getAName()+":课程添加失败");
			 result.put("fail",true);
		  }else{
		    incidentDataProcessService.addData(course);
		    UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "课程添加成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		      this.incidentDataProcessService.addLog(ul);
		      logger.info(Goals.getAName()+":课程添加成功");
		   result.put("success",true);
		  }
		
		return "JSONRESULT";
	}
	
	public String editMethod() throws ParseException{
		String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");	
		String cname = Struts2Utils.getHttpServletRequest().getParameter("cname");	
		String ctype = Struts2Utils.getHttpServletRequest().getParameter("ctype");	
		String cteacher = Struts2Utils.getHttpServletRequest().getParameter("cteacher");	
		String ctime = Struts2Utils.getHttpServletRequest().getParameter("ctime");	
		String cplace = Struts2Utils.getHttpServletRequest().getParameter("cplace");	
		String chours = Struts2Utils.getHttpServletRequest().getParameter("chours");	
		String ccredit = Struts2Utils.getHttpServletRequest().getParameter("ccredit");		
		Course course=new Course();
		course.setCno(cno);
		course.setCname(cname);
		course.setCtype(ctype);
		Teacher teacher = new Teacher();
		teacher.setTenum(cteacher);
		course.setTeacher(teacher);
		course.setCtime(ctime);
		course.setCplace(cplace);
		course.setChours(chours);
		course.setCcredit(ccredit);
		incidentDataProcessService.editData(course);
		 UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "课程编辑成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
	     this.incidentDataProcessService.addLog(ul);
	     logger.info(Goals.getAName()+":课程编辑成功");
		result.put("success",true);
		return "JSONRESULT";
	}

	
	private TCSCountService tCSCountService;

  public void settCSCountService(TCSCountService tCSCountService) {
	this.tCSCountService = tCSCountService;
}
  private CourseService courseService;
  public void setCourseService(CourseService courseService) {
	this.courseService = courseService;
}
}
