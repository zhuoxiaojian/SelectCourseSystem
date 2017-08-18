package cn.edu.gdin.Aaction;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.gdin.Aservice.AdminCommonService;
import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.Course;
import cn.edu.gdin.entity.IpCount;
import cn.edu.gdin.entity.Register;
import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.entity.SelectCourseId;
import cn.edu.gdin.entity.Student;
import cn.edu.gdin.entity.Teacher;
import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.CourseService;
import cn.edu.gdin.util.ExcelUtil;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;
import cn.edu.gdin.util.MD5Utils;
import cn.edu.gdin.util.Struts2Utils;

public class AdminCommonAction {
    public static final Logger logger = Logger.getLogger(AdminCommonAction.class);
	private Map<String, Object> result = new HashMap<String, Object>(); 
	private String page;
	private String rows;
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}
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
	
	private AdminCommonService adminCommonService;
	public void setAdminCommonService(AdminCommonService adminCommonService) {
		this.adminCommonService = adminCommonService;
	}
	
	
	
	
	
	/**学生信息管理**/
	public String getStudentData() {
		// JSONObject jsonObject = new JSONObject();
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		Long total=adminCommonService.getTotal(Student.class);
		List<Student> list = adminCommonService.getIncidentData(Student.class,intPage, intRows);				
        result.put("total", total);//
        result.put("rows", list);//
        System.gc();
		return "JSONRESULT";
	}
	
	
	public String addstuMethod() throws Exception{
		String stunum = Struts2Utils.getHttpServletRequest().getParameter("stunum");
		String stuname = Struts2Utils.getHttpServletRequest().getParameter("stuname");	
		String stusex = Struts2Utils.getHttpServletRequest().getParameter("stusex");	
		String stubirth = Struts2Utils.getHttpServletRequest().getParameter("stubirth");	
		String stuadim = Struts2Utils.getHttpServletRequest().getParameter("stuadim");	
		String stumajor = Struts2Utils.getHttpServletRequest().getParameter("stumajor");	
		String stuclass = Struts2Utils.getHttpServletRequest().getParameter("stuclass");	
		String stucollege = Struts2Utils.getHttpServletRequest().getParameter("stucollege");	
		Student student = new Student();
		student.setStunum(stunum);
		student.setStuname(stuname);
		student.setStusex(stusex);
		student.setStubirth(stubirth);
		student.setStuadim(stuadim);
		student.setStumajor(stumajor);
		student.setStuclass(stuclass);
		student.setStucollege(stucollege);
		this.adminCommonService.sava(student);
		result.put("success",true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "学生信息添加成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		 this.adminCommonService.sava(ul);
		 logger.info(Goals.getAName()+"学生信息添加成功");
		 System.gc();
		return "JSONRESULT";
		
	}
	
	public String editstuMethod() throws Exception{
		String stunum = Struts2Utils.getHttpServletRequest().getParameter("stunum");
		String stuname = Struts2Utils.getHttpServletRequest().getParameter("stuname");	
		String stusex = Struts2Utils.getHttpServletRequest().getParameter("stusex");	
		String stubirth = Struts2Utils.getHttpServletRequest().getParameter("stubirth");	
		String stuadim = Struts2Utils.getHttpServletRequest().getParameter("stuadim");	
		String stumajor = Struts2Utils.getHttpServletRequest().getParameter("stumajor");	
		String stuclass = Struts2Utils.getHttpServletRequest().getParameter("stuclass");	
		String stucollege = Struts2Utils.getHttpServletRequest().getParameter("stucollege");	
		Student student = new Student();
		student.setStunum(stunum);
		student.setStuname(stuname);
		student.setStusex(stusex);
		student.setStubirth(stubirth);
		student.setStuadim(stuadim);
		student.setStumajor(stumajor);
		student.setStuclass(stuclass);
		student.setStucollege(stucollege);
		this.adminCommonService.update(student);
		result.put("success",true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "学生信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		 this.adminCommonService.sava(ul);
		 logger.info(Goals.getAName()+"学生信息修改成功");
		 System.gc();
		return "JSONRESULT";
		
	}
	
	public String deletestuMethod() throws Exception{
		String id =Struts2Utils.getHttpServletRequest().getParameter("stunum");
		Student student = this.adminCommonService.findById(Student.class, id);
		this.adminCommonService.remove(student);
		result.put("success",true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "学生信息删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		 this.adminCommonService.sava(ul);
		 logger.info(Goals.getAName()+" 学生信息删除成功");
		 System.gc();
		return "JSONRESULT";
	}
	
	public void StudentExportExcel(){
		 /**测试**/
		HttpServletResponse response = null;//创建一个HttpServletResponse对象 
		OutputStream out = null;//创建一个输出流对象 
        ExcelUtil ex = new ExcelUtil();
        String title = "学生信息记录"; 
        String[] headers = { "学生编号","学生姓名","学生性别","出生日期","入学日期","专业","班级","院系"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        List<Student> list = adminCommonService.findAll(Student.class);				
        for(int i=0;i<list.size();i++) {
        	Student student = list.get(i); 
        	dataset.add(new String[]{student.getStunum(),student.getStuname(),student.getStusex(),
        			student.getStubirth(),student.getStuadim(),student.getStumajor(),student.getStuclass(),student.getStucollege()});
        }
		try { 
			response = ServletActionContext.getResponse();//初始化HttpServletResponse对象 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"student.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = ServletActionContext.getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,title,headers, dataset, out);
			    	out.flush();
		    UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "学生信息导出成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);	
			logger.info(Goals.getAName()+" 学生信息导出成功");
		} catch (IOException e) { 
			e.printStackTrace(); 
			 UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "学生信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "学生信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);
				logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
			} 
		}
	}
	
	public void CourseExportExcel(){
		 /**测试**/
		HttpServletResponse response = null;//创建一个HttpServletResponse对象 
		OutputStream out = null;//创建一个输出流对象 
        ExcelUtil ex = new ExcelUtil();
        String title = "course信息记录"; 
        String[] headers = { "课程编号","课程名称","课程类型","授课老师","上课地点","上课时间","学时","学分"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        List<Course> list = adminCommonService.findAll(Course.class);				
        for(int i=0;i<list.size();i++) {
        	Course course = list.get(i); 
        	dataset.add(new String[]{course.getCno(),course.getCname(),course.getCtype(),
        			course.getTeacher().getTenum(),course.getCplace(),course.getCtime(),course.getChours(),course.getCcredit()});
        }
		try { 
			response = ServletActionContext.getResponse();//初始化HttpServletResponse对象 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"course.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = ServletActionContext.getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,title,headers, dataset, out);
			    	out.flush();
		    UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "课程信息导出成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+" 课程信息导出成功");
		} catch (IOException e) { 
			e.printStackTrace(); 
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "课程信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);	
			logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "课程信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);	
				logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
			} 
		}
	}
	
	/**选课信息导出**/
	public void SCInfoExportExcel(){
		 /**测试**/
		HttpServletResponse response = null;//创建一个HttpServletResponse对象 
		OutputStream out = null;//创建一个输出流对象 
       ExcelUtil ex = new ExcelUtil();
       String title = "选课信息"; 
       String[] headers = { "学生编号","学生姓名","所在班级","课程编号","课程名称","课程成绩"};
       List<String[]> dataset = new ArrayList<String[]>(); 
       List<SelectCourse> list = adminCommonService.findAll(SelectCourse.class);				
       for(int i=0;i<list.size();i++) {
    	   SelectCourse selectCourse = list.get(i); 
       	dataset.add(new String[]{selectCourse.getId().getStudent().getStunum(),selectCourse.getId().getStudent().getStuname(),selectCourse.getId().getStudent().getStuclass(),
       			selectCourse.getId().getCourse().getCno(),selectCourse.getId().getCourse().getCname(),String.valueOf(selectCourse.getResult())});
       }
		try { 
			response = ServletActionContext.getResponse();//初始化HttpServletResponse对象 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"selectCourse.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = ServletActionContext.getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,title,headers, dataset, out);
			    	out.flush();
			    	UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "选课信息导出成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
					this.adminCommonService.sava(ul);
					logger.info(Goals.getAName()+":"+"选课信息导出成功");
		} catch (IOException e) { 
			e.printStackTrace(); 
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "选课信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);	
			logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
		}finally{
			try{
				if(out!=null){ 
			
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "选课信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);
				logger.error(Goals.getAName()+":"+Goals.getExceptionMessage(e));
			} 
		}
	}
	
	
	
	
	
	
	/**课程信息管理**/
	public String getCourseData() {
		
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		
		Long total=adminCommonService.getTotal(Course.class);
		List<Course> list = adminCommonService.getIncidentData(Course.class,intPage, intRows);				
      
		result.put("total", total);//
        result.put("rows", list);//
        System.gc();
		 return "JSONRESULT";
		
        
		
		
	}
	
	public String deletecourseMethod(){
		String id =Struts2Utils.getHttpServletRequest().getParameter("cno");		
		Course course = this.adminCommonService.findById(Course.class, id);
		this.adminCommonService.remove(course);
		result.put("success",true);	
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "课程信息删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"课程信息删除成功");
		 System.gc();
     	return "JSONRESULT";
	}
	
	public String addcourseMethod() throws ParseException{
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
		Course c = courseService.findCno(cno);
		Teacher tea = this.adminCommonService.findById(Teacher.class, cteacher);
		if(c!=null){
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "课程信息添加失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"课程信息添加失败");
		result.put("fail",true);
		}else{
			
			if(tea!=null){
				this.adminCommonService.sava(course);
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "课程信息添加成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);	
				logger.info(Goals.getAName()+":"+"课程信息添加成功");
				result.put("success",true);
			}else{
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "课程信息添加失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);	
				logger.info(Goals.getAName()+":"+"课程信息添加失败");
				result.put("success",false);
				
			}
			
		}
		 System.gc();
		return "JSONRESULT";
	}
	
	public String editcourseMethod() throws ParseException{
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
		
		Teacher tea = this.adminCommonService.findById(Teacher.class, cteacher);
		if(tea!=null){
			this.adminCommonService.update(course);
			result.put("success",true);
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "课程信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);	
			logger.info(Goals.getAName()+":"+"课程信息编辑成功");
			 System.gc();
			return "JSONRESULT";
		}else{
			result.put("success",false);
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "课程信息修改失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"课程信息编辑失败");
			 System.gc();
			return "JSONRESULT";
		}
		
		
		
	}

	/*选课管理*/
	public String getSelectedCourseData(){
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		Long total=adminCommonService.getTotal(SelectCourse.class);
		List<SelectCourse> list = adminCommonService.getIncidentData(SelectCourse.class,intPage, intRows);				
		result.put("total", total);//
        result.put("rows", list);//
        System.gc();
		 return "JSONRESULT";

	}
	
	
	public String deletescMethod() throws Exception{
		
		String id2 =Struts2Utils.getHttpServletRequest().getParameter("stunum");
		String id1 =Struts2Utils.getHttpServletRequest().getParameter("cno");
		
		SelectCourse selectCourse = this.adminCommonService.findByTwoId(id1,id2);
		this.adminCommonService.remove(selectCourse);
		
		result.put("success",true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "选课信息删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"选课信息删除成功");
		 System.gc();
		return "JSONRESULT";
	}
	
	public String editscMethod() throws Exception{
		String id2 =Struts2Utils.getHttpServletRequest().getParameter("stunum");
		String id1 =Struts2Utils.getHttpServletRequest().getParameter("cno");
		String chengji =Struts2Utils.getHttpServletRequest().getParameter("result");
		SelectCourse selectCourse = this.adminCommonService.findByTwoId(id1,id2);
		selectCourse.setResult(Integer.parseInt(chengji));
		Student student = this.adminCommonService.findById(Student.class, id2);
		Course course = this.adminCommonService.findById(Course.class, id1);
		SelectCourseId selectCourseId = new SelectCourseId();
		selectCourseId.setStudent(student);
		selectCourseId.setCourse(course);
		selectCourse.setId(selectCourseId);
		this.adminCommonService.update(selectCourse);
		result.put("success", true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "选课信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"选课信息编辑成功");
		 System.gc();
		return "JSONRESULT";
		
	}
	
	
	/**教师信息管理**/
	public String getTeacherData() {
		// JSONObject jsonObject = new JSONObject();
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		Long total=adminCommonService.getTotal(Teacher.class);
		List<Teacher> list = adminCommonService.getIncidentData(Teacher.class,intPage, intRows);				

        result.put("total", total);//
        result.put("rows", list);//
        System.gc();
		return "JSONRESULT";
	}
	
	public String addteMethod(){
		String tenum = Struts2Utils.getHttpServletRequest().getParameter("tenum");
		String tename = Struts2Utils.getHttpServletRequest().getParameter("tename");
		String tesex = Struts2Utils.getHttpServletRequest().getParameter("tesex");
		String tetitle = Struts2Utils.getHttpServletRequest().getParameter("tetitle");
		String temajor = Struts2Utils.getHttpServletRequest().getParameter("temajor");
		Teacher teacher = new Teacher();
		teacher.setTenum(tenum);
		teacher.setTename(tename);
		teacher.setTetitle(tetitle);
		teacher.setTesex(tesex);
		teacher.setTemajor(temajor);
		Teacher te = this.adminCommonService.findById(Teacher.class, tenum);
		if(te!=null){
			result.put("fail", true);
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "教师信息添加失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"教师信息添加失败");
			 System.gc();
			return "JSONRESULT";
		}else{
			this.adminCommonService.sava(teacher);
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "教师信息添加成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"教师信息添加成功");
			result.put("success", true);
			 System.gc();
			return "JSONRESULT";
		}
	}
	
	public String deleteteMethod(){
		String tenum = Struts2Utils.getHttpServletRequest().getParameter("tenum");
		Teacher teacher = this.adminCommonService.findById(Teacher.class, tenum);
		this.adminCommonService.remove(teacher);
		result.put("success", true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "教师信息删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"教师信息删除成功");
		 System.gc();
		return "JSONRESULT";
	}
	
	public String editteMethod(){
		String tenum = Struts2Utils.getHttpServletRequest().getParameter("tenum");
		String tename = Struts2Utils.getHttpServletRequest().getParameter("tename");
		String tesex = Struts2Utils.getHttpServletRequest().getParameter("tesex");
		String tetitle = Struts2Utils.getHttpServletRequest().getParameter("tetitle");
		String temajor = Struts2Utils.getHttpServletRequest().getParameter("temajor");
		Teacher teacher = new Teacher();
		teacher.setTenum(tenum);
		teacher.setTename(tename);
		teacher.setTetitle(tetitle);
		teacher.setTesex(tesex);
		teacher.setTemajor(temajor);
		this.adminCommonService.update(teacher);
		result.put("success", true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "教师信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"教师信息修改成功");
		 System.gc();
		return "JSONRESULT";
	}
	
	/**教师信息导出**/
	public void TeacherExportExcel(){
		 /**测试**/
		HttpServletResponse response = null;//创建一个HttpServletResponse对象 
		OutputStream out = null;//创建一个输出流对象 
       ExcelUtil ex = new ExcelUtil();
       String title = "教师信息"; 
       String[] headers = { "教师编号","教师姓名","教师性别","教师职称","教师专业"};
       List<String[]> dataset = new ArrayList<String[]>(); 
       List<Teacher> list = adminCommonService.findAll(Teacher.class);				
       for(int i=0;i<list.size();i++) {
    	   Teacher teacher = list.get(i); 
       	dataset.add(new String[]{teacher.getTenum(),teacher.getTename(),teacher.getTesex(),teacher.getTetitle(),teacher.getTemajor()});
       }
		try { 
			response = ServletActionContext.getResponse();//初始化HttpServletResponse对象 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"teacher.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = ServletActionContext.getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,title,headers, dataset, out);
			    	out.flush();
			    	UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "教师信息导出成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
					this.adminCommonService.sava(ul);	
					logger.info(Goals.getAName()+":"+"教师信息导出成功");
		} catch (IOException e) { 
			e.printStackTrace(); 
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "教师信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.error(Goals.getAName()+":"+"教师信息导出失败"+Goals.getExceptionMessage(e));
		}finally{
			try{
				if(out!=null){ 
			
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXPORT, "教师信息导出失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);
				logger.error(Goals.getAName()+":"+"教师信息导出失败"+Goals.getExceptionMessage(e));
			} 
		}
	}
	
	public String getColumnName(){
		
		String entity = Struts2Utils.getHttpServletRequest().getParameter("entity");
		Object[] object = null;
		if(entity.equals("Student")){
		 object = this.adminCommonService.getColumnName(Student.class);
		}if(entity.equals("Course")){
			 object = this.adminCommonService.getColumnName(Course.class);
			}if(entity.equals("Teacher")){
				object = this.adminCommonService.getColumnName(Teacher.class);
			}
		if(entity.equals("SelectCourse")){
				 object = this.adminCommonService.getColumnName(SelectCourse.class);
			}
		
		
		result.put("success", true);
		result.put("string", object);
		 System.gc();
		return "JSONRESULT";
	}
	
	/**
	 * 混合查询
	 * @throws org.json.JSONException 
	 */
	public String getObjData() throws org.json.JSONException{
		
		String entity = Struts2Utils.getHttpServletRequest().getParameter("entity");
		String cols = Struts2Utils.getHttpServletRequest().getParameter("cols");
		String condition = Struts2Utils.getHttpServletRequest().getParameter("condition");
	    
	    
		if("Student".equals(entity)){
			Long total=adminCommonService.getByParamTotal(Student.class, cols,condition);
		   List<Student> list = this.adminCommonService.getByParamData(Student.class, cols,condition);
		   result.put("total", total);//
	        result.put("rows", list);//
	        result.put("success", true);
	        System.gc();
	     	return "JSONRESULT";
		  
		}if("Course".equals(entity)){
			Long total = this.adminCommonService.getByParamTotal(Course.class, cols,condition);
			List<Course> list = this.adminCommonService.getByParamData(Course.class,cols,condition);
			result.put("total", total);//
	        result.put("rows", list);//
	        result.put("success", true);
	        System.gc();
			return "JSONRESULT";
		}if("Teacher".equals(entity)){
			Long total = this.adminCommonService.getByParamTotal(Teacher.class, cols, condition);
			List<Teacher> list = this.adminCommonService.getByParamData(Teacher.class, cols, condition);
			result.put("total", total);//
	        result.put("rows", list);//
	        result.put("success", true);
	        System.gc();
			return "JSONRESULT";
		}
		
		if("SelectCourse".equals(entity)){
			Long total = this.adminCommonService.getByParamTotal(SelectCourse.class, cols,condition);
			List<SelectCourse> list = this.adminCommonService.getByParamData(SelectCourse.class, cols,condition);
			result.put("total", total);//
	        result.put("rows", list);//
	        result.put("success", true);
	        System.gc();
			return "JSONRESULT";
		
		}
		return null;
	}
	
	public String getSCParam(){
		String entity = Struts2Utils.getHttpServletRequest().getParameter("entity");
		List<?> list = null;
		if("Student".equals(entity)){
			list = this.adminCommonService.findAll(Student.class);
		}if("Course".equals(entity)){
			list = this.adminCommonService.findAll(Course.class);
		}
		result.put("success", true);
		result.put("list", list);
		 System.gc();
		return "JSONRESULT"; 
	}
	
	public String findSCInfo(){
		String stype = Struts2Utils.getHttpServletRequest().getParameter("stype");
		String tiaojian = Struts2Utils.getHttpServletRequest().getParameter("tiaojian");
		
		List<?> list = null;
		if("Student".equals(stype)){
		   list = this.adminCommonService.getByParamData(SelectCourse.class, "id.student.stunum", tiaojian);
		}if("Course".equals(stype)){
			list = this.adminCommonService.getByParamData(SelectCourse.class, "id.course.cno", tiaojian);
		}
		result.put("success", true);
		result.put("list", list);
		 System.gc();
		return "JSONRESULT";
	}
	
	public String registerST(){
		String rname = Struts2Utils.getHttpServletRequest().getParameter("rname");
		String rpow = Struts2Utils.getHttpServletRequest().getParameter("rpow");
		List<?> list1 = null;
		List<?> list2 = null;
		if("学生".equals(rpow)){
			 list1 = this.adminCommonService.Register(Student.class, "stunum", rname);
			 if(list1.isEmpty()||list1==null){
				 	result.put("success", false);
				 	result.put("message","系统中不存在该学号！！");
				 	 System.gc();
					return "JSONRESULT";
			 }else{
				 list2 = this.adminCommonService.Register(Register.class, "username", rname);
				 if(!list2.isEmpty()&&list2!=null){
					 result.put("success", false);
					 result.put("message","该账号已注册！！");
					 System.gc();
					 return "JSONRESULT";
				 }if(list2.isEmpty()){
					 result.put("success", true);
					 result.put("message","该账号可用！！");
					 System.gc();
					 return "JSONRESULT";
					 
				 }
			 }
			 
		}if("教师".equals(rpow)){
			list1 = this.adminCommonService.Register(Teacher.class, "tenum", rname);
			 if(list1.isEmpty()||list1==null){
				 	result.put("success", false);
				 	result.put("message","系统中不存在该教师！！");
				 	 System.gc();
					return "JSONRESULT";
			 }else{
				 list2 = this.adminCommonService.Register(Register.class, "username", rname);
				 if(!list2.isEmpty()&&list2!=null){
					 result.put("success", false);
					 result.put("message","该账号已注册！！");
					 System.gc();
					 return "JSONRESULT";
				 }if(list2.isEmpty()){
					 result.put("success", true);
					 result.put("message","该账号可用！！");
					 System.gc();
					 return "JSONRESULT";
					 
				 }
			 }
		}
		
		return null;
	}
	
	public String register(){
		String ppow = Struts2Utils.getHttpServletRequest().getParameter("ppow");
		String pname = Struts2Utils.getHttpServletRequest().getParameter("pname");
		String ppp = Struts2Utils.getHttpServletRequest().getParameter("ppp");
		Register re = new Register();
		re.setUsername(pname);
		re.setPassword(MD5Utils.md5Password(ppp));
		if("学生".equals(ppow)){
			re.setPower("A");
		}if("教师".equals(ppow)){
			re.setPower("B");
		}
		List<Register> r = this.adminCommonService.Register(Register.class, "username", pname);
		 if(!r.isEmpty()&&r!=null){
			 System.out.println("!=null:"+r.size());
			 result.put("success", false);
			 result.put("message","注册失败！！");
			 System.gc();
			 return "JSONRESULT";
		 }else{
			 System.out.println("=null:"+r.size());
		     this.adminCommonService.sava(re);
		     result.put("success", true);
			 result.put("message","注册成功！！");
			 UserLog ul = new UserLog(pname, Goals.Log_Type_OTHER, "注册成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				this.adminCommonService.sava(ul);
			 logger.info(pname+":注册成功");
			 System.gc();
			 return "JSONRESULT";
		 }
		
		 
	}
	
	
	/**
	 * 用户信息
	 */
	public String getUserData(){
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		long total = adminCommonService.getTotal(Register.class);
		List<Register> list = adminCommonService.getIncidentData(Register.class, intPage, intRows);
		result.put("total", total);//
	    result.put("rows", list);//
	    System.gc();
		 return "JSONRESULT";
	}
	
	public String editUserMethod() {
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		String username = Struts2Utils.getHttpServletRequest().getParameter("username");
		String password =Struts2Utils.getHttpServletRequest().getParameter("password");
		String power = Struts2Utils.getHttpServletRequest().getParameter("power");
		Register r = adminCommonService.findId(Register.class,Integer.parseInt(id));
		r.setUsername(username);
		r.setPassword(MD5Utils.md5Password(password));
		r.setPower(power);
		adminCommonService.update(r);
		result.put("success", true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "用户信息修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"用户信息修改成功");
		 System.gc();
		 return "JSONRESULT";	
	}
	
	public String deleteUserMethod(){
		String id = Struts2Utils.getHttpServletRequest().getParameter("id");
		Register r = adminCommonService.findId(Register.class,Integer.parseInt(id));
		
		adminCommonService.remove(r);
		result.put("success", true);
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "用户信息删除成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.adminCommonService.sava(ul);
		logger.info(Goals.getAName()+":"+"用户信息删除成功");
		 System.gc();
	    return "JSONRESULT";
		
	}
	
	/**老师查看每门课都有谁选了*/
	public String getTCSData(){
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		List<TCS> list = this.adminCommonService.Count(tenum, intPage, intRows);	
		Long total = this.adminCommonService.TotalCount(tenum);
		result.put("total", total);
		result.put("rows", list);
		 System.gc();
       return "JSONRESULT";	
	}
	
	public String getSInfo(){
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		String courcno = Struts2Utils.getHttpServletRequest().getParameter("courcno");
		List<SelectCourse> list = this.adminCommonService.SInfo(tenum, courcno);
		result.put("success", true);
		result.put("list", list);
		 System.gc();
		return "JSONRESULT";
	}
	
	
  public String getResultData(){
	  int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
	  int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
	  String tenum = (String) ActionContext.getContext().getSession().get("username");
	  List<SelectCourse> list = this.adminCommonService.getResultData(SelectCourse.class, "id.course.teacher.tenum", tenum, intPage, intRows);
	  Long total = this.adminCommonService.TotalResultData(SelectCourse.class, "id.course.teacher.tenum", tenum);
	  result.put("total", total);
	  result.put("rows", list);
	  System.gc();
	  return "JSONRESULT";
	  
  }
  
  
  public String editResultMethod() throws Exception{
	  String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");
	  String stunum = Struts2Utils.getHttpServletRequest().getParameter("stunum");
	  String result1 = Struts2Utils.getHttpServletRequest().getParameter("result");
	  SelectCourse sc = this.adminCommonService.findByTwoId(cno, stunum);
	  Integer resul = Integer.valueOf(result1);
	  sc.setResult(resul);
	  
	  this.adminCommonService.update(sc);
	  
	  UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, stunum+":"+cno+"成绩录入成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
	  this.adminCommonService.sava(ul);
	  logger.info(Goals.getAName()+":"+stunum+":"+cno+"成绩录入成功");
	   result.put("success",true);
	  System.gc();
	  return "JSONRESULT";
  }
	
	public String getOwnCourse(){
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		  int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		  String stunum = (String) ActionContext.getContext().getSession().get("username");
		  List<SelectCourse> list = this.adminCommonService.getResultData(SelectCourse.class, "id.student.stunum", stunum, intPage, intRows);
		 Long total = this.adminCommonService.TotalResultData(SelectCourse.class, "id.student.stunum", stunum);
	     result.put("total", total);
	     result.put("rows", list);
	     System.gc();
	     return "JSONRESULT";
	
	}
	
	
	public String ownTuiMethod(){
		 String stunum = (String) ActionContext.getContext().getSession().get("username");
		 String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");
		SelectCourse ss =  this.adminCommonService.findByTwoId(cno, stunum);
		if(ss.getResult()>0){
			result.put("message", "退选失败");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "退选课程失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"退选课程失败");
			 System.gc();
			return "JSONRESULT";
		}else{
			this.adminCommonService.remove(ss);
			result.put("message", "退选成功");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_DEL, "退选课程成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.adminCommonService.sava(ul);
			logger.info(Goals.getAName()+":"+"退选课程成功");
			 System.gc();
			return "JSONRESULT";
		}
	}
	
	public String getTeacherByMoreParam(){
		String tenum = Struts2Utils.getHttpServletRequest().getParameter("tenum");
		String tename = Struts2Utils.getHttpServletRequest().getParameter("tename");
		String tesex = Struts2Utils.getHttpServletRequest().getParameter("tesex");
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		List<Teacher> rows = this.adminCommonService.getByMoreParams(Teacher.class, intPage, intRows, "tenum",tenum,"tename",tename,"tesex",tesex);
		Long total = this.adminCommonService.TotalByMoreParams(Teacher.class,  "tenum",tenum,"tename",tename,"tesex",tesex);
		result.put("rows", rows);
		result.put("total", total);
		return "JSONRESULT";
		
	}
	
	public String getCourseByMoreParam(){
		String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");
		String cname = Struts2Utils.getHttpServletRequest().getParameter("cname");
		String ctype = Struts2Utils.getHttpServletRequest().getParameter("ctype");
		int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		List<Course> rows = this.adminCommonService.getByMoreParams(Course.class, intPage, intRows,"cno",cno,"cname",cname,"ctype",ctype);
		Long total = this.adminCommonService.TotalByMoreParams(Course.class,  "cno",cno,"cname",cname,"ctype",ctype);
		result.put("rows", rows);
		result.put("total", total);
		return "JSONRESULT";
		
	}
	
	
	public String getStuCourse(){
		 String stunum = (String) ActionContext.getContext().getSession().get("username");
		List<SelectCourse> list = this.adminCommonService.getGDTwoParam(SelectCourse.class,"id.student.stunum",stunum);
		result.put("success", true);
		result.put("list", list);
		return "JSONRESULT";
	}
	
	public String getStuStuclass(){
		 String stunum = (String) ActionContext.getContext().getSession().get("username");
		 String stuclass = this.adminCommonService.findById(Student.class, stunum).getStuclass();
		result.put("success", true);
		result.put("stuclass", stuclass);
		return "JSONRESULT";
	}
	public String SortResult(){
		String selc = Struts2Utils.getHttpServletRequest().getParameter("selc");
		String selJuti = Struts2Utils.getHttpServletRequest().getParameter("selJuti");
		List<Object> list = new ArrayList<Object>();
		if("selcno".equals(selc)){
			String cno = selJuti.split(",")[0];
			list = this.adminCommonService.SortResultByCourse(cno);
		}if("selstuclass".equals(selc)){
			String cu = Struts2Utils.getHttpServletRequest().getParameter("cu");
			String cno = cu.split(",")[0];
			list = this.adminCommonService.SortResultByStuclass(selJuti,cno);
		}
		result.put("success",true);
		result.put("list", list);
		return "JSONRESULT";
	}
	
	 public String getSameClassCourse(){
		  String stuclass = Struts2Utils.getHttpServletRequest().getParameter("stuclass");
		  List<SelectCourse> list = this.adminCommonService.getGDTwoParam(SelectCourse.class, "id.student.stuclass", stuclass);
		  result.put("success",true);
		  result.put("list",list);
		 return "JSONRESULT";
	 }
	/**
	 * ip信息
	 * @return
	 */
	 public String getUserIpData(){
			int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
			int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
			long total = adminCommonService.getTotal(IpCount.class);
			List<IpCount> list = adminCommonService.getIncidentData(IpCount.class, intPage, intRows);
			result.put("total", total);//
		    result.put("rows", list);//
		    System.gc();
			 return "JSONRESULT";
		}
	 
	 public String getUserIpByParam(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String uname = Struts2Utils.getHttpServletRequest().getParameter("uname");
		 String ftime = Struts2Utils.getHttpServletRequest().getParameter("ftime");
		 List<IpCount> list = this.adminCommonService.getUserIpByParam(IpCount.class, "username", uname, "firstTime", ftime, intPage, intRows);
	     Long total = this.adminCommonService.TotalUserIpByParam(IpCount.class, "username", uname, "firstTime", ftime);
	     result.put("total", total);//
		 result.put("rows", list);//
		 System.gc();
	     return "JSONRESULT";
	 }
	 
	 
	 
	 public String getUserLogData(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
			int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
			long total = adminCommonService.getTotal(UserLog.class);
			List<UserLog> list = adminCommonService.getIncidentData(UserLog.class, intPage, intRows);
			result.put("total", total);//
		    result.put("rows", list);//
		    System.gc();
			 return "JSONRESULT";
	 }
	 
	 public String getUserLogByParam(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String aID = Struts2Utils.getHttpServletRequest().getParameter("aID");
		 String aname = Struts2Utils.getHttpServletRequest().getParameter("aname");
		 String atime = Struts2Utils.getHttpServletRequest().getParameter("atime");
		 List<UserLog> list = this.adminCommonService.getUserLogByParam(UserLog.class, "actionID", aID,"actionName",aname,"actionTime", atime, intPage, intRows);
	     Long total = this.adminCommonService.TotalUserLogByParam(UserLog.class, "actionID", aID,"actionName",aname, "actionTime", atime);
	     result.put("total", total);//
		 result.put("rows", list);//
		 System.gc();
	     return "JSONRESULT";
	 }
	 
	 public String getStuByParam(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String stunum = Struts2Utils.getHttpServletRequest().getParameter("stunum");
		 String stuname = Struts2Utils.getHttpServletRequest().getParameter("stuname");
		 String stuclass = Struts2Utils.getHttpServletRequest().getParameter("stuclass");
		 List<Student> list = this.adminCommonService.getEntityByParam(Student.class, "stunum", stunum, "stuname", stuname, "stuclass", stuclass, intPage, intRows);
		 Long total = this.adminCommonService.TotalEntityByParam(Student.class, "stunum", stunum, "stuname", stuname, "stuclass", stuclass);
		 result.put("rows", list);
		 result.put("total",total);
		 System.gc();
		 return "JSONRESULT";
		 
	 }
	 public String getCouByParam(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");
		 String cname = Struts2Utils.getHttpServletRequest().getParameter("cname");
		 String ctype = Struts2Utils.getHttpServletRequest().getParameter("ctype");
		 List<Course> list = this.adminCommonService.getEntityByParam(Course.class, "cno", cno, "cname", cname, "ctype", ctype, intPage, intRows);
		 Long total = this.adminCommonService.TotalEntityByParam(Course.class, "cno", cno, "cname", cname, "ctype", ctype);
		 result.put("rows", list);
		 result.put("total",total);
		 System.gc();
		 return "JSONRESULT";
		 
	 }
	 public String getTeaByParam(){
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String tenum = Struts2Utils.getHttpServletRequest().getParameter("tenum");
		 String tename = Struts2Utils.getHttpServletRequest().getParameter("tename");
		 String tetitle = Struts2Utils.getHttpServletRequest().getParameter("tetitle");
		 List<Teacher> list = this.adminCommonService.getEntityByParam(Teacher.class, "tenum", tenum, "tename", tename, "tetitle", tetitle, intPage, intRows);
		 Long total = this.adminCommonService.TotalEntityByParam(Teacher.class,"tenum", tenum, "tename", tename, "tetitle", tetitle);
		 result.put("rows", list);
		 result.put("total",total);
		 System.gc();
		 return "JSONRESULT";
		 
	 }
	 public String getASCByParam(){
		 System.out.println("ljflsdf");
		 int intPage = Integer.parseInt((page == null || page == "0") ? "1":page); 
		 int intRows =Integer.parseInt((rows == null || rows == "0") ? "1":rows); 
		 String stunum = Struts2Utils.getHttpServletRequest().getParameter("stunum");
		 String cno = Struts2Utils.getHttpServletRequest().getParameter("cno");
		 List<SelectCourse> list = this.adminCommonService.getEntityByParam(SelectCourse.class, "id.student.stunum", stunum, "id.course.cno", cno, "result", "", intPage, intRows);
		 Long total = this.adminCommonService.TotalEntityByParam(SelectCourse.class,"id.student.stunum", stunum, "id.course.cno", cno, "result", "");
		 result.put("rows", list);
		 result.put("total",total);
		 System.gc();
		 return "JSONRESULT";
		 
	 }
	 
		public String getCouMaxNum(){
	        String obj = this.adminCommonService.getMaxNum("cno", "Course");
	        result.put("MaxNum", obj);
			return "JSONRESULT";
		}
		public String getStuMaxNum(){
	        String obj = this.adminCommonService.getMaxNum("stunum", "Student");
	        result.put("MaxNum", obj);
			return "JSONRESULT";
		}
		public String getTeaMaxNum(){
	        String obj = this.adminCommonService.getMaxNum("tenum", "Teacher");
	        result.put("MaxNum", obj);
			return "JSONRESULT";
		}
	 private CourseService courseService;
	 public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
}
