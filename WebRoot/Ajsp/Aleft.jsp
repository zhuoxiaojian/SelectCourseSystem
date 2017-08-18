<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SimpleTree</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/tree_themes/SimpleTree.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/SimpleTree.js"></script>
<script type="text/javascript">
$(function(){
	$(".st_tree").SimpleTree( {
		click:function(a){
			if(!$(a).attr("hasChild"))
				window.location.href($(a).attr("href"));
		}
	} );
});
</script>
</head>
<body>
<center>${username}</center>
<div class="st_tree" style="float: left">
<ul>
	<li><a href="#" ref="hyjm">欢迎界面</a></li>
	    <ul show="true"><li><a href="<%=basePath%>Ajsp/Afirst.jsp" target="mainFrame" ref="sy">首页</a></li></ul>
	<li><a href="#" ref="xtgl">系统管理</a></li>
    <ul >
		<li><a href="${pageContext.request.contextPath}/Ajsp/Auser.jsp" target="mainFrame" ref="yhgl">用户管理</a></li>
		<li><a href="${pageContext.request.contextPath}/jsp/updatePwd.jsp" target="mainFrame" ref="mmxg">密码修改</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/AuserIP.jsp" target="mainFrame" ref="yhip">访问情况</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/AuserLog.jsp" target="mainFrame" ref="xtrz">系统日志</a></li>
	</ul>
	<li><a href="#" ref="xxgl">信息管理</a></li>
    <ul>
		<li><a href="${pageContext.request.contextPath}/Ajsp/Astudent.jsp" target="mainFrame" ref="xsgl">学生管理</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/Ateacher.jsp" target="mainFrame" ref="jsgl">教师管理</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/Acourse.jsp" target="mainFrame" ref="kcgl">课程管理</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/ASCM.jsp" target="mainFrame" ref="xkgl">选课管理</a></li>
	</ul>
	<li><a href="#" ref="xxcx">信息查询</a></li>
	    <ul>
        <li><a href="${pageContext.request.contextPath}/Ajsp/FindMore.jsp" target="mainFrame" ref="hhcx">混合查询</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/AStuCou.jsp" target="mainFrame" ref="xsvskc">学生课程</a></li>
       </ul>
	<li><a href="#" ref="rstj">统计报表</a></li>
	    <ul>
        <li><a href="${pageContext.request.contextPath}/Ajsp/Aclasscount.jsp" target="mainFrame" ref="bjrs">班级人数</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/Aseledcount.jsp" target="mainFrame" ref="xkrs">选课人数</a></li>
		<li><a href="${pageContext.request.contextPath}/Ajsp/Astudentseledcount.jsp" target="mainFrame" ref="xsxk">学生选课</a></li>
       <li><a href="${pageContext.request.contextPath}/Ajsp/Aresulttongji.jsp" target="mainFrame" ref="cjtj">成绩统计</a></li>
       </ul>
          <li><a href="#" ref="drxx">导入信息</a></li>
		   <ul>
		      <li><a href="${pageContext.request.contextPath}/Ajsp/TestExcel.jsp" target="mainFrame" ref="xxdr">信息导入</a></li>
		   </ul>
		<li><a href="#" ref="tcxt">退出系统</a></li>
		   <ul>
		      <li><a href="${pageContext.request.contextPath}/Exit.action" target="_top" ref="tcxt">退出系统</a></li>
		   </ul>
</ul>
</div>

</body>
</html>

