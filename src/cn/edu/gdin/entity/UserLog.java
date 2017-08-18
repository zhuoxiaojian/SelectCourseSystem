package cn.edu.gdin.entity;

import java.util.Date;

public class UserLog {
   
	private Integer id;
	private String actionID;
	private String actionName;
	private String actionMessage;
	private String actionIp;
	private String actionSystem;
	private String actionBrowser;
	private Date actionTime;
	
	public UserLog(){
		
	}

	public UserLog(String actionID, String actionName, String actionMessage,
			String actionIp, String actionSystem, String actionBrowser,
			Date actionTime) {
		super();
		this.actionID = actionID;
		this.actionName = actionName;
		this.actionMessage = actionMessage;
		this.actionIp = actionIp;
		this.actionSystem = actionSystem;
		this.actionBrowser = actionBrowser;
		this.actionTime = actionTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getActionID() {
		return actionID;
	}

	public void setActionID(String actionID) {
		this.actionID = actionID;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getActionIp() {
		return actionIp;
	}

	public void setActionIp(String actionIp) {
		this.actionIp = actionIp;
	}

	public String getActionSystem() {
		return actionSystem;
	}

	public void setActionSystem(String actionSystem) {
		this.actionSystem = actionSystem;
	}

	public String getActionBrowser() {
		return actionBrowser;
	}

	public void setActionBrowser(String actionBrowser) {
		this.actionBrowser = actionBrowser;
	}

	public Date getActionTime() {
		return actionTime;
	}

	public void setActionTime(Date actionTime) {
		this.actionTime = actionTime;
	}
	
	
	
}
