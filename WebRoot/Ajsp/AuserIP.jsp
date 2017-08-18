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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description"
	content="easyui help you build your web page easily!">
<title>userIP信息</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/demo.css">
<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	color: #666;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}
</style>
<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
    //搜索
	function searchFun() {
	
		var options = $('#dg').datagrid('options');
		//获取查询参数
		var username=$('[name="username"]').val();
		var firstTime=$('[name="firstTime"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getUserIpByParam.action';
		options.queryParams = { 
				uname: username, 
				ftime: firstTime
		};
		//触发搜索
		$('#dg').datagrid(options);
	}
	
	//重置
	function reloadFun() {
		$("#username").val("");
		$("#firstTime").val("");
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}
	
	function Tostatus(value){
	   if(value){
	      return "访问成功";
	   }if(!value){
	      return "访问失败";
	   }
	}
</script>
</head>
<body>
	<center>
		
		<table id="dg" title="用户访问情况" class="easyui-datagrid"
			style="width:1000px;height:500px"
			url="adminCommonAction!getUserIpData.action"
			toolbar="#toolbar" pagination="true" rownumbers="true"
			fitColumns="true" singleSelect="true"  collapsible="true"
			cache="false"
			>
			<thead>
				<tr>
					<th field="id" width="20" hidden="true">编号</th>
					<th field="username" width="20">访问用户</th>
					<th field="visitIp" width="20" >访问Ip</th>
					<th field="firstTime" width="20">访问时间</th>
					<th field="visitBrowser" width="20">浏览器</th>
					<th field="visitSystem" width="20">操作系统</th>
					<th field="visitStatus" width="20" formatter="Tostatus">状态</th>
				</tr>
			</thead>
		</table>
	</center>
	<div id="toolbar">
	    <table data-options="fit:true,border:false">
			<tr>
				<td>用户名</td>
				<td><input id="username" name="username" type="text" placeholder="请输入用户名" class="span2" value=""/></td>
				<td>访问时间</td>
				<td><input id="firstTime" name="firstTime" type="text" placeholder="请输入访问时间" class="span2" onclick="setDay(this);" value=""/></td>
				</tr>
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	
	</div>
</body>
</html>
<!--  -->