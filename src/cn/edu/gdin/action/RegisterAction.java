package cn.edu.gdin.action;

import java.util.Date;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.edu.gdin.entity.IpCount;
import cn.edu.gdin.entity.Register;
import cn.edu.gdin.entity.UserLog;
import cn.edu.gdin.service.RegisterService;
import cn.edu.gdin.util.GetAgentUtil;
import cn.edu.gdin.util.GetIpUtil;
import cn.edu.gdin.util.Goals;
import cn.edu.gdin.util.MD5Utils;
import cn.edu.gdin.util.Struts2Utils;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	public static final Logger logger = Logger.getLogger(RegisterAction.class);
	private RegisterService registerService;
	private String username;
	private String password;
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getUserename() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}
	public String login(){
		ActionContext.getContext().getSession().put("username",username);
		ActionContext.getContext().getSession().put("password",password);
		String user = (String) ActionContext.getContext().getSession().get("username");
		String pass = (String) ActionContext.getContext().getSession().get("password");
		Struts2Utils.getHttpServletRequest().setAttribute("userName", username);
		Register register = new Register();	
		register.setUsername(user);
		register.setPassword(MD5Utils.md5Password(pass));
		Register r = registerService.login(register);
		String cod = (String) ActionContext.getContext().getSession().get("securityCode");
		if(r!=null&&r.getPower().equals("A")&&code.equals(cod)){
			IpCount ipCount = new IpCount();
			ipCount.setUsername(user);
			ipCount.setVisitIp(GetIpUtil.getIpAddr());
			ipCount.setFirstTime(new Date());
			ipCount.setVisitBrowser(GetAgentUtil.getBrowser());
			ipCount.setVisitSystem(GetAgentUtil.getOperaSystem());
			ipCount.setVisitStatus(true);
	        this.registerService.savorupda(ipCount);
	        UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_LOGIN, "登录成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.registerService.addLog(ul);
			logger.info(Goals.getAName()+":登录成功");
			return SUCCESS;
		}else if(r!=null&&r.getPower().equals("B")&&code.equals(cod)){
			IpCount ipCount = new IpCount();
			ipCount.setUsername(user);
			ipCount.setVisitIp(GetIpUtil.getIpAddr());
			ipCount.setFirstTime(new Date());
			ipCount.setVisitBrowser(GetAgentUtil.getBrowser());
			ipCount.setVisitSystem(GetAgentUtil.getOperaSystem());
			ipCount.setVisitStatus(true);
	        this.registerService.savorupda(ipCount);
	        UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_LOGIN, "登录成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.registerService.addLog(ul);
			logger.info(Goals.getAName()+":登录成功");
			return LOGIN;
		}else if(r!=null&&r.getPower().equals("C")&&code.equals(cod)){
			IpCount ipCount = new IpCount();
			ipCount.setUsername(user);
			ipCount.setVisitIp(GetIpUtil.getIpAddr());
			ipCount.setFirstTime(new Date());
			ipCount.setVisitBrowser(GetAgentUtil.getBrowser());
			ipCount.setVisitSystem(GetAgentUtil.getOperaSystem());
			ipCount.setVisitStatus(true);
	        this.registerService.savorupda(ipCount);
	        UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_LOGIN, "登录成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.registerService.addLog(ul);
			logger.info(Goals.getAName()+":登录成功");
			return ERROR;
		}else{
			IpCount ipCount = new IpCount();
			ipCount.setUsername(user);
			ipCount.setVisitIp(GetIpUtil.getIpAddr());
			ipCount.setFirstTime(new Date());
			ipCount.setVisitBrowser(GetAgentUtil.getBrowser());
			ipCount.setVisitSystem(GetAgentUtil.getOperaSystem());
			ipCount.setVisitStatus(false);
	        this.registerService.savorupda(ipCount);
	        UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_LOGIN, "登录失败", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
			this.registerService.addLog(ul);
			logger.info(Goals.getAName()+":登录失败");
			return INPUT;
		}
		
	}
	public String execute() throws Exception{
		UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_EXIT, "用户退出", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.registerService.addLog(ul);
		logger.info(Goals.getAName()+":退出成功");
		ActionContext.getContext().getSession().clear();
		Struts2Utils.getHttpServletRequest().getSession().invalidate();
		return super.execute();
	}
	public String Code() throws Exception{
		String cod = (String) ActionContext.getContext().getSession().get("securityCode");
		if(code.equals(cod)){
		resultData = "{\"result\":\"" + true + "\"}";/*   /"是转义字符    */
		return "success";
		}else{
			resultData = "{\"result\":\"" + false + "\"}";/*   /"是转义字符    */
			return "success";
		}
	}
	
	public String UpPwd() throws Exception{
		String user = (String) ActionContext.getContext().getSession().get("username");
		Register re = registerService.FinPwd(user);
		Register register = new Register();
		register.setId(re.getId());
		register.setUsername(re.getUsername());
		register.setPassword(MD5Utils.md5Password(newpwd));
	    register.setPower(re.getPower());
		this.registerService.UpdatPwd(register);
		resultData = "{\"result\":\"" + true + "\"}";/*   /"是转义字符    */
		 UserLog ul = new UserLog(Goals.getAName(), Goals.Log_Type_UPDATE, "密码修改成功", GetIpUtil.getIpAddr(), GetAgentUtil.getOperaSystem(), GetAgentUtil.getBrowser(), new Date());
		this.registerService.addLog(ul);
		logger.info(Goals.getAName()+":密码修改成功");
		return "success";
	}
	public void validateUpPwd(){
		String user = (String) ActionContext.getContext().getSession().get("username");
		Register re = registerService.FinPwd(user);
		if(!MD5Utils.md5Password(oldpwd).equals(re.getPassword())){
			this.addFieldError("oldpwd", "对不起，你输入的旧密码错误");
			
		}
	}
	public String XiaoyanPwd() {
		String user = (String) ActionContext.getContext().getSession().get("username");
		Register re = registerService.FinPwd(user);
		if(!MD5Utils.md5Password(oldpwd).equals(re.getPassword())){
			//this.addFieldError("oldpwd", "对不起，你输入的旧密码错误");
			resultData = "{\"result\":\"" + false + "\"}";/*   /"是转义字符    */
			return "success";
		}else{
			resultData = "{\"result\":\"" + true + "\"}";/*   /"是转义字符    */
			return "error";
		}
		
	}
	
	
	
	private String oldpwd;
	private String newpwd;
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	
	private String resultData;

	public String getResultData() {
		return resultData;
	}

	public void setResultData(String resultData) {
		this.resultData = resultData;
	}
}
