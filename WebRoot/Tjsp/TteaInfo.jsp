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
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	
<style type="text/css">
body{
 background-color: #E1F2FD;

}
table td:nth-child(odd) {
	background: #2D98CE;
}

table td:nth-child(even) {
	background: #C9F5F5;
}
</style>
</head>

<body>
<center><h2>个人信息</h2></center>
 <form action="${pageContext.request.contextPath}/Tea_Info.action" method="post">
	<table align="center" border="1" width="50%" height="50%">
		<tr align="center">
			<td width="30%">教师编号</td>
			<td width="70%"><input type="text" name="teacher.tenum" value="${teacher.tenum}" readonly="readonly"/></td>
		</tr>
		<tr align="center">
			<td width="30%">教师名称</td>
			<td width="70%"><input type="text" name="teacher.tename" value="${teacher.tename}"/></td>
		</tr>
		<tr align="center">
			<td width="30%">教师性别</td>
			<td width="70%">
			    <select name="teacher.tesex">
						<s:if test="#session.teacher.tesex=='男'.toString()">
							<option value="男" selected="selected">男</option>
							<option value="女">女</option>
						</s:if>
						<s:else>
							<option value="男">男</option>
							<option value="女" selected="selected">女</option>
						</s:else>
				</select>
			
			
			</td>
		</tr>
		<tr align="center">
			<td width="30%">教师职称</td>
			<td width="70%"><input type="text" name="teacher.tetitle" value="${teacher.tetitle}"/></td>
		</tr>
		<tr align="center">
			<td width="30%">教师专业</td>
			<td width="70%"><input type="text" name="teacher.temajor"  value="${teacher.temajor}"/></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="修改" /><input type="reset" value="重置"/></td>
			</tr>
		
	</table>
	</form>
</body>
</html>
