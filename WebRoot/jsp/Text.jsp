<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'Text.jsp' starting page</title>

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

<body bgcolor="#fff" onload="TimerID2=setTimeout('fLi2()',500)"
	onunload="clearTimeout(TimerID2)">

		<center><h1>系统公告 </h1></center><br>
		    13、14级的各位同学:<br>
			&nbsp;&nbsp;因人文系人才培养方案调整，为保证学院教学资源合理使用，经教务处批准，从即日起选修课网上选课重新进行，只有在网上选择课程以后才能随班上课，课程结束后参加考试。为保证网上选课顺利进行，特此通知并做以下说明：<br>
			
			<b>一、选课对象：</b>2016级四年制，2017级四年制学校学生。<br>
			
			<b>二、选课时间：</b>2017年9月22日12时--2017年9月26日12时。<br>
			
			<b>三、选课步骤： </b><br>
			&nbsp;&nbsp;1、登录学院网站http://localhost:8080/Zhuo，进入“网上选课系统”登陆界面。 <br>
			&nbsp;&nbsp;2、输入自己的登录号和密码，登录号为自己的学籍号，密码默认为1234。<br>
			&nbsp;&nbsp;3、点击“登录”,若提示密码错误，请输入（admin）重新尝试，再不能登录者，请联系系统管理员。<br>
			&nbsp;&nbsp;4、在选课页面有课程及任课教师信息，根据个情况选择课程。<br>
			&nbsp;&nbsp;5、如果想退选已选课程，可以选择退选。（如果已经选修且有成绩，则不能退选了）<br> 
			&nbsp;&nbsp;6、点击“退出系统”，完成整个选课过程。<br>
			
			<b>四、注意事项：</b> <br>
			&nbsp;&nbsp;1、因学院教学资源有限，每个项目都有上课人数限制，项目人数选择满额后则不能再增加人数，请同学们认真、合理选择课程。<br>
			&nbsp;&nbsp;2、为保证选课顺利进行，请各位同学在期限内尽快自己选择项目或老师，勿让其他同学代选，选课过程一经完成，视为学生本人操作，恕不更改。
				
</body>
</html>
