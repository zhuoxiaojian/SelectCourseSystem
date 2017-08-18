package cn.edu.gdin.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.edu.gdin.demo.TCS;
import cn.edu.gdin.entity.SelectCourse;
import cn.edu.gdin.service.TCSCountService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TCSCountAction extends ActionSupport{
	private TCSCountService tCSCountService;
	 public void settCSCountService(TCSCountService tCSCountService) {
		this.tCSCountService = tCSCountService;
	}
	 
	 private List list;
	 public void setList(List list) {
		this.list = list;
	}
	 public List getList() {
		return list;
	}
	public String stud_count(){
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		List<TCS> list1 = this.tCSCountService.stu_count(tenum);
		
		if(list1!=null){
            list = list1;			
			return SUCCESS;
		}else{
			list = null;
			return INPUT;
		}
	}
	
	public String stud_info(){
		String tenum = (String) ActionContext.getContext().getSession().get("username");
		
		lll = this.tCSCountService.sinfo(tenum, courcno);
		if(!lll.isEmpty()){
		     return SUCCESS;
		}else{
			ActionContext.getContext().getSession().put("message", "ÔÝÎÞ¼ÇÂ¼");
			return INPUT;
		}
	}

	private List lll;
	public void setLll(List lll) {
		this.lll = lll;
	}
	public List getLll() {
		return lll;
	}
	
	private String courcno;
	public void setCourcno(String courcno) {
		this.courcno = courcno;
	}
	public String getCourcno() {
		return courcno;
	}
}
