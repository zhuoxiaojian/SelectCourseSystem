<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

<body >  
<marquee direction="up" behavior="scroll" contenteditable="true" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="200" height="50%" onmouseover="this.stop();" onmouseout="this.start();"> 

 <div class="tzlist" id="tzlist" style="white-space: normal; margin-top: 4px; overflow: hidden; width: 290px; height: 280px;">
        <ul>
           <li class="time"> <p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16029.htm" target="_blank">“学者视野——周末科技文化艺术系列讲座”第657...</a></li>
       
        </ul>
        <ul>
           <li class="time"> <p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16027.htm" target="_blank">关于近期注意防范诺如病毒的温馨提示</a></li>
       
        </ul>
        <ul>
           <li class="time"> <p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16024.htm" target="_blank">关于重新核准我校学科专业调整后教学科研和教辅...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">14</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="nry.jsp?urltype=news.NewsContentUrl&wbtreeid=1040&wbnewsid=16019" target="_blank">出访公示</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">14</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16018.htm" target="_blank">关于报送办公电话信息的通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">14</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16017.htm" target="_blank">关于2017年第48次全国计算机等级考试准考证自行...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">13</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16015.htm" target="_blank">关于推荐我校2017年度“万人计划”教学名师人选...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">13</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16012.htm" target="_blank">2017年第一季度医药费报销时间的通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">13</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16011.htm" target="_blank">关于公布2016-2017学年度第二学期“无会周”安排...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">13</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16009.htm" target="_blank">关于建立广东技术师范学院中央支持地方高校改革...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">10</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16008.htm" target="_blank">关于更新完善校园网二级网站建设的紧急通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">10</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/16006.htm" target="_blank">转发：关于组织申报2017年广东省档案局科研项目...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">09</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15999.htm" target="_blank">“学者视野——周末科技文化艺术系列讲座”第655...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15996.htm" target="_blank">关于调整学术委员会及下设专门委员会成员的通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15995.htm" target="_blank">关于报送科级机构设置现状及拟设方案的通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15993.htm" target="_blank">关于报送2017年度实验耗材计划和实验教学仪器设...</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15992.htm" target="_blank">关于使用财政经费采购科研办公设备的通知</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15990.htm" target="_blank">2016年度考核结果公示</a></li>
       
        </ul>
        <ul>
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15989.htm" target="_blank">关于《计算机应用基础》课程的补考通知</a></li>
       
        </ul>
        <ul class="tzlast">
           <li class="time"><p class="dd">08</p><p class="mm">2017/03</p>            </li>
          <li class="tzcon"><a href="info/1040/15988.htm" target="_blank">关于做好我校2017年高等学校教师资格认定工作的...</a></li>
       
        </ul>
  </div>

</marquee>
</body> 
</html>
