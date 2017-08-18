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
	<title>课程信息管理 </title>
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
		function newUser(){
			$('#dlg').dialog('open').dialog('setTitle','新增');
			 $.post(
			    'adminCommonAction!getCouMaxNum.action',
			    function(result){
			      $('#s').empty();
			       $('#sd').removeAttr("hidden");
			       $('#s').append("当前最大的课程编号为："+result.MaxNum);
			      
			    }
			  );
			$('#fm').form('clear');
			url = 'adminCommonAction!addcourseMethod.action';
		}
		function editUser(){
			row = $('#dg').datagrid('getSelected');
			if (row){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('load',row);
				$('#cteacher').val(row.teacher.tenum);
				url = 'adminCommonAction!editcourseMethod.action';
			}
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						$('#dlg').dialog('close');		// close the dialog  关闭小窗口
						$('#dg').datagrid('reload');	// reload the user data  刷新数据显示
					} else if(result.fail) {
						$.messager.show({
							title: '课程编号已存在，发布失败',
							msg: "课程编号已存在，发布失败"
						});
					}else{
					  $.messager.show({
							title: '该教师不存在',
							msg: "该教师不存在"
						});
					
					}
				}
			});
		}
		function removeUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定要删除?',function(r){
					if (r){			
						$.post('adminCommonAction!deletecourseMethod.action?time='+new Date().getTime(),{cno:row.cno},function(result){
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
	<script>
    function formatTeacher(value){
        return value.tenum;
    };
     //搜索
	function searchFun() {
	    var options = $('#dg').datagrid('options');
	    var cno = $('[name="cno"]').val();
		//获取查询参数
		var cname=$('[name="cname"]').val();
		var ctype=$('[name="ctype"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getCouByParam.action';
		options.queryParams = { 
		        cno:cno,
				cname:cname, 
				ctype:ctype
		};
		//触发搜索
		$('#dg').datagrid(options);
	}
	
	//重置
	function reloadFun() {
	   $("#cno").val("");
		$("#cname").val("");
		$("#ctype").val("");
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}
</script>
</head>
<body>
	<center>
	
	<table id="dg" title="课程信息的管理" class="easyui-datagrid" style="width:1000px;height:500px"
			url="adminCommonAction!getCourseData.action"
			toolbar="#toolbar" pagination="true" collapsible="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="cno" width="20">课程编号</th>
				<th field="cname" width="20">课程名称</th>
				<th field="ctype" width="20">课程类型</th>
				<th field="teacher" width="20" formatter="formatTeacher">授课老师</th>
				<th field="ctime" width="20">上课时间</th>
				<th field="cplace" width="20">上课地点</th>
				<th field="chours" width="20">课程学时</th>
				<th field="ccredit" width="20">课程学分</th>
				
			</tr>
		
		</thead>
	</table>
	</center>
	<div id="toolbar">
	<table data-options="fit:true,border:false">
			<tr>
				<td>课程编号</td>
				<td><input id="cno" name="cno" type="text" placeholder="请输入课程编号" class="span2" value=""/></td>
				<td>课程名称</td>
				<td><input id="cname" name="cname" type="text" placeholder="请输入课程名称" class="span2" value=""/></td>
				<td>课程类型</td>
				<td><input id="ctype" name="ctype" type="text" placeholder="请输入课程类型" class="span2" value=""/></td>
				</tr>
				
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
		<a href="adminCommonAction!CourseExportExcel.action" class="easyui-linkbutton" iconCls="icon-ok" plain="true">导出</a>
	</div>
	
    <div id="dlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>	
		    <!-- 把ID隐藏着不显示，用于更新信息的情况 -->	
		    <div id="sd" hidden="true" >  
				<label id="s"></label>
			</div>		
			<div class="fitem" >  
				<label>课程编号</label>
				<input name="cno" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>课程名称</label>
				<input name="cname" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>课程类型</label>
				<input name="ctype" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>授课老师</label>
				<input name="cteacher" id="cteacher" class="easyui-validatebox"  required="true" >
			</div>
			<div class="fitem">
				<label>上课时间</label>
				<input name="ctime" class="easyui-validatebox" required="true" >
			</div>
			<div class="fitem">
				<label>上课地点</label>
				<input name="cplace" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>课程学时</label>
				<input name="chours" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>课程学分</label>
				<input name="ccredit" class="easyui-validatebox" required="true">
			</div>
			
		</form>
	</div>  
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div> 
</body>
</html>
