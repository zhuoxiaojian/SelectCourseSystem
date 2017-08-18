<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<center><h2>个人信息</h2></center>
	<form action="${pageContext.request.contextPath}/xiugai.action" method="post" enctype="multipart/form-data">
		<table align="center" border="1"  width="50%"
			height="50%" cellpadding="0" cellspacing="0" >
			<tr height="40px">
				<td width="30%" align="center">学号</td>
				<td width="70%" align="center"><input type="text"
					name="stu.stunum" value="${stu.stunum}"  readonly="readonly"/>
				</td>
			</tr>

			<tr height="40px">
				<td width="30%" align="center">姓名</td>
				<td width="70%" align="center"><input type="text"
					name="stu.stuname" value="${stu.stuname}" />
				</td>
			</tr>

			<tr height="40px">
				<td width="30%" align="center">性别</td>
				<td width="70%" align="center"><select name="stu.stusex">
						<s:if test="#session.stu.stusex=='男'.toString()">
							<option value="男" selected="selected">男</option>
							<option value="女">女</option>
						</s:if>
						<s:else>
							<option value="男">男</option>
							<option value="女" selected="selected">女</option>
						</s:else>
				</select>
				</td>
			</tr>

			<tr height="40px">
				<td width="30%" align="center">出生日期</td>
				<td width="70%" align="center"><input type="text" readonly="readonly"
					name="stu.stubirth" value="${stu.stubirth}" onclick="setDay(this);"/>
				</td>
			</tr>

			<tr height="40px">
				<td width="30%" align="center">入学时间</td>
				<td width="70%" align="center"><input type="text" readonly="readonly"
					name="stu.stuadim" value="${stu.stuadim}" onclick="setDay(this);"/>
				</td>
			</tr>


			<tr height="40px">
				<td width="30%" align="center">专业</td>
				<td width="70%" align="center"><input type="text"
					name="stu.stumajor" value="${stu.stumajor}" />
				</td>
			</tr>

			<tr height="40px">
				<td width="30%" align="center">班级</td>
				<td width="70%" align="center"><input type="text"
					name="stu.stuclass" value="${stu.stuclass}" />
				</td>
			</tr>


			<tr height="40px">
				<td width="30%" align="center">院系</td>
				<td width="70%" align="center"><input type="text"
					name="stu.stucollege" value="${stu.stucollege}" />
				</td>
			</tr>
		</table>
		            <center>
				    <input type="submit" value="修改" />
					<input type="reset" value="重置" />
					</center>
	</form>
</body>
</html>