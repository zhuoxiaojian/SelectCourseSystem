<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生选课管理系统后台</title>
</head>

<frameset rows="90,*,40" frameborder="yes" border="1" framespacing="0">
  <frame src="<%=basePath %>Ajsp/Ahead.jsp" name="topFrame" scrolling="no" noresize="noresize" />
  <frameset cols="150,*" border="1" framespacing="0">
  <frame src="<%=basePath %>Ajsp/Aleft.jsp" name="leftframe" id="leftframe" />
  <frame src="<%=basePath %>Ajsp/Afirst.jsp" name="mainFrame" id="mainFrame"  noresize="noresize" />
</frameset><frame src="<%=basePath %>footer.jsp" name="lowFrame" id="lowFrame"  noresize="noresize" />
</frameset>
<noframes><body style="background-color: #C9F5F5">
</body>
</noframes></html>
