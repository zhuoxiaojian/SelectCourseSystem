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
<title>学生信息的管理</title>
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
			    'adminCommonAction!getStuMaxNum.action',
			    function(result){
			       $('#s').empty();
			       $('#sd').removeAttr("hidden");
			       $('#s').append("当前最大的学生编号为："+result.MaxNum);
			      
			    }
			  );
		$('#fm').form('clear');
		url = 'adminCommonAction!addstuMethod.action';
	}
	function editUser() {
		row = $('#dg').datagrid('getSelected');
		
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '编辑');
			$('#fm').form('load', row);
			url = 'adminCommonAction!editstuMethod.action';
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
						title : '失败',
					    msg : "添加失败"
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
					$.post('adminCommonAction!deletestuMethod.action?time='
							+ new Date().getTime(), {
						stunum : row.stunum
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
    var stusex = $('#stusex').val();
    for(var i=0;i<rows.length;i++)
    if(rows[i].stusex==stusex)
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
	    var stuname = $('[name="stuname"]').val();
		//获取查询参数
		var stunum=$('[name="stunum"]').val();
		var stuclass=$('[name="stuclass"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getStuByParam.action';
		options.queryParams = { 
		        stunum:stunum,
				stuname:stuname, 
				stuclass:stuclass
		};
		//触发搜索
		$('#dg').datagrid(options);
	}
	
	//重置
	function reloadFun() {
	   $("#stunum").val("");
		$("#stuname").val("");
		$("#stuclass").val("");
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}
</script>
</head>
<body>
	<center>
		
		<table id="dg" title="学生信息" class="easyui-datagrid"
			style="width:1000px;height:500px"
			url="adminCommonAction!getStudentData.action";
			toolbar="#toolbar" pagination="true" rownumbers="true"
			fitColumns="true" singleSelect="true"  collapsible="true">
			<thead>
				<tr>
					<th field="stunum" width="20">学生学号</th>
					<th field="stuname" width="20">学生姓名</th>
					<th field="stusex" width="20">学生性别</th>
					<th field="stubirth" width="20">出生日期</th>
					<th field="stuadim" width="20">入学日期</th>
					<th field="stumajor" width="20">学生专业</th>
					<th field="stuclass" width="20">所在班级</th>
					<th field="stucollege" width="20">所在院系</th>

				</tr>
			</thead>
		</table>
	</center>
	<div id="toolbar">
	<table data-options="fit:true,border:false">
			<tr>
				<td>学生编号</td>
				<td><input id="stunum" name="stunum" type="text" placeholder="请输入学生编号" class="span2" value=""/></td>
				<td>学生姓名</td>
				<td><input id="stuname" name="stuname" type="text" placeholder="请输入学生姓名" class="span2" value=""/></td>
				<td>所在班级</td>
				<td><input id="stuclass" name="stuclass" type="text" placeholder="请输入所在班级" class="span2" value=""/></td>
			
				</tr>
				
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newUser()">新增</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="removeUser()">删除</a> <a
			href="adminCommonAction!StudentExportExcel.action"
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
				<label>学生学号</label> <input name="stunum" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>学生姓名</label> <input name="stuname" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>学生性别</label> <input name="stusex" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>出生日期</label> <input name="stubirth"
					class="easyui-validatebox" required="true" onclick="setDay(this);">
			</div>
			<div class="fitem">
				<label>入学日期</label> <input name="stuadim" class="easyui-validatebox"
					required="true" onclick="setDay(this);">
			</div>
			<div class="fitem">
				<label>学生专业</label> <input name="stumajor"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>所在班级</label> <input name="stuclass"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>所在院系</label> <input name="stucollege"
					class="easyui-validatebox" required="true">
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