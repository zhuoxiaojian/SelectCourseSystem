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

<title>My JSP 'selectedList.jsp' starting page</title>

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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
	
<script type="text/javascript">
  function check(){
    var se=$('input:radio[name="selected"]:checked').val();
    if(se==null){
      alert("请选择");
      return false;
    }
  }


</script>
</head>

<body>
  <hr>
	<form
		action="${pageContext.request.contextPath}/dele_Selected_Course.action"
		method="post">
		<table align="center" border="1" width="80%" height="80%"
			cellpadding="0" cellspacing="1" style="background-color:#C9F5F5">
			
			<tr bgcolor="#66F84B" height="40px" align="center">
				<td>编 号</td>
				<td>课程编号</td>
				<td>课程名称</td>
				<td>授课老师</td>
				<td>课程类型</td>
				<td>上课时间</td>
				<td>上课地点</td>
				<td>学时</td>
				<td>学分</td>
				<td>成绩</td>
				<td>退选</td>
			</tr>

			<s:iterator value="%{list2 }" id="course" status="st">

				<tr height="40px" align="center">
					<td><s:property value="#st.index+1" /></td>
					<td><s:property value="#course.id.course.cno" /></td>
					<td><s:property value="#course.id.course.cname" /></td>
					<td><s:property value="#course.id.course.teacher.tenum" /></td>
					<td><s:property value="#course.id.course.ctype" /></td>
					<td><s:property value="#course.id.course.ctime" /></td>
					<td><s:property value="#course.id.course.cplace" /></td>
					<td><s:property value="#course.id.course.chours" /></td>
					<td><s:property value="#course.id.course.ccredit" /></td>
					<td><font color="red" size="5"><s:property
								value="#course.result" />
					</font></td>
					<s:if test="#course.result!=null">
						<td></td>
					</s:if>
					<s:else>
						<td><input type="radio" name="selected" id="selected"
							value="<s:property value="#course.id.course.cno" />" /></td>
					</s:else>
			</tr>
			</s:iterator>
		</table>
		<br />
		<hr />
		<div id="div" align="center">
			<input type="submit" value="退选" onclick="return check();"/>
		</div>
	</form>




</body>
</html>
