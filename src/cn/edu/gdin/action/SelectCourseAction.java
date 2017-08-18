package cn.edu.gdin.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.SelectCourseService;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SelectCourseAction extends ActionSupport {
	private static final Logger logger = Logger.getLogger(SelectCourseAction.class);
	private SelectCourseService selectCourseService;

	public void setSelectCourseService(SelectCourseService selectCourseService) {
		this.selectCourseService = selectCourseService;
	}

	@SuppressWarnings("rawtypes")
	private List list2;

	@SuppressWarnings("rawtypes")
	public List getList2() {
		return list2;
	}

	@SuppressWarnings("rawtypes")
	public void setList2(List list2) {
		this.list2 = list2;
	}

	private String resultData;

	public String getResultData() {
		return resultData;
	}

	public void setResultData(String resultData) {
		this.resultData = resultData;
	}
	
	
	public String select_course() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String c = request.getParameter("select");
			String s = (String) ActionContext.getContext().getSession()
					.get("username");
			int count = this.selectCourseService.select_cno(c, s);
			if (count <= 0) {
				this.selectCourseService.sele_cour(s,c);
				 UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "Ñ¡¿Î³É¹¦", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				 this.selectCourseService.addLog(ul);
				 logger.info(Goals.getAName()+":Ñ¡¿Î³É¹¦");
				System.gc();
				resul.put("success", true);
				return "JSONRESULT";
			} else {
				System.gc();
				UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT, "Ñ¡¿ÎÊ§°Ü", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
				 this.selectCourseService.addLog(ul);
				 logger.info(Goals.getAName()+":Ñ¡¿ÎÊ§°Ü");
				resul.put("success", false);
				return "JSONRESULT";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//ActionContext.getContext().getSession().put("message", "Ñ¡ÔñÊ§°Ü");
			UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_INSERT,"Ñ¡¿ÎÊ§°Ü", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			 this.selectCourseService.addLog(ul);
			 logger.error(Goals.getAName()+":Ñ¡¿ÎÊ§°Ü£¡ "+Goals.getExceptionMessage(e));
			return INPUT;
		}
		
	}
	
	private String result;
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
	
	private String cid;
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCid() {
		return cid;
	}
	
	private Map<String, Object> resul = new HashMap<String, Object>();

	public Map<String, Object> getResul() {
		return resul;
	}

	public void setResul(Map<String, Object> resul) {
		this.resul = resul;
	} 
	

}
