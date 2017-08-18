package cn.edu.gdin.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class Struts2Utils
{
	//获取容器response域对象
	public static HttpServletResponse getHttpServletResponse() {
		return ServletActionContext.getResponse();
	}
	//获取容器request域对象
	public static HttpServletRequest getHttpServletRequest() {
		return ServletActionContext.getRequest();
	}
	//获取session域对象
	public static Map<String, Object> getSession(){
		/*设置session时间（单位是s）*/
		//ServletActionContext.getRequest().getSession().setMaxInactiveInterval(8*60*60); 
		return ActionContext.getContext().getSession();
	}
	//将后台数据放入request域中,方便前台处理
	public static void set2Request(String s,Object o){
		ServletActionContext.getRequest().setAttribute(s, o);
	}
}
