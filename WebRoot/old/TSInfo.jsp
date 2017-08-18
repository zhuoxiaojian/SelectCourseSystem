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
    
    <title>My JSP 'TSInfo.jsp' starting page</title>
    
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

</style>
    <script>  
    window.onload=function(){  
        //三秒钟后窗体自动关闭  
        window.setTimeout("window.close()","9000");  
    };  
    </script>


 
  </head>
  
  <body>
         <table align="center" border="1" width="80%" height="60%">
         <caption>人数统计</caption>
           <tr style="background-color: #00FF40;">
           <td>学生编号</td>
           <td>学生姓名</td>
           <td>学生班级</td>
           </tr>
           <s:iterator value="lll" var="sc" status="st">
             <tr style="background-color: #C9F5F5;">
               <td><s:property value="#sc.id.student.stunum"/>
               <td><s:property value="#sc.id.student.stuname"/>
               <td><s:property value="#sc.id.student.stuclass"/>
             </tr>
           
           
           </s:iterator>
         
         
         </table>
  </body>
</html>
