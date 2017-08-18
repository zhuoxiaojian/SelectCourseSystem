<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
window.onload=function(){
   var Verify = document.getElementById("Verify");
   Verify.onclick=function(){
       Verify.src="${pageContext.request.contextPath}/CodeChange.action?"+new Date().getTime();
   };
};
	 function check(){
	       var username = document.getElementById("username").value;
	       if(username==""){
	           alert('请输入用户名!');
	           return false;
	       }
	       var password = document.getElementById("password").value;
	       if(password==""){
	       	   alert('请输入密码!');
	       	   return false;
	       }
	       var code = document.getElementById("code").value;
	       if(code==""){
	         alert('请输入验证码!');
	         return false;
	       }
	}
	
	function opear(){
 var code = $("#code").val();
 if(code.length>0){
    var code = $("input[name='code']").val();
     $.ajax({
         type: 'post',
         url: '${pageContext.request.contextPath}/Code.action',
        async:true,
        dataType: 'json',
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        data:{
           "code":code
        },
       success:function(data){
       	var data = eval('('+data+')');
					if (data.result == "true"){
					     
					        $("#ss").text("验证码正确"); 
						} else{
						    $("#ss").text("验证码错误");
						}
    }
    });
 }
}
	
	</script>
	
	
	<style type="text/css">
	 body {
    
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color:#F7F7F7 ;
	overflow:hidden;
   }
     #test{width:26%;height:32%; position:absolute;margin:auto;top:1%; left:2%;bottom:0;right:1%;background-color: #0A79BE;}
	
	</style>
	
	<script>
	function openWin(url) {
		var phxWin = window.open(url);
	}
</script>
	
</head>
 
<body>
  <img src="${pageContext.request.contextPath }/images/bg.jpg" width="100%" height="100%" style="z-index:-100;position:absolute;left:0;top:0">
   
	 <form action="${pageContext.request.contextPath}/RegisterAction.action"  method="post">
       <div id="test">
    
		<table border="0" align="center" width="100%"height="100%">
			<tr>
				<th>用户名</th>
				<td><input type="text" id="username" name="username"  title="请输入用户名"/>
				</td>
			</tr>
			<tr>
				<th>密 码</th>
				<td><input type="password" id="password" name="password" title="请输入密码"/>
				</td>
			</tr>
			<tr>
					<th>验证码</th>
					<td><input type="text" id="code" name="code" title="请输入验证码" onkeyup="return opear();"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><img
						src="${pageContext.request.contextPath}/CodeChange.action"
						id="Verify" style="cursor:pointer;" alt="看不清，换一张" /></td>
				</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="提交" onclick="return check();"/>
				&nbsp;&nbsp;
				<input type="button" name="button" id="button" value="注册" onClick="openWin('register.jsp')"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><span id="ss" style="color:red"></span></td>
			</tr>
		</table>
   </div>
	</form> 
	
</body>
</html>
