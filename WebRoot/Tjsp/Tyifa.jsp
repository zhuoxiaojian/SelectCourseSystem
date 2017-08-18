<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>已发课程 </title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/demo.css">
	
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			color:#666;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	   function find(){
	    var url = 'adminCommonAction!getSInfo.action';
	     var row = $('#dg').datagrid('getSelected');
	     if(row){
	        $.post(
	         url,
	         {courcno:row.cno},
	         function(result){
	            if(result.success){
	            $('#s').empty();
	             $('#dlg').dialog('open').dialog('setTitle','查看');
	               $('#s').append("<table id='tb' width='200px' height='100px' border='1'><tr><td>学号</td><td>姓名</td><td>班级</td></tr></table>");
	                $(result.list).each(function (i, value) {  
	                   $('#tb').append("<tr><td>"+value.id.student.stunum+"</td><td>"+value.id.student.stuname+"</td><td>"+value.id.student.stuclass+"</td></tr>");
	                });
	            }
	         }
	          );
	     }
	   }
	
	</script>
	
</head>
<body>
	<center>
	<table id="dg" title="已发课程" class="easyui-datagrid" style="width:1000px;height:500px"
			url="adminCommonAction!getTCSData.action"
			toolbar="#toolbar" pagination="true"  collapsible="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="cno" width="20">课程编号</th>
				<th field="cname" width="20">课程名称</th>
				<th field="ctype" width="20">课程类型</th>
			
				<th field="ctime" width="20">上课时间</th>
				<th field="cplace" width="20">上课地点</th>
				<th field="chours" width="20">课程学时</th>
				<th field="ccredit" width="20">课程学分</th>
				<th field="stucount" width="20">学生数</th>
			</tr>
		</thead>
	</table>
	</center>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="find()">查看</a>
	</div>
	 <div id="dlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
			<center><span id="s"></span></center>
			
	</div>
   
</body>
</html>
