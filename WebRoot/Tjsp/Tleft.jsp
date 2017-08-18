<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Tleft.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	
  </head>
  
  <body>
	<table style="width: 100%">
	<tr align="center">
	<td>教师${username}
	</td>
	</tr>
		<tr  align="center">
			<td><a href="<%=basePath%>Tjsp/TeaFirst.jsp" target="mainFrame" style="text-decoration: none;"><b>首页</b>
			</a>
			</td>
		</tr>
		<tr  align="center">
			<td><a href="<%=basePath%>Tea_Own.action" target="mainFrame" style="text-decoration: none;" ><b>个人信息</b>
			</a>
			</td>
		</tr>
		<tr  align="center">
			<td><a href="${pageContext.request.contextPath}/Tjsp/Tchenji.jsp"
				target="mainFrame" style="text-decoration: none;"><b>成绩录入</b> </a>
				</td>
		</tr>
		
		
		 <tr  align="center">
			<td><a href="<%=basePath%>Tjsp/Tyifa.jsp" target="mainFrame" style="text-decoration: none;"><b>已发课程</b>
			</a>
			</td>
		</tr>
		
		 <tr  align="center">
			<td><a href="<%=basePath%>Tjsp/Tfabu.jsp" target="mainFrame" style="text-decoration: none;"><b>发布课程</b>
			</a>
			</td>
		</tr>
		
		<tr  align="center">
			<td><a href="<%=basePath%>jsp/updatePwd.jsp" target="mainFrame" style="text-decoration: none;"><b>修改密码</b>
			</a>
			</td>
		</tr>
		
		<tr  align="center">
			<td><a href="<%=basePath%>Exit.action" target="_top" style="text-decoration: none;"><b>退出系统</b>
			</a>
			</td>
		</tr>

	</table>
  </body>
</html>
