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
<title>教师信息的管理</title>
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
	var url;
	var row;
	function newUser() {
		$('#dlg').dialog('open').dialog('setTitle', '新增');
		$.post(
			    'adminCommonAction!getTeaMaxNum.action',
			    function(result){
			       $('#s').empty();
			       $('#sd').removeAttr("hidden");
			       $('#s').append("当前最大的教师编号为："+result.MaxNum);
			      
			    }
			  );
		$('#fm').form('clear');
		url = 'adminCommonAction!addteMethod.action';
	}
	function editUser() {
		row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '编辑');
			$('#fm').form('load', row);
			url = 'adminCommonAction!editteMethod.action';
		}
	}
	function saveUser() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$('#dlg').dialog('close'); // close the dialog  关闭小窗口
					$('#dg').datagrid('reload'); // reload the user data  刷新数据显示
				} else {
					$.messager.show({
						title : '该教师编号已存在，添加失败',
						msg : "该教师编号已存在，添加失败"
					});
				}
			}
		});
	}
	function removeUser() {
		var row = $('#dg').datagrid('getSelected');

		if (row) {
			$.messager.confirm('Confirm', '确定要删除?', function(r) {
				if (r) {
					$.post('adminCommonAction!deleteteMethod.action?time='
							+ new Date().getTime(), {
						tenum : row.tenum
					}, function(result) {
						if (result.success) {
							$('#dg').datagrid('reload');
							// reload the user data

						} else {
							$('#dg').datagrid('reload');
							$.messager.show({ // show error message
								title : '删除失败',
								msg : "删除失败"
							});
						}
					}, 'json');
				}
			});
		}
	}
</script>

<script type="text/javascript">
  function FindData(){
    var rows=$('#dg').datagrid('getRows'),rst=[];
    var tesex = $('#tesex').val();
    for(var i=0;i<rows.length;i++)
    if(rows[i].tesex==tesex)
        rst.push(rows[i]);
     $('#dg').datagrid('loadData',rst);
  }
 function ReloadData(){
     $('#dg').datagrid('reload');
 }
</script>
<script type="text/javascript">
   //搜索
	function searchFun() {
	    var options = $('#dg').datagrid('options');
	    var tenum = $('[name="tenum"]').val();
		//获取查询参数
		var tename=$('[name="tename"]').val();
		var tetitle=$('[name="tetitle"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getTeaByParam.action';
		options.queryParams = { 
		        tenum:tenum,
				tename:tename, 
				tetitle:tetitle
		};
		//触发搜索
		$('#dg').datagrid(options);
	}
	
	//重置
	function reloadFun() {
	   $("#tenum").val("");
		$("#tename").val("");
		$("#tetitle").val("");
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}

</script>
</head>
<body>
	<center>
		<table id="dg" title="教师信息" class="easyui-datagrid"
			style="width:1000px;height:500px"
			url="adminCommonAction!getTeacherData.action";
			toolbar="#toolbar" pagination="true" rownumbers="true"
			fitColumns="true" singleSelect="true"  collapsible="true"
			cache="false"
			>
			<thead>
				<tr>
					<th field="tenum" width="20">教师编号</th>
					<th field="tename" width="20">教师姓名</th>
					<th field="tesex" width="20">教师性别</th>
					<th field="tetitle" width="20">教师职称</th>
					<th field="temajor" width="20">教师专业</th>
				

				</tr>
			</thead>
		</table>
	</center>
	<div id="toolbar">
	<table data-options="fit:true,border:false">
			<tr>
				<td>教师编号</td>
				<td><input id="tenum" name="tenum" type="text" placeholder="请输入教师编号" class="span2" value=""/></td>
				<td>教师姓名</td>
				<td><input id="tename" name="tename" type="text" placeholder="请输入教师姓名" class="span2" value=""/></td>
				<td>教师职称</td>
				<td><input id="tetitle" name="tetitle" type="text" placeholder="请输入教师职称" class="span2" value=""/></td>
			
				</tr>
				
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newUser()">新增</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="removeUser()">删除</a> <a
			href="adminCommonAction!TeacherExportExcel.action"
			class="easyui-linkbutton" iconCls="icon-ok" plain="true">导出</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:500px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>
			<!-- 把ID隐藏着不显示，用于更新信息的情况 -->
			 <div id="sd" hidden="true" >  
				<label id="s"></label>
			</div>		
			<div class="fitem">
				<label>教师编号</label> <input name="tenum" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>教师姓名</label> <input name="tename" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>教师性别</label> <input name="tesex" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>教师职称</label> <input name="tetitle"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>教师专业</label> <input name="temajor" class="easyui-validatebox"
					required="true">
			</div>
			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>

</body>
</html>
<!--  -->