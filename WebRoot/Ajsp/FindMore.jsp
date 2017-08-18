<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Tleft.jsp' starting page</title>

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
	<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	 
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-3.3.5/css/bootstrap.css">
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap-3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	  /* $(document).ready(function(){ */
	  function GaiBian(){
	  var se = $('#entity option:selected').val();
	  if(se!==""){
	   var url = 'adminCommonAction!getColumnName.action';
	       $.post(
				    url,
				    {entity:se},
				             function(result) {
								if (result.success) {
								    $("#col").find("option").remove();
								   
									
									for(var i=0;i<result.string.length;i++){
									  $('#col').append("<option value='"+result.string[i]+"'>" + result.string[i]+ "</option>");
									}
								} else {
									$('#s').text("失败咯");
								}
							}, 'json');
							}else{
							
							$("#col").find("option").remove();
							
							}
							}
							/* }
							); */
							
			
	  	  function check(){
	  	   $('#s').empty();
	  	   var entity = $('#entity option:selected').val();
	  	   var cols = $('#col option:selected').val();
	  	   var condition = $("input[name='condition']").val();
	  	   var url = 'adminCommonAction!getObjData.action?time='+ new Date().getTime();
	  	   if(entity!=null){
	  	         $.post(
	  	              url,
	  	              {entity:entity,
	  	               cols:cols,
	  	               condition:condition},
	  	               function(result){
	  	                   if(result.success){	 
	  	                         $('#cou').empty();	             
	  	                         var len = result.total;
	  	                         var entity = $('#entity option:selected').val();
	  	                         var con = $("input[name='condition']").val();
	  	                         //alert(result.rows.toString());
	  	                         if(entity=='Student'){
	  	                        $('#s').append("<center><table id='ta'class='gridtable' border='1' width='80%' height='80%'><tr align='center'><th>学生编号</th><th>学生姓名</th><th>学生性别</th><th>入学日期</th><th>出生日期</th>"+
	  	                          "<th>专业</th><th>班级</th><th>院系</th></tr></table><span id='cou'></span><center>");
	  	                      
	  	                         $(result.rows).each(function (i, value) {  
                                          $('#ta').append("<tr align='center'>"+
	  	                          "<td>"+value.stunum+"</td><td>"+value.stuname+"</td><td>"+value.stusex+"</td><td>"+value.stuadim+"</td><td>"+value.stubirth+"</td><td>"+value.stumajor+"</td><td>"+value.stuclass+"</td><td>"+value.stucollege+"</td></tr>"
	  	                          ); 
                                  }); 
                                     $('#cou').append("共有"+result.rows.length+"条");
                                  }
	  	                        
	  	                          
	  	                          
	  	                          
	  	                          if(entity=='Course'){
	  	                          $('#s').append("<center><table id='ta' class='gridtable' border='1' width='80%' height='80%'><tr align='center'><th>课程编号</th><th>课程名称</th><th>课程类型</th><th>上课时间</th><th>上课地点</th>"+
	  	                          "<th>授课老师</th><th>学时</th><th>学分</th></tr></table><span id='cou'><center>");
	  	                  		  $(result.rows).each(function (i, value) {  
                                          $('#ta').append("<tr align='center'>"+
	  	                          "<td>"+value.cno+"</td><td>"+value.cname+"</td><td>"+value.ctype+"</td><td>"+value.ctime+"</td><td>"+value.cplace+"</td><td>"+value.teacher.tenum+"</td><td>"+value.chours+"</td><td>"+value.ccredit+"</td></tr>"
	  	                          ); 
                                  }); 
	  	                  		     $('#cou').append("共有"+result.rows.length+"条");  
	  	                  		    }if(entity=='Teacher'){
	  	                  		        $('#s').append("<center><table id='ta'class='gridtable' border='1' width='80%' height='80%'><tr align='center'><th>教师编号</th><th>教师姓名</th><th>教师性别</th><th>教师职称</th><th>教师专业</th>"+
	  	                          "</tr></table><span id='cou'><center>");
	  	                  		 $(result.rows).each(function (i, value) {  
                                          $('#ta').append("<tr align='center'>"+
	  	                          "<td>"+value.tenum+"</td><td>"+value.tename+"</td><td>"+value.tesex+"</td><td>"+value.tetitle+"</td><td>"+value.temajor+"</td></tr>"
	  	                          ); 
                                  }); 
	  	                  		     $('#cou').append("共有"+result.rows.length+"条"); 
	  	                  		    }if(entity=='SelectCourse'){
	  	                  		     
	  	                  		       $('#s').append("<center><table id='ta' class='gridtable' border='1' width='80%' height='80%'><tr align='center'><th>学生编号</th><th>学生姓名</th><th>课程编号</th><th>课程名称</th><th>课程成绩</th>"+
	  	                          "</tr></table><span id='cou'<center>");
	  	                  		     $(result.rows).each(function (i, value) {  
                                          $('#ta').append("<tr align='center'>"+
	  	                          "<td>"+value.id.student.stunum+"</td><td>"+value.id.student.stuname+"</td><td>"+value.id.course.cno+"</td><td>"+value.id.course.cname+"</td><td>"+value.result+"</td></tr>"
	  	                          ); 
                                  }); 
	  	                  		    
	  	                  		     $('#cou').append("共有"+result.rows.length+"条");
	  	                  		    }
	  	                   }
	   	               }
  	         );
	  	   };
	  	     
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

<body id="bo">
	<center>
		类名: <select name="entity" id="entity" onChange="GaiBian(this)">
		    <option value="" selected="selected"></option>
			<option value="Student">Student</option>
			<option value="Course">Course</option>
			<option value="Teacher">Teacher</option>
			<option value="SelectCourse">SelectCourse</option>
		</select>&nbsp;&nbsp; 
		列名: <select name="cols" id="col">
			
			
		</select>&nbsp;&nbsp;
                    条件:
           <input type="text" id="cond" name="condition" />&nbsp;&nbsp;
           <input type="button" value="查询" id="de" onclick="return check();"/>
	</center><hr>

	<span id="s"></span>
	<p id="p"></p>
</body>
</html>