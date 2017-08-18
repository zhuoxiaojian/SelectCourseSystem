<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'param.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui/demo.css">
  <script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
  
  <script type="text/javascript">
	var dataGrid;
	$(function() {
		//查询列表	
		dataGrid = $('#dataGrid').datagrid({
			url : '${pageContext.request.contextPath}/adminCommonAction!getTeacherData.action',
			striped : true,
			width:1000,
			height:500,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			fitColumns: true,
			loadMsg:'数据加载中.....',
			nowrap : false,
			idField : 'tenum',
			sortName : 'tenum',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 15, 20, 30 ],
			columns : [[{width : $(this).width() * 0.1,title : '教师编号',field : 'tenum',align : 'center',sortable : true}, 
						{width : $(this).width() * 0.1,title : '教师名称',field : 'tename',align : 'center',sortable : true},
						{width : $(this).width() * 0.1,title : '教师性别',field : 'tesex',align : 'center',sortable : true},
						{width : $(this).width() * 0.1,title : '教师职称',field : 'tetitle',align : 'center',sortable : true},
						{width : $(this).width() * 0.12,title : '教师专业',field : 'temajor',align : 'center'}
					]],
			toolbar : '#toolbar'
		});
	});

	//搜索
	function searchFun() {
		var options = dataGrid.datagrid('options');
		//获取查询参数
		var tenum=$('[name="tenum"]').val();
		var tename=$('[name="tename"]').val();
		var tesex=$('[name="tesex"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getTeacherByMoreParam.action';
		options.queryParams = { 
				tenum: tenum, 
				tename: tename, 
				tesex:tesex 
		};
		//触发搜索
		dataGrid.datagrid(options);
	}
	
	//重置
	function reloadFun() {
		$("#tenum").val("");
		$("#tename").val("");
		$("#tesex").val("");
		//刷新查询
		dataGrid.datagrid('reload');
		dataGrid.datagrid('clearChecked');
	}
	</script>
  </head>
  
  <body class="easyui-layout" data-options="fit:false,border:true">
	<center>
	<div data-options="region:'center',fit:false,border:true" >
		<table id="dataGrid" data-options="fit:false,border:true"></table>
	</div>

	<div id="toolbar" style="display: none;" class="datagrid-toolbar">
		<table data-options="fit:false,border:false">
			<tr>
				<td>教师编号</td>
				<td><input id="tenum" name="tenum" type="text" placeholder="请输入教师编号" class="span2" value=""/></td>
				<td>教师名称</td>
				<td><input id="tename" name="tename" type="text" placeholder="请输入教师名称" class="span2" value=""/></td>
				<td>教师性别</td>
				<td><input id="tesex" name="tesex" type="text" placeholder="请输入教师性别" class="span2" value=""/></td>
			</tr>
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	</div>
	</center>
</body>
</html>
