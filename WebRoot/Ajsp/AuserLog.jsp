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
<title>系统日志</title>
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
		var actionID = $('[name="actionID"]').val();
		var actionTime = $('[name="actionTime"]').val();
		var actionName = $('#actionName option:selected').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getUserLogByParam.action';
		options.queryParams = {
			aID : actionID,
			aname:actionName,
			atime : actionTime
			
		};
		//触发搜索
		$('#dg').datagrid(options);
	}

	//重置
	function reloadFun() {
		$("#actionID").val("");
		$("#actionTime").val("");
		$("#actionName").val("");
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}
</script>
</head>
<body>
	<center>

		<table id="dg" title="系统日志" class="easyui-datagrid"
			style="width:1000px;height:500px"
			url="adminCommonAction!getUserLogData.action" toolbar="#toolbar"
			pagination="true" rownumbers="true" fitColumns="true"
			singleSelect="true" collapsible="true" cache="false">
			<thead>
				<tr>
					<th field="id" width="20" hidden="true">编号</th>
					<th field="actionID" width="20">用户编号</th>
					<th field="actionName" width="20">操作类型</th>
					<th field="actionMessage" width="20">具体操作</th>
					<th field="actionIp" width="20">操作Ip</th>
					<th field="actionSystem" width="20">操作系统</th>
					<th field="actionBrowser" width="20">浏览器</th>
					<th field="actionTime" width="20">操作时间</th>
				</tr>
			</thead>
		</table>
	</center>
	<div id="toolbar">
		<table data-options="fit:true,border:false">
			<tr>
				<td>用户名</td>
				<td><input id="actionID" name="actionID" type="text"
					placeholder="请输入用户名" class="span2" value="" />
				</td>
				<td>操作类型</td>
				<td><select id="actionName" name="actionName">
						<option value="" selected="selected">--操作类型--</option>
						<option value="登录">登录</option>
						<option value="退出">退出</option>
						<option value="插入">插入</option>
						<option value="更新">更新</option>
						<option value="删除">删除</option>
						<option value="上传">上传</option>
						<option value="导入">导入</option>
						<option value="导出">导出</option>
				</select></td>

				<td>操作时间</td>
				<td><input id="actionTime" name="actionTime" type="text"
					placeholder="请输入操作时间" class="span2" onclick="setDay(this);"
					value="" />
				</td>
			</tr>
		</table>
		<a onclick="searchFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-search'">查询</a> <a
			onclick="reloadFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon-reload'">重置</a>

	</div>
</body>
</html>
<!--  -->