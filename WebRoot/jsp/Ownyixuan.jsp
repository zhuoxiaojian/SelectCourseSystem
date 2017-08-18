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
<title>已选课程</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	var row;
	function editUser() {
		row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '详情');

			$('#cno').val(row.id.course.cno);
			$('#cname').val(row.id.course.cname);
			$('#ctime').val(row.id.course.ctime);
			$('#cplace').val(row.id.course.cplace);
			$('#tenum').val(row.id.course.teacher.tenum);
			$('#resul').val(row.result);
			url = 'adminCommonAction!ownTuiMethod.action';
		}
	}
	function saveUser() {
		$('#fm').form('submit', {
			url : url,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var resul = eval('(' + result + ')');
				$('#dlg').dialog('close');
				$('#dg').datagrid('reload'); // reload the user data  刷新数据显示
				$.messager.show({
					title : '操作',
					msg : resul.message
				});
			}
		});
	}
</script>
<script type="text/javascript">
	function FindData() {
		var rows = $('#dg').datagrid('getRows'), rst = [];
		var param0 = $('#param0').val();
		var param1 = $('#param1').val();
		if (param0 == "cname") {
			for ( var i = 0; i < rows.length; i++)
				if (rows[i].id.course.cname.indexOf(param1) > -1) {
					rst.push(rows[i]);
					$('#dg').datagrid('loadData', rst);
				}
		}
		if (param0 == "cno") {
			for ( var i = 0; i < rows.length; i++)
				if (rows[i].id.course.cno.indexOf(param1) > -1) {
					rst.push(rows[i]);
					$('#dg').datagrid('loadData', rst);
				}
		}
	}

	function ReloadData() {
		$('#param1').val("");
		$('#dg').datagrid('reload');
	}
</script>
</head>
<body>
	<center>



		<table id="dg" title="已选课程" class="easyui-datagrid"
			style="width:1200px;height:500px"
			url="adminCommonAction!getOwnCourse.action" toolbar="#toolbar"
			pagination="true" rownumbers="true" fitColumns="true"
			singleSelect="true" collapsible="true">
			<thead>
				<tr>
					<th field="id.course.teacher.tenum" width="20">教师编号</th>
					<th field="id.course.cno" width="20">课程编号</th>
					<th field="id.course.cname" width="20">课程名称</th>
					<th field="id.course.ctime" width="20">上课时间</th>
					<th field="id.course.cplace" width="20">上课地点</th>
					<th field="result" width="20">课程成绩</th>

				</tr>
			</thead>
		</table>
	</center>
	<div id="toolbar">
		<div id="searchtool" style="padding:5px">
			<select id="param0" name="param0" class="easyui-validatebox">
				<option value="cno" selected="selected">课程编号</option>
				<option value="cname">课程名称</option>
			</select> <input name="param1" id="param1" type="text"
				class="easyui-validatebox" /> <a href="javascript:FindData()"
				class="easyui-linkbutton" data-options="iconCls:'icon-search'"
				plain="true">查询</a> <a href="javascript:ReloadData()"
				class="easyui-linkbutton" data-options="iconCls:'icon-reload'"
				plain="true">重载</a>
		</div>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
			onclick="editUser()">详情</a>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:500px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>
			<!-- 把ID隐藏着不显示，用于更新信息的情况 -->
			<div class="fitem">
				<label>教师编号</label> <input name="tenum" id="tenum"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>课程编号</label> <input name="cno" id="cno"
					class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>课程名称</label> <input name="cname" id="cname"
					class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>上课时间</label> <input name="ctime" id="ctime"
					class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>上课地点</label> <input name="cplace" id="cplace"
					class="easyui-validatebox" readonly="readonly">
			</div>

			<div class="fitem">
				<label>课程成绩</label> <input name="resul" id="resul"
					class="easyui-validatebox" readonly="readonly">
			</div>


		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">退选</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
</body>
</html>
