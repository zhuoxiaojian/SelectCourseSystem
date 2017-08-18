package cn.edu.gdin.entity;

import java.util.Date;

public class IpCount implements java.io.Serializable{

	private Integer id;
	private String username;
	private String visitIp;
	private Date firstTime;
	private Date lastTime;
	private String visitBrowser;
	private String visitSystem;
	private boolean visitStatus;
	
	public IpCount(){
		
	}
	
	public IpCount(Integer id, String username, String visitIp, Date firstTime,
			Date lastTime,boolean visitStatus) {
		super();
		this.id = id;
		this.username = username;
		this.visitIp = visitIp;
		this.firstTime = firstTime;
		this.lastTime = lastTime;
		this.visitStatus = visitStatus;
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getVisitIp() {
		return visitIp;
	}
	public void setVisitIp(String visitIp) {
		this.visitIp = visitIp;
	}
	public Date getFirstTime() {
		return firstTime;
	}
	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}
	public Date getLastTime() {
		return lastTime;
	}
	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	
	public String getVisitBrowser() {
		return visitBrowser;
	}

	public void setVisitBrowser(String visitBrowser) {
		this.visitBrowser = visitBrowser;
	}

	public String getVisitSystem() {
		return visitSystem;
	}

	public void setVisitSystem(String visitSystem) {
		this.visitSystem = visitSystem;
	}

	public boolean isVisitStatus() {
		return visitStatus;
	}

	public void setVisitStatus(boolean visitStatus) {
		this.visitStatus = visitStatus;
	}
	
	
	
}
