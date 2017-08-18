<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生选课系统学生端</title>
</head>

<frameset rows="90,*,40" frameborder="yes" border="1" framespacing="0">
  <frame src="<%=basePath %>jsp/header.jsp" name="topFrame" scrolling="no" noresize="noresize" />
  <frameset cols="100,*" border="1" framespacing="0">
  <frame src="<%=basePath %>jsp/left.jsp" name="leftframe" id="leftframe" />
  <frame src="<%=basePath %>jsp/Text.jsp" name="mainFrame" id="mainFrame"  noresize="noresize" />
</frameset>
  <frame src="<%=basePath %>footer.jsp" name="lowFrame" id="lowFrame"  noresize="noresize" />
</frameset>
<noframes><body style="background-color: #C9F5F5">
</body>
</noframes></html>
