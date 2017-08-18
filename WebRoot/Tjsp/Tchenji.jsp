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
	<title>成绩录入 </title>
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
				$('#stunum').val(row.id.student.stunum);
				$('#stuname').val(row.id.student.stuname);
				$('#cno').val(row.id.course.cno);
				$('#cname').val(row.id.course.cname);
				$('#tenum').val(row.id.course.teacher.tenum);
				$('#result').val(row.result);
				url = 'adminCommonAction!editResultMethod.action';
			}
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(data){
					
						$('#dlg').dialog('close');		// close the dialog  关闭小窗口
						$('#dg').datagrid('reload');	// reload the user data  刷新数据显示
				}
			});
		}
		
	</script>
	<script type="text/javascript">
  function FindData(){
    var rows=$('#dg').datagrid('getRows'),rst=[];
    var param0 = $('#param0').val();
    var param1 = $('#param1').val();
    if(param0=="stuname"){
    for(var i=0;i<rows.length;i++)
    if(rows[i].id.student.stuname.indexOf(param1)>-1){
        rst.push(rows[i]);
        $('#dg').datagrid('loadData',rst);
        }
     } if(param0=="stunum"){
    for(var i=0;i<rows.length;i++)
    if(rows[i].id.student.stunum.indexOf(param1)>-1){
        rst.push(rows[i]);
        $('#dg').datagrid('loadData',rst);
        }
     }
  }

 function ReloadData(){
     $('#param1').val("");
     $('#dg').datagrid('reload');
 }
</script>
</head>
<body>
	<center>
	
	<table id="dg" title="成绩录入" class="easyui-datagrid" style="width:1000px;height:500px"
			url="adminCommonAction!getResultData.action"
			toolbar="#toolbar" pagination="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
			    <th field="id.course.teacher.tenum" width="20">教师编号</th>
			    <th field="id.student.stunum" width="20" >学生编号</th>
			    <th field="id.student.stuname" width="20">学生姓名</th>
				<th field="id.course.cno" width="20">课程编号</th>
				<th field="id.course.cname" width="20">课程名称</th>
				<th field="result" width="20">课程成绩</th>
				
			</tr>
		</thead>
	</table>
	</center>
	<div id="toolbar">
	    
	<div id="searchtool" style="padding:5px" >
          <select id="param0" name="param0"  class="easyui-validatebox">
             <option value="stunum" selected="selected">学生编号</option>
             <option value="stuname">学生姓名</option>
          </select>
			<input name="param1" id="param1" type="text" class="easyui-validatebox"/>
			<a href="javascript:FindData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" plain="true">查询</a>
				<a href="javascript:ReloadData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-reload'" plain="true">重载</a>
		</div>
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
	</div>
	
    <div id="dlg" class="easyui-dialog" style="width:500px;height:380px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>	
		    <!-- 把ID隐藏着不显示，用于更新信息的情况 -->		
			<div class="fitem" >  
				<label>教师编号</label>
				<input name="tenum" id="tenum" class="easyui-validatebox" readonly="readonly" required="true">
			</div>
			<div class="fitem">
				<label>学生编号</label>
				<input name="stunum" id="stunum" class="easyui-validatebox" readonly="readonly" required="true">
			</div>
			<div class="fitem">
				<label>学生姓名</label>
				<input name="stuname" id="stuname" class="easyui-validatebox" readonly="readonly" required="true">
			</div>
			<div class="fitem">
				<label>课程编号</label>
				<input name="cno" id="cno" class="easyui-validatebox" readonly="readonly" required="true">
			</div>
			<div class="fitem">
				<label>课程名称</label>
				<input name="cname" id="cname" class="easyui-validatebox" readonly="readonly" required="true" >
			</div>
			<div class="fitem">
				<label>课程成绩</label>
				<input name="result" id="result" class="easyui-validatebox" required="true">
			</div>
			
			
		</form>
	</div>  
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div> 
</body>
</html>
