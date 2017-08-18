<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AStuCou.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/demo.css">
	
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
     
     <script type="text/javascript">
       function sele(){
         var se = $('#stype option:selected').val();
         if(se!=""){
	   var url = 'adminCommonAction!getSCParam.action';
	       $.post(
				    url,
				    {entity:se},
				             function(result) {
								if (result.success) {
								    $("#tiaojian").find("option").remove();
									 var se = $('#stype option:selected').val();
									 if(se=="Student"){
	  	                               $(result.list).each(function (i, value){
	  	                                  $("#tiaojian").append("<option value='"+value.stunum+"'>"+value.stunum+","+value.stuname+"</option>");
	  	                               });
	  	                             }if(se=="Course"){
	  	                                 $(result.list).each(function (i, value){
	  	                                  $("#tiaojian").append("<option value='"+value.cno+"'>"+value.cno+","+value.cname+"</option>");
	  	                               });
	  	                             }
	  	                         }								  
							}, 'json');
							}else{
							$("#tiaojian").find("option").remove();
							}
							
       }
     
     </script>
     
     <script type="text/javascript">
     function tijiao(){
       var se = $('#stype option:selected').val();
       var tj = $('#tiaojian option:selected').val();
       if(tj!=null||tj!=""){
           //alert(se+tj);
           $.post(
               'adminCommonAction!findSCInfo.action',
               {stype:se,tiaojian:tj},
               function(result){
                 if(result.success){
                   $('#ss').empty();
                       var se = $('#stype option:selected').val();
                       if(se=="Student"){
                          $('#ss').empty();
                       	  
                          $('#ss').append("<table border='1' class='gridtable' algin='center' id='stu' width='60%' heigth='50%'><tr algin='center'><th>学生编号</th><th>学生姓名</th><th>课程编号</th><th>课程名称</th><th>授课老师</th><th>课程成绩</th></tr></table>");
                          $(result.list).each(function(i,value){
                            $('#stu').append("<tr algin='center'><td>"+value.id.student.stunum+"</td><td>"+value.id.student.stuname+"</td><td>"+value.id.course.cno+"</td><td>"+value.id.course.cname+"</td><td>"+value.id.course.teacher.tenum+"</td><td>"+value.result+"</td></tr>");
                          
                          });
                          $('#ss').append("学生"+result.list.length+"条选课记录<br>");
                       }if(se=="Course"){
                            $('#ss').empty();
                           
                       	 	$('#ss').append("<table border='1' class='gridtable' algin='center' id='cou' width='60%' heigth='50%'><tr algin='center'><th>学生编号</th><th>学生姓名</th><th>学生专业</th><th>学生班级</th><th>学生院系</th></tr></table>");
                       		$(result.list).each(function(i,value){
                       		 $('#cou').append("<tr algin='center'><td>"+value.id.student.stunum+"</td><td>"+value.id.student.stuname+"</td><td>"+value.id.student.stumajor+"</td><td>"+value.id.student.stuclass+"</td><td>"+value.id.student.stucollege+"</td></tr>");
                       		});
                       		 $('#ss').append("课程总有"+result.list.length+"位学生选<br>");
                       }
                       
                 }//function if的外括号
               }, 'json'
           );
       }
     
     }
     </script>
<style type="text/css">  
table.gridtable {  
    font-family: verdana,arial,sans-serif;  
    font-size:11px;  
    color:#333333;  
    border-width: 1px;  
    border-color: #666666;  
    border-collapse: collapse;  
}  
table.gridtable th {  
    border-width: 1px;  
    padding: 8px;  
    border-style: solid;  
    border-color: #666666;  
    background-color: #dedede;  
}  
table.gridtable td {  
    border-width: 1px;  
    padding: 8px;  
    border-style: solid;  
    border-color: #666666;  
    background-color: #ffffff;  
}  
</style>
  </head>
  
  <body>
  <!--  <center>根据学生找到其已选的课程，根据课程找到选该课程的所有学生<hr></center> -->
   <center>请选择:<select name="stype" id="stype" onchange="sele(this);">
   				<option value="" selected="selected"></option>
                <option value="Student">Student</option>
   				<option value="Course">Course</option>
   </select>
    &nbsp;&nbsp;条件:<select name="tiaojian" id="tiaojian"></select>
   &nbsp;&nbsp;<input type="submit" value="查询" onclick="tijiao();"/>
   <hr>
   <span id="ss"></span>
   </center>
   
  </body>
</html>
