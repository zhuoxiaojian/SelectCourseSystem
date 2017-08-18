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
<title>学生选课</title>
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
	function xuanke() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm', '确定要选课?', function(r) {
				if (r) {
					$.post(
							'${pageContext.request.contextPath}/Select_Course.action?time='
									+ new Date().getTime(), {
								select : row.cno
							}, function(result) {
								if (result.success) {
									//$('#dg').datagrid('reload');
									// reload the user data
									$.messager.show({ // show error message
										title : '选课成功',
										msg : "恭喜你选课成功"
									});
								} else {
									//$('#dg').datagrid('reload');
									$.messager.show({ // show error message
										title : '选课失败',
										msg : "该课程已经选了"
									});
								}
							}, 'json');
				}
			});
		}
	}
</script>
<%-- <script>
    function formatTeacher(value){
        return value.tenum;
    };
</script> --%>
<script type="text/javascript">
	/*  function formatRadio(value, rowData, rowIndex){
	          return '<input type="radio" name="selectRadio" id="selectRadio"' + rowIndex + '    value="' + rowData.cno + '" />';
	      } */
	function cl() {
		var se = $('input:radio[name="selectRadio"]:checked').val();
		alert(se);
	}
	function look() {
		$('#dlg').dialog('open').dialog('setTitle', '教师信息');
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/Teacher_info.action",
						type : "post",
						dataType : "json",
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						data : {
							"tenum" : row.teacher.tenum
						},
						timeout : 5000,
						success : function(result) {
							if (result.success) {
								$('input[name="tenum"]').val(
										result.teacher.tenum);
								$('input[name="tename"]').val(
										result.teacher.tename);
								$('input[name="tesex"]').val(
										result.teacher.tesex);
								$('input[name="tetitle"]').val(
										result.teacher.tetitle);
								$('input[name="temajor"]').val(
										result.teacher.temajor);

							}
						},
						error : function(XMLHttpRequest, textStatus,
								errorThrown) {
							// 请求失败

							alert(XMLHttpRequest.status + "异常错误");

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
    if(param0=="cname"){
    for(var i=0;i<rows.length;i++)
    if(rows[i].cname.indexOf(param1)>-1){
        rst.push(rows[i]);
        $('#dg').datagrid('loadData',rst);
        }
     } if(param0=="cno"){
    for(var i=0;i<rows.length;i++)
    if(rows[i].cno.indexOf(param1)>-1){
        rst.push(rows[i]);
        $('#dg').datagrid('loadData',rst);
        }
     }
  }

 function ReloadData(){
     $('#dg').datagrid('reload');
 }
 
 
 //搜索
	function searchFun() {
	
		var options = $('#dg').datagrid('options');
		//获取查询参数
		var cno=$('[name="cno"]').val();
		var cname=$('[name="cname"]').val();
		var ctype=$('[name="ctype"]').val();
		//url 需要自己定义
		options.url = '${pageContext.request.contextPath}/adminCommonAction!getCourseByMoreParam.action';
		options.queryParams = { 
				cno: cno, 
				cname: cname, 
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
<body class="easyui-layout" data-options="fit:true,border:false">
	<center>
       <%--  <div id="searchtool" style="padding:5px" >
          <select id="param0" name="param0"  class="easyui-validatebox">
             <option value="cno" selected="selected">课程编号</option>
             <option value="cname">课程名称</option>
          </select>
			<input name="param1" id="param1" type="text" class="easyui-validatebox"/>
			<a href="javascript:FindData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'">查询</a>
				<a href="javascript:ReloadData()" class="easyui-linkbutton"
				data-options="iconCls:'icon-reload'">重载</a>
		</div> --%>
		<table id="dg" title="学生选课" class="easyui-datagrid"
			style="width:1000px;height:500px"
			url="adminCommonAction!getCourseData.action" toolbar="#toolbar"
			pagination="true" rownumbers="true" fitColumns="true"
			singleSelect="true" striped="true"
			collapsible="true"
			>
			<thead>
				<tr>
					<th field="cno" width="20">课程编号</th>
					<th field="cname" width="20">课程名称</th>
					<th field="ctype" width="20">课程类型</th>
					<th field="teacher.tenum" width="20">授课老师</th>
					<th field="ctime" width="20">上课时间</th>
					<th field="cplace" width="20">上课地点</th>
					<th field="chours" width="20">课程学时</th>
					<th field="ccredit" width="20">课程学分</th>
					<!-- <th field="radio" width="20" formatter="formatRadio">选课</th> -->
				</tr>

			</thead>
		</table>
	</center>
	<div id="toolbar" >
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
	
	
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true"
			onclick="look()">查看教师信息</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-ok" plain="true" onclick="xuanke()">选课</a>
	</div>


	<div id="dlg" class="easyui-dialog"
		style="width:500px;height:380px;padding:10px 20px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">教师信息</div>
		<form id="fm" method="post" novalidate>
			<!-- 把ID隐藏着不显示，用于更新信息的情况 -->
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
				<label>教师职称</label> <input name="tetitle" id="cteacher"
					class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>教师专业</label> <input name="temajor" class="easyui-validatebox"
					required="true">
			</div>

		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
			onclick="javascript:$('#dlg').dialog('close')">关闭</a>
	</div>

</body>
</html>
