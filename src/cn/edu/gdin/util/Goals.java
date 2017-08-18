package cn.edu.gdin.util;

import java.io.PrintWriter;
import java.io.StringWriter;

public final class Goals {
	 public static String Log_Type_LOGIN="登录"; //登陆
	 public static String Log_Type_EXIT="退出";  //退出
	 public static String Log_Type_INSERT="插入"; //插入
	 public static String Log_Type_DEL="删除"; //删除
	 public static String Log_Type_UPDATE="更新"; //更新
	 public static String Log_Type_UPLOAD="上传"; //上传
	 public static String Log_Type_IMPORT="导入"; //导入
	 public static String Log_Type_EXPORT="导出"; //导出
	 public static String Log_Type_OTHER="其他"; //其他
	 
	 public static String getAName(){
		 return (String) Struts2Utils.getHttpServletRequest().getSession().getAttribute("username");
	 }
	 
	 public static String getExceptionMessage(Exception ex) {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			ex.printStackTrace(pw);
			return sw.toString();
		}
}
