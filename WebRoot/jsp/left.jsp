<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//basePath = "http://localhost:8080/SalarySystem/"
%>
<html>
<head>
 	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<table style="width: 100%">
	   <tr align="center">
	<td>学生${username}
	</td>
	</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>jsp/Text.jsp" target="mainFrame" style="text-decoration: none;"><b>首页</b>
			</a>
			</td>
		</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>StuInfo.action" target="mainFrame" style="text-decoration: none;" ><b>个人信息</b>
			</a>
			</td>
		</tr>
		<tr   align="center">
			<td><a href="${pageContext.request.contextPath}/jsp/Scourselist.jsp"
				target="mainFrame" style="text-decoration: none;"><b>课程信息</b> </a>
				</td>
		</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>jsp/Ownyixuan.jsp"
				target="mainFrame" style="text-decoration: none;"><b>已选课程</b> </a>
				</td>
		</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>jsp/resultcheck.jsp"
				target="mainFrame" style="text-decoration: none;"><b>我的排名</b> </a>
				</td>
		</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>jsp/updatePwd.jsp" target="mainFrame" style="text-decoration: none;"><b>修改密码</b>
			</a>
			</td>
		</tr>
		<tr   align="center">
			<td><a href="<%=basePath%>jsp/param.jsp" target="mainFrame" style="text-decoration: none;"><b>查找教师</b>
			</a>
			</td>
		</tr>
		
		<tr   align="center">
			<td><a href="<%=basePath%>Exit.action" target="_top" style="text-decoration: none;"><b>退出系统</b>
			</a>
			</td>
		</tr>

     
	</table>
	
	
	
</body>
</html>

