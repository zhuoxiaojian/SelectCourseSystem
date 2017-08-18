package cn.edu.gdin.util;

public class GetIpUtil {
	
	public static String getIpAddr(){
		String ip = Struts2Utils.getHttpServletRequest().getHeader("x-forwarded-for");
		if(ip == null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip = Struts2Utils.getHttpServletRequest().getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip = Struts2Utils.getHttpServletRequest().getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)){
			ip = Struts2Utils.getHttpServletRequest().getRemoteAddr();
		}
		return ip;
	}

}
