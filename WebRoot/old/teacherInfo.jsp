<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'teacherInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body{
 background-color: #E1F2FD;

}
table td:nth-child(odd) {
	background: #00FF40;
}

table td:nth-child(even) {
	background: #00FFFF;
}
</style>
    <script>  
    window.onload=function(){  
        //三秒钟后窗体自动关闭  
        window.setTimeout("window.close()","3000");  
    };  
    </script>  
</head>

<body>
	<table align="center" border="1" width="80%" height="60%">
		<caption><font color="red" size="5">教师信息</font></caption>
		<tr align="center">
			<td>教师编号</td>
			<td>${teacher.tenum}</td>
		</tr>
		<tr align="center">
			<td>教师名称</td>
			<td>${teacher.tename}</td>
		</tr>
		<tr align="center">
			<td>教师性别</td>
			<td>${teacher.tesex}</td>
		</tr>
		<tr align="center">
			<td>教师职称</td>
			<td>${teacher.tetitle}</td>
		</tr>
		<tr align="center">
			<td>教师专业</td>
			<td>${teacher.temajor}</td>
		</tr>
	</table>
</body>
</html>
