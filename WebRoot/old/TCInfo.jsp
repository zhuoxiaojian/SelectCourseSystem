<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TCInfo.jsp' starting page</title>
    
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
	
<script>
	function openWin(url, width, height) {
		var phxWin = window.open(url, '', 'width=' + width + ',height='
				+ height + ',left=' + (screen.width - width) / 2 + ',top='
				+ (screen.height - height) / 2 + '');
	}
</script>
  </head>
  
  <body>
   
    <table align="center" border="1" bordercolor="#6FDD00" width="90%" height="70%"
			 cellpadding="0" cellspacing="1">
     <tr align="center" height="80px" style="background-color: #2D98CE;">
     <td>课程编号</td>
     <td>课程名称</td>
     <td>上课地点</td>
     <td>上课时间</td>
     <td>课程类型</td>
     <td>课程学时</td>
     <td>课程学分</td>
     <td>学生人数(点击查看)</td>
     </tr>
     
     <s:iterator value="list" var="tcs">
        <tr align="center" style="background-color: #C9F5F5;">
           <td><s:property value="#tcs.cno"/>   </td>
     <td><s:property value="#tcs.cname"/></td>
     <td><s:property value="#tcs.cplace"/></td>
     <td><s:property value="#tcs.ctime"/></td>
     
     <td><s:property value="#tcs.ctype"/></td>
      <td><s:property value="#tcs.chours"/></td>
     <td><s:property value="#tcs.ccredit"/></td>
     <td><font color="red" size="20"><a
						onClick="openWin('${pageContext.request.contextPath}/JuTi.action?courcno=<s:property
								value="#tcs.cno" />',400,400)"><s:property value="#tcs.stucount"/></a></font></td>
        
        
        </tr>
     
     
     </s:iterator>
    
    </table>
  </body>
</html>
