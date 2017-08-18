package cn.edu.gdin.util;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

public class GetAgentUtil {
	 public static String getBrowser(){
		 UserAgent userAgent = UserAgent.parseUserAgentString(Struts2Utils.getHttpServletRequest().getHeader("User-Agent"));
		Browser browser = userAgent.getBrowser();
		String str = browser.getName();
		System.out.println("ä¯ÀÀÆ÷£º"+str);
		return str;
	}
	
	public static String getOperaSystem(){
		UserAgent userAgent = UserAgent.parseUserAgentString(Struts2Utils.getHttpServletRequest().getHeader("User-Agent"));
		OperatingSystem os  = userAgent.getOperatingSystem();
		String str = os.getName();
		System.out.println("²Ù×÷ÏµÍ³£º"+str);
		return str;
	}

}
