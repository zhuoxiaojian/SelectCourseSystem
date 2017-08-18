<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'resultcheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	 
  <script type="text/javascript">
    function GaiBian(){
      var selc =  $('#selCondition option:selected').val();
      if(selc=="selcno"){
        $('#s').empty();
           $.post(
             '${pageContext.request.contextPath}/adminCommonAction!getStuCourse.action',
              function(data){
                if(data.success){
                  $('#selJuti').find("option").remove();
                  $(data.list).each(function (i, value) {  
                    $('#selJuti').append("<option value='"+value.id.course.cno+","+value.id.course.cname+"'>"+value.id.course.cno+","+value.id.course.cname+"</option>");
                 });
                }
              }
           );
      }if(selc=="selstuclass"){
       $('#s').append("<select id='cu' name='cu'></select>");
           $.post(
           '${pageContext.request.contextPath}/adminCommonAction!getStuStuclass.action',
           function(data){
             if(data.success){
                  $('#selJuti').find("option").remove();
                   $('#selJuti').append("<option selected='selected' value='"+data.stuclass+"'>"+data.stuclass+"</option>");
                   var selstuclass = $('#selJuti option:selected').val();
         $.post(
             '${pageContext.request.contextPath}/adminCommonAction!getSameClassCourse.action',
             {stuclass:selstuclass},
             function(data){
                if(data.success){
                    $('#cu').find("option").remove();
                    $(data.list).each(function(i,value){
                        $('#cu').append("<option value='"+value.id.course.cno+","+value.id.course.cname+"'>"+value.id.course.cno+","+value.id.course.cname+"</option>");
                    });
                }
             } 
         );
             
             }
           }
           );
        
        
      }if(selc==""){
          $('#s').empty();
          $('#selJuti').find("option").remove();
      }
    }  
  </script>
  <script type="text/javascript">
  function work(){
     var selc =  $('#selCondition option:selected').val();
     var selJuti = $('#selJuti option:selected').val();
     var cu =  $('#cu option:selected').val();
     var params ;
     if(selc!=""&&selJuti!=""){
     if(cu==""){
        params = {selc:selc,selJuti:selJuti};
     }else{
         params = {selc:selc,selJuti:selJuti,cu:cu};
     }
          $.post(
             '${pageContext.request.contextPath}/adminCommonAction!SortResult.action',
              params,
             function(data){
                   if(data.success){
                       $('#dd').empty();
                        $('#dd').append("<center><table id='ta' class='gridtable' border='1' width='80%' height='80%'><tr align='center'><th>排名</th><th>学生编号</th><th>学生姓名</th><th>班级</th><th>课程编号</th><th>课程名称</th><th>课程成绩</th>"+
	  	                          "</tr></table><span id='cou'<center>");
	  	                 $(data.list).each(function(i,value){
	  	                      $('#ta').append("<tr align='center'>"+
	  	                          "<td>"+(i+1)+"</td><td>"+value.id.student.stunum+"</td><td>"+value.id.student.stuname+"</td><td>"+value.id.student.stuclass+"</td><td>"+value.id.course.cno+"</td><td>"+value.id.course.cname+"</td><td>"+value.result+"</td></tr>"
	  	                          ); 
	  	                 });
                   }
             }
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
    <center>
       <b>排名方式:</b>&nbsp;
       <select id="selCondition" name="selConditions" onChange="GaiBian(this)">
           <option value="" selected="selected">--请选择--</option>
           <option value="selcno">单科排名</option>
           <option value="selstuclass">班级排名</option>
       </select>
       <select id="selJuti" name="selJutis">
       </select>
       <span id="s"></span>
       <input type="button" value="查询" onclick="work();"/><hr>
     <div id="dd"></div>
    </center>
  </body>
</html>
