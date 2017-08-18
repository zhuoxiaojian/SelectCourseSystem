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
	<title>选课管理 </title>
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
				$('#stuclass').val(row.id.student.stuclass);
				$('#cno').val(row.id.course.cno);
				$('#cname').val(row.id.course.cname);
				$('#cteacher').val(row.id.course.teacher.tenum);
				$('#result').val(row.result);
				url = 'adminCommonAction!editscMethod.action';
			}
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){   
						$('#dlg').dialog('close');		// close the dialog  关闭小窗口
						$('#dg').datagrid('reload');	// reload the user data  刷新数据显示
				}
			});
		}
		function removeUser(){
			var row = $('#dg').datagrid('getSelected');
			if (row){
				$.messager.confirm('Confirm','确定要删除?',function(r){
					if (r){			
						$.post('adminCommonAction!deletescMethod.action?time='+new Date().getTime(),{stunum:row.id.student.stunum,cno:row.id.course.cno},function(result){
							if (result.success){
								$('#dg').datagrid('reload');
									// reload the user data
									
							} else {
							    $('#dg').datagrid('reload');
								$.messager.show({	// show error message
									title: '删除失败',
									msg : "删除失败"
								});
							}
						},'json');
					}
				});
			}
		}
		
		
		
	</script>
	
	<script type="text/javascript">
  function FindData(){
    var rows=$('#dg').datagrid('getRows'),rst=[];
    var param0 = $('#param0').val();
    var param1 = $('#param1').val();
    if(param0=="stunum"){
       for(var i=0;i<rows.length;i++)
        if(rows[i].id.student.stunum.indexOf(param1)>-1){
          rst.push(rows[i]);
          $('#dg').datagrid('loadData',rst);
        }
     } 
     
     if(param0=="cno"){
        for(var i=0;i<rows.length;i++)
        if(rows[i].id.course.cno.indexOf(param1)>-1){
           rst.push(rows[i]);
           $('#dg').datagrid('loadData',rst);
        }
     }
  }

 function ReloadData(){
     $('#dg').datagrid('reload');
 }
</script>
	<script type="text/javascript">
   //搜索
	function searchFun() {
	    var options = $('#dg').datagrid('options');
	    var cno = $('[name="cno1"]').val();
		//获取查询参数
		var stunum=$('[name="stunum1"]').val();
	
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getASCByParam.action';
		options.queryParams = { 
		        stunum:stunum,
				cno:cno
				
		};
		//触发搜索
		$('#dg').datagrid(options);
	}
	
	//重置
	function reloadFun() {
	   $("#stunum1").val("");
		$("#cno1").val("");
	
		//刷新查询
		$('#dg').datagrid('reload');
		$('#dg').datagrid('clearChecked');
	}

</script>
</head>
<body>
	<center>
<table id="dg" title="选课管理及成绩维护" class="easyui-datagrid" style="width:1000px;height:500px"
			url="adminCommonAction!getSelectedCourseData.action" toolbar="#toolbar" 
		   pagination="true"rownumbers="true" fitColumns="true"
		    singleSelect="true"  collapsible="true"
		    >
		<thead>
			<tr>
				<th field="id.student.stunum" width="20" >学生编号</th>
				<th field="id.student.stuname" width="20" >学生姓名</th>
				<th field="id.student.stuclass" width="20" >所在班级</th>
				<th field="id.course.cno" width="20" >课程编号</th>
				<th field="id.course.cname" width="20" >课程名称</th>
				<th field="id.course.teacher.tenum" width="20" >授课老师</th>
				<th field="result" width="20">课程成绩</th>
				
			</tr>
		
		</thead>
	</table>
	</center>
	<div id="toolbar">
	<table data-options="fit:true,border:false">
			<tr>
				<td>学生编号</td>
				<td><input id="stunum1" name="stunum1" type="text" placeholder="请输入学生编号" class="span2" value=""/></td>
				<td>课程编号</td>
				<td><input id="cno1" name="cno1" type="text" placeholder="请输入课程编号" class="span2" value=""/></td>
				</tr>
				
		</table>
		<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>
		<a onclick="reloadFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">重置</a>
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
		<a href="adminCommonAction!SCInfoExportExcel.action" class="easyui-linkbutton" iconCls="icon-ok" plain="true">导出</a>
	</div>
	
    <div id="dlg" class="easyui-dialog" style="width:400px;height:300px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons" >
		<div class="ftitle">操作</div>
		<form id="fm" method="post" novalidate>	
		    <!-- 把ID隐藏着不显示，用于更新信息的情况 -->		
			<div class="fitem" >  
				<label>学生编号</label>
				<input name="stunum" id="stunum" class="easyui-validatebox" readonly="readonly" >
			</div>
			<div class="fitem">
				<label>学生名称</label>
				<input name="stuname" id="stuname" class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem" >  
				<label>课程编号</label>
				<input name="cno" id="cno" class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>课程名称</label>
				<input name="cname" id="cname" class="easyui-validatebox" readonly="readonly">
			</div>
			<div class="fitem">
				<label>授课老师</label>
				<input name="cteacher" id="cteacher" class="easyui-validatebox" readonly="readonly">
			</div>
			
			<div class="fitem">
				<label>课程成绩</label>
				<input name="result" id="result" class="easyui-validatebox" required="true" >
			</div>
			
		</form>
	</div>  
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div> 
	
	
    
</body>
</html>
