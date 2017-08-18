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

<title>My JSP 'courseList.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>

<script>
	function openWin(url, width, height) {
		var phxWin = window.open(url, '', 'width=' + width + ',height='
				+ height + ',left=' + (screen.width - width) / 2 + ',top='
				+ (screen.height - height) / 2 + '');
	}
</script>

<script type="text/javascript">
 $(document).ready(function(){
	    $("#xuan").click(function(){
 var se=$('input:radio[name="select"]:checked').val();
 if(se==null){
      alert("请选择");
      return false;
 }else{
    var select = $('input:radio[name="select"]:checked').val();
     $.ajax({
         type: 'post',
         url: '${pageContext.request.contextPath}/Select_Course.action',
        async:true,
        dataType: 'json',
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        data:{
           "select":select
           
        },
       success:function(data){
       	var data = eval('('+data+')');
					if (data.result == "true"){
					        $('input:radio[name="select"]:checked').removeAttr("checked");
					        $("#ss").text("选课成功"); 
					       
						} else{
						$('input:radio[name="select"]:checked').removeAttr("checked");
						    $("#ss").text("该课程已经选过了");
						}
    }
    });
 }
});}
);

</script>




</head>
<body >
	<center>
		<font color="green" style="font-size: 30px">课程信息</font><br />

		<form action="${pageContext.request.contextPath}/pageCanList.action"
			method="post">
			<table>
				<tr>
					<td
						background="${pageContext.request.contextPath}/images/tab_05.gif">

						课程编号:<input type="text" name="cono" value="${cono}" />&nbsp; 课程类型:<input
						type="text" name="cotype" value="${cotype}"/>&nbsp; 上课时间:<select name="cotime">
							<option value="" selected="selected">&nbsp;</option>
							<option value="上午">上午</option>
							<option value="下午">下午</option>
							<option value="晚上">晚上</option>
					</select>&nbsp; <input type="submit" value="查询" /></td>
				</tr>
			</table>
		</form>

	</center>





	<%-- <form action="${pageContext.request.contextPath}/Select_Course.action"
		method="post"> --%>
		<table align="center" border="1" width="80%" height="60%"
			cellpadding="0" cellspacing="1">

			<tr bgcolor="#2F98CB" height="40px" align="center">
				<th>课程编号</th>
				<th>课程名称</th>
				<th>授课老师(点击查看)</th>
				<th>课程类型</th>
				<th>上课时间</th>
				<th>上课地点</th>
				<th>学时</th>
				<th>学分</th>
				<th>选课</th>
			</tr>
			<s:iterator value="list" var="course">
				<tr bgcolor="#C9F5F5" height="40px" align="center">
					<td><s:property value="#course.cno" /></td>
					<td><s:property value="#course.cname" /></td>
					<td><a
						onClick="openWin('${pageContext.request.contextPath}/Teacher_info.action?tenum=<s:property
								value="#course.teacher.tenum" />',400,400)">
							<s:property value="#course.teacher.tenum" /> </a></td>
					<td><s:property value="#course.ctype" /></td>
					<td><s:property value="#course.ctime" /></td>
					<td><s:property value="#course.cplace" /></td>
					<td><s:property value="#course.chours" /></td>
					<td><s:property value="#course.ccredit" /></td>
					<td><input type="radio" name="select" id="select"
						value="<s:property value="#course.cno" />" /></td>
				</tr>
			</s:iterator>

		</table>

		<center>
			<input id="xuan" type="button" value="确定" /><br>
		<span id="ss" style="color:red" ></span>
		</center>
	<!-- </form> -->
	<div align="center" class="divfen">
			<span class="STYLE2">一共<span id="total">${page.totalSize}</span>条记录&nbsp;|&nbsp;一共${page.totalPage
				}页.</span><br> <a href="<%=basePath%>pageList.action?page.nowPage=1">首页</a>
			<a href="<%=basePath%>pageList.action?page.nowPage=${page.nowPage-1}">上一页</a>
			| <a
				href="<%=basePath%>pageList.action?page.nowPage=${page.nowPage+1}">下一页</a>
			| <a
				href="<%=basePath%>pageList.action?page.nowPage=${page.totalPage}">尾页</a>
		</div>

</body>
</html>
