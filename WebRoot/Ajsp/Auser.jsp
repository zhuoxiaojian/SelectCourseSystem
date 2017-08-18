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
	<title>用户信息管理 </title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/demo.css">
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
		var url;
		var row;
		
		function editUser(){
			row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				
				url = 'adminCommonAction!editUserMethod.action';
			}
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: 'adminCommonAction!editUserMethod.action',
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						$('#dlg').dialog('close');		// close the dialog  关闭小窗口
						$('#dg').datagrid('reload');	// reload the user data  刷新数据显示
					} 
				}
			});
		}
		function removeUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定要删除?',function(r){
					if (r){			
						$.post('adminCommonAction!deleteUserMethod.action?time='+new Date().getTime(),{id:row.id},function(result){
							if (result.success){
								$('#dg').datagrid('reload');
									// reload the user data
									
							} else {
							    $('#dg').datagrid('reload');
								$.messager.show({	// show error message
									title: '删除失败',
									msg: "删除失败"
								});
							}
						},'json');
					}
				});
			}
		}
		
		
		
	</script>
	
</head>
<body>
	<center>
	
	<table id="dg" title="用户信息的管理" class="easyui-datagrid" style="width:1000px;height:500px"
			url="adminCommonAction!getUserData.action"
			toolbar="#toolbar" pagination="true"
			rownumbers="true" fitColumns="true" singleSelect="true"  collapsible="true">
		<thead>
			<tr>
				<th field="id" width="20" hidden="true">编号</th>
				<th field="username" width="20">用户</th>
				<th field="password" width="20">密码</th>
				<th field="power" width="20" >角色</th>
				
			</tr>
		
		</thead>
	</table>
	</center>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
	</div>
	
    <div id="dlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>	
		    <!-- 把ID隐藏着不显示，用于更新信息的情况 -->		
			<div class="fitem" >  
				<label>编号</label>
				<input name="id" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>用户</label>
				<input name="username" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>密码</label>
				<input name="password" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>角色</label>
				<input name="power" class="easyui-validatebox"  required="true" >
			</div>
			
		</form>
	</div>  
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div> 
</body>
</html>
