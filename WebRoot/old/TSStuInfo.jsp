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
    
    <title>My JSP 'TSStuInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
  function check(){
    var se=$('input:radio[name="cid"]:checked').val();
    var res = $('input[name="result"]').val();
    if(se==null){
      alert("请选择单选按钮");
      return false;
    }if(res==null||res==""){
       alert("请选择输入成绩");
      return false;
    }
  }


</script>
  </head>
  
  <body>
  <center>
  <form action="${pageContext.request.contextPath}/RuResul.action" method="post">
  <table align="center" border="1" bordercolor="#6FDD00" width="80%"
			height="80%" cellpadding="0" cellspacing="1">
			<caption><font color="blue" size="6">学生信息</font></caption>
   <tr align="center" style="background-color: #2D98CE;">
   <td>教师编号</td>
   <td>学生编号</td>
   <td>学生姓名</td>
   <td>课程编号</td>
   <td>课程名称</td>
   <td>课程类型</td>
   <td>课程成绩</td>
   </tr>
   
   <s:iterator value="lfss" var="info">
     <tr align="center" style="background-color: #C9F5F5;">
      
        <td><s:property value="#info.id.course.teacher.tenum" /></td>
        <td><s:property value="#info.id.student.stunum" /></td>
         <td><s:property value="#info.id.student.stuname" /></td>
         <td><s:property value="#info.id.course.cno" /></td>
         <td><s:property value="#info.id.course.cname" /></td>
         <td><s:property value="#info.id.course.ctype" /></td>
         <s:if test="#info.result!=null">
         <td><s:property value="#info.result"/></td>
         </s:if><s:else>
           <td>
           <input type="text" name="result" value="<s:property value="#info.result"/>"/>
           <input type="radio" name="cid" value="<s:property value="#info.id.course.cno" />_<s:property value="#info.id.student.stunum" />" />
           
           </td>
         
         </s:else>
         
     </tr>
   </s:iterator>
    <tr>
     <td colspan="7" align="center"><input type="submit" value="录入" onclick="return check();"/> <input type="reset" value="重置"/> </td>
    </tr>
  
  </table>
  </form>
  </center>

  <div align="center" class="divfen">
			<span class="STYLE2">一共<span id="total">${page.totalSize}</span>条记录.||.一共${page.totalPage
				}页.</span><br> <a href="<%=basePath%>pageTSList.action?page.nowPage=1">首页</a>
			<a href="<%=basePath%>pageTSList.action?page.nowPage=${page.nowPage-1}">上一页</a>
			| <a
				href="<%=basePath%>pageTSList.action?page.nowPage=${page.nowPage+1}">下一页</a>
			| <a
				href="<%=basePath%>pageTSList.action?page.nowPage=${page.totalPage}">尾页</a>
		</div>
   
  </body>
</html>
