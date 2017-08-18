<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html>
<head>

<title>欢迎使用选课系统</title>
	<script language="javascript">
		if (self != top) {
			top.location = self.location;
		}
     </script>
     
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(${pageContext.request.contextPath}/images/login_09.gif);
	background-repeat: repeat;
}

input {
	background-image: url(${pageContext.request.contextPath}/images/butbg.gif);
	background-repeat: repeat-x;
	height: 16px;
	border: 1px solid #cccccc;
	width: 140px;
}

.main {
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	width: 1024px;
}

.content {
	background-image: url(${pageContext.request.contextPath}/images/33.png);
	background-repeat: no-repeat;
	height: 343px;
	width: 330px;
	z-index: 10;
	margin-left: 612px;
	position: absolute;
	margin-top: -29px;
	padding-top: 30px;
	font-size: 12px;
	font-weight: normal;
	color: #990000;
}

.dl {
	font-size: 13px;
	font-weight: bold;
	color: #5687BE;
}

.ts { /*border:1px dashed #92ccf5;*/
	width: 280px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	padding: 5px;
	color: #000000;
	line-height: 20px;
}

.login {
	height: 100px;
	width: 100px;
}

.head {
	background-image: url(${pageContext.request.contextPath}/images/22.png);
	background-repeat: no-repeat;
	height: 108px;
	width: auto;
	margin-top: 10px;
}

.center {
	background-image: url(${pageContext.request.contextPath}/images/login_05.gif);
	background-repeat: repeat;
	height: 286px;
	width: 10px;
}

.bottom {
	font-size: 12px;
	font-weight: bold;
	color: #01669a;
	height: auto;
	width: 600px;
	margin-top: 20px;
	float: left;
	margin-left: 15px;
	line-height: 18px;
}

.bottd {
	border-bottom-width: 1px;
	border-bottom-style: dotted;
	border-bottom-color: #000000;
}

.lcenter {
	background-image: url(${pageContext.request.contextPath}/images/login_06.gif);
	background-repeat: no-repeat;
	height: 286px;
	width: 973px;
}

.STYLE1 {
	color: #D82C27
}
-->
</style>

	<script type="text/javascript">
	//表单提交
	
	function form_submit() {
		var userName = document.getElementById("username").value;
		if (userName == "" || userName == null) {
			alert("请输入用户名！");
			document.getElementById("username").focus();
			return false;
		}

		var strPass = document.getElementById("password").value;
		if (strPass == "" || strPass == null) {
			alert("请输入登录密码！");
			document.getElementById("password").focus();
			return false;
		}

		var checkCode = document.getElementById("code").value;
		if (checkCode == "" || checkCode == null) {
			alert("请输入验证码！");
			return false;
		}
         var myTime  = new Date();
         var day = myTime.getDay();
         var month = myTime.getMonth();
        if(day==0){
           window.alert("对不起请在周一到周五登陆！！！");
        }else{
		    document.getElementById("loginForm").submit();
		    }
	}

	//表单重置
	function form_reset() {
		document.getElementById("loginForm").reset();
	}

	//添加验证码
	var first = true;
	function addCheckCode() {
		if (first) {
			var yzmObj = document.getElementById("yzmObj");
			yzmObj.innerHTML = '<img src="${pageContext.request.contextPath}/CodeChange.action" width="80px" height="20px" title="点击更新验证码" onclick="refreshCheckCode(this);" style="cursor: hand" />';
			first=false; 
		}
	}

	//刷新验证码 function
	function refreshCheckCode(checkCodeImg) {
		checkCodeImg.src="${pageContext.request.contextPath}/CodeChange.action?now=" + new Date();
	}
	</script>
</head>



<body>
	<div class="main">
		<div class="head"></div>
		<div style="height: 1px; clear: both;"></div>
		<div class="content">
			<form id="loginForm" action="${pageContext.request.contextPath}/RegisterAction.action" method="post">
				<table border="0" align="center" cellpadding="2" cellspacing="0">
					<tr>
						<td colspan="2" style="height: 30px">
							<div>&nbsp;&nbsp;</div>
						</td>
						</tr>
							<tr>
								<td align="right" class="dl">用户名：</td>
								<td style="width: 200px"><input type="text" id="username"
									name="username" />
								</td>
							</tr>
							<tr>
								<td align="right" class="dl">密 码：</td>
								<td><input type="password" id="password" name="password" />
								</td>
							</tr>
							<tr>
								<td align="right" class="dl">验证码：</td>
								<td style="line-height: 25px; height: 25px">
									<div>
										<div style="float: left"><input type="text" id="code" name="code"
											onfocus="addCheckCode()" style="width: 60px" /></div>
										<div style="float: left" id="yzmObj"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td height="20" colspan="2"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><img
									src="${pageContext.request.contextPath}/images/but1.gif" style="cursor: hand"
									onclick="form_submit()" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									src="${pageContext.request.contextPath}/images/but2.gif" style="cursor: hand"
									onclick="form_reset()" />
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><a href="${pageContext.request.contextPath}/register.jsp" >注册</a>&nbsp;<a href="${pageContext.request.contextPath }/index.jsp" >管理员登录</a>
								</td>
							</tr>
				</table>
				<%-- <s:token></s:token> --%>
			</form>
		</div>

		<div class="center">
			<div class="lcenter"></div>
		</div>

		<div style="height: 1px; clear: both;"></div>
		<div class="bottom">
			选课须知：<br> 1. 选课前请务必仔细阅读选课规则和选课使用帮助。<br /> <span class="STYLE1">
					2.本选课系统统一使用自己的编号和密码。
					<br /> </span> 如果密码不对，请带学生证到管理员中心重置密码；<br />

				<span class="STYLE1">3.
					选课结束后，请点击选课界面右上方的“退出登录”或者关闭所有浏览器窗口，以免后面的同学篡改您的选课结果。</span>
		</div>
	</div>
	<div style="height: 10px; clear: both;"></div>
	

</body>
</html>
