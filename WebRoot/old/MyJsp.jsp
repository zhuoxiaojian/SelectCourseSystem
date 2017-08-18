<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'error.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.font {
	font-size: 14px;
}

.odd {
	background-color: #D3EED2;
}

.even {
	background-color: #FDE6E8;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {

		// 初始化加载第一页json数据
		getData(1);

		//点击首页
		$("#homePage").click(function() {
			// 清除原来增加的TR
			clearData();

			getData(1);
			return false;
		});

		// 上一页
		$("#prePage").click(function() {
			// 清除原来增加的TR
			clearData();

			//获得当前页数
			var nowPage = $("#nowPage").text();
			getData(parseInt(nowPage) - 1);
			return false;
		});

		// 下一页
		$("#nextPage").click(function() {
			// 清除原来增加的TR
			clearData();

			//获得当前页数
			var nowPage = $("#nowPage").text();

			getData(parseInt(nowPage) + 1);
			return false;
		});

		// 最后一页
		$("#lastPage").click(function() {
			// 清除原来增加的TR
			clearData();

			//获得当前页数
			var totalPage = $("#totalPage").text();
			getData(totalPage);
			return false;
		});

		/*
		 *获得数据前先清除添加过的TR
		 */
		function clearData() {
			// 清除原来增加的TR,把大于第一行的数据都给清除
			$("#table tr:gt(0)").remove();
		}
		/*
		 * 通过Jquery ajax得到json数据
		 */
		function getData(nowPage) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/pageList.action",
						type : "post",
						data : {
							"page.nowPage" : nowPage,
							},
						dataType : "json",
						timeout : 5000,
						beforeSend : function() {

							// 正在加载数据
							$("#load").show();

						},
						success : function(data) {

							// 加载成功胡隐藏正在加载数据DIV
							$("#load").hide();

							//转换数据
							var data = eval("(" + data + ")");
							// 分页的数据
							var page = data.page;

							//设置分页的数据
							$("#totalSize").text(data.totalSize);
							$("#nowPage").text(page.nowPage);
							$("#totalPage").text(page.totalPage);
							$("#table tr:gt(1):eq(0)").remove();
							$.each(
											data.list,
											function(index, value) {
												// 取出返回的json数据
												var cno = value.cno;
												var cname = value.cname;
												var ctype = value.ctype;
												var ctime = value.ctime;
												var cteacher = value.teacher.tenum;
												var chours = value.chours;
												var ccredit = value.ccredit;
												var cplace = value.cplace;

												// 将返回的数据追加到表格中
												var cos_1 = "<tr align='center' id='tr' bgcolor='#FFFFFF' height='22'>";
												var cos_2 = "<td>" + cno
														+ "</td>";
												var cos_3 = "<td>"
														+ cname + "</td>";
												var cos_4 = "<td>" + ctype
														+ "</td>";
												var cos_5 = "<td>" + cplace
														+ "</td>";
												var cos_6 = "<td>" + ctime
														+ "</td>";
												var cos_7 = "<td>" + cteacher + "</td>";
												var cos_8 = "<td>" + chours + "</td>";
												var cos_9 = "<td>" + ccredit + "</td>";
												/* var cos_11 = "<td><input type='radio' value='"+cno+"'/></td>";  */
												var cos_10 = "</tr>";
												
												var newRow = cos_1 + cos_2
														+ cos_3 + cos_4 + cos_5
														+ cos_6 + cos_7 + cos_8 + cos_9 + cos_10;


												$("#table tr:last").after(
														newRow);

											});
						},
						error : function() {
							alert("读取数据失败。");
						}

					});
		}

	});
</script>

<script type="text/javascript">

