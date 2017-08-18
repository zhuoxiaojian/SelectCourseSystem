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
<title>用户注册</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	function check() {
		var pow = $('#pow option:selected').val();
		var username = $('input[name="username"]').val();
		if (pow == "学生") {
			if (username != null && username != "") {
				$.post('adminCommonAction!registerST.action', {
					rpow : pow,
					rname : username
				}, function(result) {
					$('#s').empty();
					if (result.success) {
						$('#s').append(result.message);
					} else {
						$('#s').append(result.message);

					}
				});
			}
		}
		if (pow == "教师") {
			if (username != null && username != "") {
				if (username != null && username != "") {
					$.post('adminCommonAction!registerST.action', {
						rpow : pow,
						rname : username
					}, function(result) {
						$('#s').empty();
						if (result.success) {
							$('#s').append(result.message);
						} else {
							$('#s').append(result.message);

						}
					});
				}

			}
		}
	}

	function checkpwd() {
		var password = $('input[name="password"]').val();
		var pwd = $('input[name="pwd"]').val();
		if (password != null || password != "") {
			$('#s1').empty();
			if (password != pwd) {
				$('#s1').append("两次密码不一致，请重新输入");
				return false;
			}
			if (password == pwd) {
				$('#s1').append("两次密码一致，请点击注册！");
				return true;
			}
		}
	}

	function register() {
		var pow = $('#pow option:selected').val();
		var username = $('input[name="username"]').val();
		var pwd = $('input[name="pwd"]').val();
		if ((username != null || username != "") && (pwd != null || pwd != "")) {
			$.post('adminCommonAction!register.action', {
				ppow : pow,
				pname : username,
				ppp : pwd
			}, function(result) {
				$('#s2').empty();
				if (result.success) {
					$('input[name="username"]').val("");
					$('input[name="pwd"]').val("");
					$('input[name="password"]').val("");
					$('#s').empty();
					$('#s1').empty();
					$('#s2').append(result.message);

				} else {
					$('input[name="username"]').val("");
					$('input[name="pwd"]').val("");
					$('input[name="password"]').val("");
					$('#s').empty();
					$('#s1').empty();
					$('#s2').append(result.message);

				}
			});
		}
	}
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
}
</style>
</head>

<body >
<%-- 	<img src="${pageContext.request.contextPath }/imgs/AA.jpg" width="100%"
		height="100%" style="z-index:-100;position:absolute;left:0;top:0"> --%>
		<div class="block" style="height: 300px;">
			<div class="centered">
				<table align="center" border="1">
					<caption>用户注册</caption>
					<tr align="center">
						<td>你的身份</td>
						<td><select name="pow" id="pow">
								<option value="学生" selected="selected">学生</option>
								<option value="教师">教师</option>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td align="center">用户名</td>
						<td><input type="text" name="username" onchange="check();">
						</td>
						<td><span id="s"></span>
						</td>
					</tr>
					<tr align="center">
						<td>用户密码</td>
						<td><input type="password" name="password">
						</td>
						<td></td>
					</tr>
					<tr align="center">
						<td>确认密码</td>
						<td><input type="password" name="pwd"
							onkeyup="return checkpwd();">
						</td>
						<td><span id="s1"></span>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="提交" onclick="register();">
						</td>
						<td></td>
					</tr>
				</table>
				<center>
					<span id="s2"></span>
				</center>
			</div>
		</div>
</body>
</html>
