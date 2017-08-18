<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestExcel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.js"></script>
   <script type="text/javascript">
     function check(){
       var en = $('#en option:selected').val();
       var fn = $('#fn').val();
       if(fn.length>1 && fn != ''){
        var lodt = fn.lastIndexOf(".");
        var type = fn.substring(lodt+1);
        if(type != "xls"){
            $("#fdiv").empty();
            $("#fdiv").append("<font color='red'>上传的文件必须为xls格式！</font>");
            return false;
        }else{
            $("#fdiv").empty();
            $.post(
              'importEntityAction!ImportData.action',
              {en:en,fn:fn},
              function(result){
                  if(result.success){
                     $("#fdiv").append("<font color='red'>恭喜你导入成功！</font>");
                     $("#idiv").empty();
           
                     if(result.msg=="Student"){
                      $("#idiv").empty();
                      
                         $("#idiv").append("<center><table id='tb' class='tb' border='1'><caption>添加的新数据</caption><tr><th>学生编号</th><th>学生姓名</th><th>学生性别</th><th>出生日期</th><th>入学日期</th><th>专业</th><th>班级</th><th>学院</th></tr></table></center>");
                          $(result.list).each(function (i, value) {  
                                          $("#tb").append("<tr align='center'>"+
	  	                          "<td>"+value.stunum+"</td><td>"+value.stuname+"</td><td>"+value.stusex+"</td><td>"+value.stuadim+"</td><td>"+value.stubirth+"</td><td>"+value.stumajor+"</td><td>"+value.stuclass+"</td><td>"+value.stucollege+"</td></tr>"
	  	                          ); 
                                  }); 
                           $("#idiv").append("<center>共有"+result.list.length+"条</center>");
                     }if(result.msg=="Course"){
                      $("#idiv").empty();
                        $("#idiv").append("<center><table id='tb' class='tb' border='1'><caption>添加的新数据</caption><tr><th>课程编号</th><th>课程名称</th><th>授课老师</th><th>课程类型</th><th>上课时间</th><th>上课地点</th><th>学时</th><th>学分</th></tr></table></center>");
                          $(result.list).each(function (i, value) {  
                                          $("#tb").append("<tr align='center'>"+
	  	                          "<td>"+value.cno+"</td><td>"+value.cname+"</td><td>"+value.teacher.tenum+"</td><td>"+value.ctype+"</td><td>"+value.ctime+"</td><td>"+value.cplace+"</td><td>"+value.chours+"</td><td>"+value.ccredit+"</td></tr>"
	  	                          ); 
                                  }); 
                           $("#idiv").append("<center>共有"+result.list.length+"条</center>");
                     
                     
                     }if(result.msg=="Teacher"){
                         $("#idiv").empty();
                        $("#idiv").append("<center><table id='tb' class='tb' border='1'><caption>添加的新数据</caption><tr><th>教师编号</th><th>教师姓名</th><th>教师性别</th><th>教师职称</th><th>教师专业</th></tr></table></center>");
                          $(result.list).each(function (i, value) {  
                                          $("#tb").append("<tr align='center'>"+
	  	                          "<td>"+value.tenum+"</td><td>"+value.tename+"</td><td>"+value.tesex+"</td><td>"+value.tetitle+"</td><td>"+value.temajor+"</td></tr>"
	  	                          ); 
                                  }); 
                           $("#idiv").append("<center>共有"+result.list.length+"条</center>");
                     
                     }
                  }else{
                     $("#fdiv").append("<font color='red'>恭喜你导入失败！</font>");
                  }
              }
            
            
            );
            return true;
        }
    }else{
        $("#fdiv").empty();
        $("#fdiv").append("<font color='red'>正式文本不能为空！</font>");
        return false;
    }
}
       
       
       
     
   
   
   </script>
 <style type="text/css">  
table.tb {  
    font-family: verdana,arial,sans-serif;  
    font-size:11px;  
    color:#333333;  
    border-width: 1px;  
    border-color: #666666;  
    border-collapse: collapse;  
}  
table.tb th {  
    border-width: 1px;  
    padding: 8px;  
    border-style: solid;  
    border-color: #666666;  
    background-color: #dedede;  
}  
table.tb td {  
    border-width: 1px;  
    padding: 8px;  
    border-style: solid;  
    border-color: #666666;  
    background-color: #ffffff;  
}  

.cdiv{
  width:780px;
  height:520;
  background-color: C9F5F5;

}
</style>
  </head>
  
  <body >
   <center>
   <div class="cdiv">
      <form action="importEntityAction!TestMethod.action" method="post" enctype="multipart/form-data">
     <input type="file" id="file" name="file"/>
     <input type="submit" value="上传到服务器"/>
    </form><hr> 
    <select id="en" name="EntityName">
       <option value="Student" selected="selected">学生信息</option>
       <option value="Course" >课程信息</option>
       <option value="Teacher">教师信息</option>
    </select>
    <input type="file" id="fn" name="fn"/>
    <input type="button" onclick=" return check();" value="导入" name="button"/>
    <hr>

    <div id="fdiv"></div>
    <div id="idiv"></div>
   
     </div>
    
    </center>
  </body>
</html>