$(document).ready(function(){
             $("#chaxun").bind("click",
                 function() {
    	// 初始化加载第一页json数据
		 getData(1);
		//点击首页
		$("#homePage").click(function() {
			// 清除原来增加的TR
			clearData();
			getData(1);
			return false;
		});

		// 上一页
		$("#prePage").click(function() {
			// 清除原来增加的TR
			clearData();
			//获得当前页数
			var nowPage = $("#nowPage").text();
			getData(parseInt(nowPage) - 1);
			return false;
		});

		// 下一页
		$("#nextPage").click(function() {
			// 清除原来增加的TR
			clearData();
			//获得当前页数
			var nowPage = $("#nowPage").text();
			getData(parseInt(nowPage) + 1);
			return false;
		});

		// 最后一页
		$("#lastPage").click(function() {
			// 清除原来增加的TR
			clearData();
			//获得当前页数
			var totalPage = $("#totalPage").text();
			getData(totalPage);
			return false;
		});

		/*
		 *获得数据前先清除添加过的TR
		 */
		function clearData() {
			// 清除原来增加的TR,把大于第一行的数据都给清除
			 $("#table tr:gt(0)").remove(); 
			//$("#table").find("tr").not($("#table").find("tr:first")).remove();
		}
		/*
		 * 通过Jquery ajax得到json数据
		 */
		function getData(nowPage) {
			$.ajax({
						url : "${pageContext.request.contextPath}/pageCanList.action",
						type : "post",
						data : {
							/* "page.nowPage" : nowPage, */
							"cono":$("input[name='str1']").val(),
							"cotype":$("input[name='str2']").val(),
							"cotime":$("input[name='str3']").val(),
						},
						dataType : "json",
						timeout : 5000,
						beforeSend : function() {
							// 正在加载数据
							$("#load").show();
						},
						success : function(data) {
							// 加载成功胡隐藏正在加载数据DIV
							$("#load").hide();
							//转换数据
							var data = eval("(" + data + ")");
							// 分页的数据
							var page = data.page;
							//设置分页的数据
							$("#totalSize").text(data.totalSize);
							$("#nowPage").text(page.nowPage);
							$("#totalPage").text(page.totalPage);
							//$("#table").find("tr").not($("#table").find("tr:first")).remove();
							 $("#table tr:gt(0)").remove();
							$.each(
											data.list,
											function(index, value) {
												// 取出返回的json数据
												var cno = value.cno;
												var cname = value.cname;
												var ctype = value.ctype;
												var ctime = value.ctime;
												var cteacher = value.teacher.tenum;
												var chours = value.chours;
												var ccredit = value.ccredit;
												var cplace = value.cplace;
												
												// 将返回的数据追加到表格中
												
												var cos_1 = "<tr align='center' id='tr' bgcolor='#FFFFFF' height='22'>";
												var cos_2 = "<td>" + cno
														+ "</td>";
												var cos_3 = "<td>"
														+ cname + "</td>";
												var cos_4 = "<td>" + ctype
														+ "</td>";
												var cos_5 = "<td>" + cplace
														+ "</td>";
												var cos_6 = "<td>" + ctime
														+ "</td>";
												var cos_7 = "<td>" + cteacher + "</td>";
												var cos_8 = "<td>" + chours + "</td>";
												var cos_9 = "<td>" + ccredit + "</td>";
												/* var cos_11 = "<td><input type='radio' value='"+cno+"'/></td>";  */
												var cos_10 = "</tr>";
												
												var newRow = cos_1 + cos_2
														+ cos_3 + cos_4 + cos_5
														+ cos_6 + cos_7 + cos_8 + cos_9 + cos_10;

												$("#table tr:last").after(
														newRow);

											});
											 

						},
						error : function() {
							alert("读取数据失败。");
						}

					});
		}
		
 
   });
});







</script>




</head>

<body background="<%=basePath%>image/bgimage.jpg" id="body">
  <center><h1>课程查询</h1></center>
   <center>课程编号：<input type="text" name="str1" id="str1"  />&nbsp;&nbsp;课程类型：<input type="text" name="str2" id="str2" />&nbsp;&nbsp;上课时间：<input type="text" name="str3" id="str3" />&nbsp;&nbsp;<input type="button" value="查询" id="chaxun"/></center>


	<!--  <div id="show">
		用来显示数据
	</div>  -->
	<table border="0" id="table" cellpadding="2" cellspacing="1"
		bgcolor="#D1DDAA" align="center" style="margin-top:8px">
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="150" height="25">课程编号</td>
			<td width="150" height="25">课程名称</td>
			<td width="150" height="25">课程类型</td>
			<td width="150" height="25">上课地点</td>
			<td width="150" height="25">上课时间</td>
			<td width="150" height="25">授课老师</td>
			<td width="150" height="25">课程学时</td>
			<td width="150" height="25">课程学分</td>
			<!-- <td width="150" height="25">选课</td> -->
		</tr>

	</table>

	<!-- 分页处理 -->
	<br/></br>
	<div align="center" >
		<div class="divfen">
			一共<label id="totalSize"></label>条数据 当前第[<label id="nowPage"></label>]页/共[<label
				id="totalPage"></label>]页 &nbsp;<a id="homePage" href="">首页</a> <a
				id="prePage" href="#">上一页</a> <a id="nextPage" href="#">下一页</a> <a
				id="lastPage" href="#">末页</a>
		</div>
	</div>

</body>
</html>
