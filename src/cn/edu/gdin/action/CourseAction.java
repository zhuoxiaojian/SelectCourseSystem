package cn.edu.gdin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.gdin.service.CourseService;

public class CourseAction extends ActionSupport{
	private CourseService courseService;
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	private List list;
	public void setList(List list) {
		this.list = list;
	}
	public List getList() {
		return list;
		
	}
	public String find_course(){
		
		  list = this.courseService.courseInfo();
		if(list.size()!=0){
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

}
