<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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

<title>My JSP 'updatePwd.jsp' starting page</title>

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

<script type="text/javascript">
  function check(){
    var oldpwd = document.getElementById("oldpwd").value;
    var newpwd = document.getElementById("newpwd").value;
    if(newpwd == ""){
       alert("新密码不能为空!");
       return false;
    }
  
  };
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script>
function opear(){
 var oldpwd = $("#oldpwd").val();
 if(oldpwd.length>0){
    var oldpwd = $("input[name='oldpwd']").val();
     $.ajax({
         type: 'post',
         url: '${pageContext.request.contextPath}/oldpwd.action',
        async:true,
        dataType: 'json',
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        data:{
           "oldpwd":oldpwd
        },
       success:function(data){
       	var data = eval('('+data+')');
					if (data.result == "true"){
					     
					        $("#ss").text("旧密码正确"); 
						} else{
						    $("#ss").text("旧密码错误");
						}
    }
    });
 }
}







$(document).ready(function(){
	    $("#denglu").click(function(){
 var newpwd = $("#newpwd").val();
 var oldpwd = $("#oldpwd").val();
 if(newpwd.length>0){
    var oldpwd = $("input[name='oldpwd']").val();
    var newpwd = $("input[name='newpwd']").val();
     $.ajax({
         type: 'post',
         url: '${pageContext.request.contextPath}/UpPwd.action',
        async:true,
        dataType: 'json',
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        data:{
           "newpwd":newpwd,
           "oldpwd":oldpwd
        },
       success:function(data){
       	var data = eval('('+data+')');
					if (data.result == "true"){
					        $("#ss").text("密码修改成功"); 
					       
						} else{
						    $("#ss").text("密码修改失败");
						}
    }
    });
 }
});}
);
</script>
<style type="text/css">
.block {
  text-align: center;
}

.block:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -0.25em; /* Adjusts for spacing */
}

.centered {
  display: inline-block;
  vertical-align: middle;
  width: 50%;
  height: 50%;
}

</style>
</head>

<body >
 <%-- <img src="${pageContext.request.contextPath }/imgs/AA.jpg" width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0"> --%>
	<center>
	<div class="block" style="height: 300px;">

    <div class="centered" >
        <h3>修改密码</h3>
        <table border="1" align="center">
				<tr>
					<td>旧密码:</td>
					<td><input type="password" name="oldpwd" id="oldpwd" onkeyup="return opear();" /></td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td><input type="password" name="newpwd" id="newpwd" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input id="denglu" type="submit" value="确定" />
					</td>
				</tr>

			</table>
    </div>

</div>
 <span id="ss" style="color:red"></span>
 <s:fielderror cssStyle="color:red"/>
	</center>
</body>
</html>
